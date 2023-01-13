<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class PostController extends FrontController
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Post sayfasını görüntüler
     */
    public function show($lang, $slug, Request $request)
    {
        /*
        * Blocks URLs that are too long or too short
        * as a general security measure
        * */
        if(mb_strlen($slug) > 90 || mb_strlen($slug) < 2)
            abort(400);

        /*
        * Searches the requested URL
        * in the language table and returns the corresponding post
        * */
        $post = Post::whereTranslation('slug', $slug)
            ->website($this->data['website']->id)->first();

        /*
        * Returns an error if the post requested
        * by the user is not found
        * */
        if(empty($post))
            abort(404);

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

        if(isset($previousUrl['query']))
            $previousQuery = '?'.$previousUrl['query'];

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

        $this->data['postsPaginator'] = Post::select('id', 'title', 'image', 'slug', 'post_category_id', 'excerpt', 'created_at')
            ->ordered()
            ->wherePostCategoryId($this->data['currentList']->id)
            ->paginate(8);

        $this->data['posts'] = $this->data['postsPaginator']->translate(app()->getLocale());

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

        if(mb_strlen($searchKey) > 100 || mb_strlen($searchKey) < 3)
            abort(400);

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
