<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Controllers\Shared\FeaturedContent;

class PostController extends FrontController
{
    /**
     * An instance of the FeaturedContent class that has been initiated
     * with the current page's model class.
     *
     * @var FeaturedContent
     */
    protected FeaturedContent $featuredContent;

    /**
     * An object that stores the settings related to the structure
     * of the current page.
     *
     * @var object
     */
    protected object $structureSettings;

    public function __construct() {
        parent::__construct();

        // Definitions required for the differences of this structure from others
        $this->structureSettings = (object) [
            'mainRouteName' => 'all',
            'detailRouteName' => 'post',
        ];

        // For helper methods that we will configure this class
        $this->featuredContent = new FeaturedContent(\App\Models\Post::class);

        // Send the structure definitions to view
        $this->data['structureSettings'] = $this->structureSettings;
    }

    /**
     * Post sayfasını görüntüler
     */
    public function show ($lang, $slug, Request $request) {
        /*
        * Blocks URLs that are too long or too short
        * as a general security measure
        * */
        if (mb_strlen($slug) > 90 || mb_strlen($slug) < 2) {
            abort(400);
        }

        /*
        * Searches the requested URL
        * in the language table and returns the corresponding post
        * */
        $post = Post::whereTranslation('slug', $slug)
            ->website($this->data['website']->id)
            ->with('translations')
            ->first();

        if ($post->getTranslatedAttribute('status', app()->getLocale(), 'tr') != 1) {
            return redirect(url(app()->getLocale()));
        }

        /*
        It prepares the language equivalents of this page
        directly for the language change.
        These language equivalents are prepared
        for the use of hreflang for seo purposes.
        */
        $this->data['translationsCurrentPage'] = [];
        foreach (\Config::get('app.available_locales') as $langKey => $langVal) {
            $this->data['translationsCurrentPage'][$langKey] = (object) [
                'route' => route('post', [
                    'lang' => $langKey,
                    'slug' => $post->getTranslatedAttribute('slug', $langKey, 'tr')
                ]),
                'title' => $post->getTranslatedAttribute('title', $langKey, 'tr'),
                'language' => $langVal,
            ];

            if ($post->getTranslatedAttribute('status', $langKey, 'tr') != 1) {
                $this->data['translationsCurrentPage'][$langKey] = (object) [
                    'route' => route('home', [
                        'lang' => $langKey,
                    ]),
                    'title' => $this->data['websiteTranslations']->getTranslatedAttribute('seo_title', $langKey, 'tr'),
                    'language' => $langVal,
                ];
            }
        }

        /*
        * Returns an error if the post requested
        * by the user is not found
        * */
        if (empty($post)) {
            abort(404);
        }

        /**
         * Save visit
         */
        $post->visit();

        /*
        * Fetch localized content based on user selection
        * */
        $this->data['post'] = $post->translate(app()->getLocale());

        /*
        * Redirect post to different url
        * */
        if(mb_strlen($this->data['post']->redirect_url) > 5) {
            return redirect($this->data['post']->redirect_url);
        }

        /*
        * If the post has been reached somehow,
        * but the url is incorrect,
        * it will redirect to the main url.
        * */
        $previousUrl = parse_url(url()->previous());
        $previousQuery = '';

        if (isset($previousUrl['query'])) {
            $previousQuery = '?'.$previousUrl['query'];
        }

        if($this->data['post']->slug != $slug) {
            return redirect(
                route(
                    'post',
                    [
                        'lang' => app()->getLocale(),
                        'slug' => $this->data['post']->slug
                    ]
                ).$previousQuery);
        }

        // Set the table of contents and the body of the post.
        list(
            $this->data['toc'],
            $this->data['post']->body
        ) = $this->featuredContent->createTocWithBody($this->data['post']->body);

        // Delete table of contents if title tag is not detected
        if (count($this->data['toc']->dataToc) <= 0) {
            unset($this->data['toc']);
        }

        /*
        * Activates features used in the body area
        * */
        $this->bodyEngine('post');

        /*
        * Detect posts with custom structure
        * */
        return view('front.pages.post', $this->data);
    }

    /**
     * Gelen category->slug değerine göre aynı kategorideki post list
     */
    public function categories($lang, $slug, Request $request) {
        $currentList = Category::select('id','title', 'slug', 'parent_id')
            ->whereTranslation('slug', $slug)->first();

        /**
         * Custom bilgiler eklemek için translate işlevinden önce
         * setAttribute ile objeye ekleme yapabilirsiniz
         */
        $currentList->setAttribute('pageType', __('site.category'));

        /**
         * Paginator, attribute vb işlemler için translate işlevi
         * işlemlerden sonra çağrılır
         */
        $this->data['currentList'] = $currentList->translate(app()->getLocale());

        $this->data['postsPaginator'] = Post
            ::select('id', 'title', 'image', 'slug', 'post_category_id', 'excerpt', 'created_at')
            ->ordered()
            ->wherePostCategoryId($this->data['currentList']->id)
            ->paginate(8);

        $this->data['posts'] = $this->data['postsPaginator']->translate(app()->getLocale());

        $pageNumber = $this->data['postsPaginator']->currentPage();

        /*
        It prepares the language equivalents of this page
        directly for the language change.
        These language equivalents are prepared
        for the use of hreflang for seo purposes.
        */
        $this->data['translationsCurrentPage'] = [];
        foreach (\Config::get('app.available_locales') as $langKey => $langVal) {
            $routeParams = [
                'lang' => $langKey,
                'slug' => $currentList->getTranslatedAttribute('slug', $langKey, 'tr')
            ];

            $title = $currentList->getTranslatedAttribute('title', $langKey, 'tr');

            if ($pageNumber > 1) {
                $routeParams['page'] = $pageNumber;
                $title .= ' | ' . $pageNumber;
            }

            $this->data['translationsCurrentPage'][$langKey] = (object) [
                'route' => route('category', $routeParams),
                'title' => $title,
                'language' => $langVal,
            ];
        }

        return view('front.pages.list', $this->data);
    }

    /**
     * Gelen tag->slug değerine göre aynı etiketteki post list
     */
    public function tags($lang, $slug, Request $request) {
        $currentList = Tag::select('id','title', 'slug')
            ->whereTranslation('slug', $slug)->first();

        /**
         * Custom bilgiler eklemek için translate işlevinden önce
         * setAttribute ile objeye ekleme yapabilirsiniz
         */
        $currentList->setAttribute('pageType', __('site.tag'));

        /**
         * Paginator, attribute vb işlemler için translate işlevi
         * işlemlerden sonra çağrılır
         */
        $this->data['currentList'] = $currentList->translate(app()->getLocale());

        $this->data['postsPaginator'] = $currentList->posts()->paginate(8);

        $this->data['posts'] = $this->data['postsPaginator']->translate(app()->getLocale());

        $pageNumber = $this->data['postsPaginator']->currentPage();

        /*
        It prepares the language equivalents of this page
        directly for the language change.
        These language equivalents are prepared
        for the use of hreflang for seo purposes.
        */
        $this->data['translationsCurrentPage'] = [];
        foreach (\Config::get('app.available_locales') as $langKey => $langVal) {
            $routeParams = [
                'lang' => $langKey,
                'slug' => $currentList->getTranslatedAttribute('slug', $langKey, 'tr')
            ];

            $title = $currentList->getTranslatedAttribute('title', $langKey, 'tr');

            if ($pageNumber > 1) {
                $routeParams['page'] = $pageNumber;
                $title .= ' | ' . $pageNumber;
            }

            $this->data['translationsCurrentPage'][$langKey] = (object) [
                'route' => route('tag', $routeParams),
                'title' => $title,
                'language' => $langVal,
            ];
        }

        return view('front.pages.list', $this->data);
    }

    /**
     * Yapılan arama terimine göre post list
     * Sayfalar, postlar vb için daha kapsamlı bir arama sistemi için
     * öncelikle SearchController'ı kendi başına bir class olarak buradan çıkarın
     * Sonrasında farklı arama querylerinin sonuçlarını bir objede toplayın ve sayfalayın
     */
    public function search($lang, Request $req) {
        $searchKey = $req->input('search');

        if(mb_strlen($searchKey) > 100 || mb_strlen($searchKey) < 1) {
            abort(400);
        }

        $this->data['postsPaginator'] = Post::ordered()
            ->whereTranslation('title', 'LIKE', '%'. $searchKey .'%')
            ->orWhere(function($query) use ($searchKey){
                $query->whereTranslation('excerpt', 'LIKE', '%'. $searchKey .'%');
            })
            ->orWhere(function($query) use ($searchKey){
                $query->whereTranslation('body', 'LIKE', '%'. $searchKey .'%');
            })
            ->paginate(8)
            ->appends(request()->query());

        $this->data['posts'] = $this->data['postsPaginator']->translate(app()->getLocale());

        $this->data['currentList'] = (object) [
            'title' => __('site.search'),
            'pageType' => __('site.search'),
            'meta_description' => __('site.search'),
        ];

        return view('front.pages.list', $this->data);
    }
}
