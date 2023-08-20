<?php

namespace App\Http\Controllers\Shared;

use Illuminate\Http\Request;
use TCG\Voyager\Translator\Collection as VoyagerCollection;
use TCG\Voyager\Translator as VoyagerTranslator;
use App\Models\Part;
use Illuminate\Http\RedirectResponse;
use App\Http\Controllers\Shared\Toc;

/**
 * A class that handles featured content related functions.
 * @category  Controller
 * @package   App\Http\Controllers\Shared
 */
class FeaturedContent extends \App\Http\Controllers\Controller
{
    /*
    * The underlying model instance of the post.
    * @var App\Models\Part
    */
    protected $model;

    /*
    * Basic operation field such as title,
    * name surname defined in the table
    * @var string
    */
    protected $masterNamingKey;

    /**
     * Constructor that initializes $model.
     *
     * @param App\Models$model $model The model instance to use
     * @return void
     */
    public function __construct($model, $masterNamingKey = 'title')
    {
        $this->model = $model;
        $this->masterNamingKey = $masterNamingKey;
    }

    /**
     * Blocks URLs or search keys that are too long or too short
     * as a general security measure
     *
     * @param string $input  The input string to be checked for length restrictions
     * @param int    $min    The miminum allowed length for $input
     * @param int    $max    The maximum allowed length for $input
     * @return void
     */
    public function checkInsufficientInput($input, $min = 2, $max = 90)
    {
        if (mb_strlen($input) < $min || mb_strlen($input) > $max) {
            abort(400);
        }
    }

    /**
     * Retrieves the previous and next posts for a given post id
     *
     * @param int $currentPostId The id of the current post
     * @return array An array containing the previous and next posts, respectively
     */
    public function prevNextPosts(int $currentPostId): array
    {
        // Get all posts sorted by `id` ascending
        $allPosts = $this->model::orderBy('id', 'desc')->get();

        // Find the index of the current post
        $currentPostIndex = $allPosts->search(function ($post) use ($currentPostId) {
            return $post->id === $currentPostId;
        });

        // Assign the previous and next posts
        return [
            $allPosts->get($currentPostIndex - 1),
            $allPosts->get($currentPostIndex + 1)
        ];
    }

    /**
     * Searches the requested URL in the language table and returns
     * the corresponding post
     *
     * @param string $slug The url slug of the post requested
     * @return TCG\Voyager\Translator The translated post model associated with $slug
     */
    public function getPost(string $slug) : VoyagerTranslator
    {
        $post = $this->model::whereTranslation('slug', $slug)->first();

        /*
        * Returns an error if the post requested
        * by the user is not found
        * */
        if (empty($post)) {
            abort(404);
        }

        // Fetch localized content based on user selection
        return $post->translate(app()->getLocale());
    }

    /**
     * Searches the requested URL in the language table and returns
     * the corresponding localized post and unlocalized post
     *
     * @param string $slug The url slug of the post requested
     * @return array The translated post model associated with $slug
     */
    public function getPostWithRaw(string $slug) : array
    {
        $postRaw = $this->model::whereTranslation('slug', $slug)->first();

        /*
        * Returns an error if the post requested
        * by the user is not found
        * */
        if (empty($postRaw)) {
            abort(404);
        }

        // Fetch localized content based on user selection
        return [
            $postRaw,
            $postRaw->translate(app()->getLocale())
        ];
    }

    /**
     * Returns the parts with the specified ids.
     *
     * @param array $partIds The list of part ids.
     * @return TCG\Voyager\Translator\Collection The parts that have the specified ids.
     */
    public function getParts(array $partIds): VoyagerCollection
    {
        return Part
            ::whereIn('id', $partIds)
            ->get()
            ->translate(app()->getLocale())->keyBy('id');
    }

    /**
     * Creates a TOC (table of contents) from the given body
     * text and returns an array containing the TOC and the body text.
     *
     * @param string $body The body text to use for creating the TOC
     * @return array An array containing the TOC and the body text concatenated
     */
    public function createTocWithBody(string $body): array
    {
        $tocWithContents = new Toc($body);

        return [
            $tocWithContents->getToc(),
            $tocWithContents->getPost()
        ];
    }

    /**
     * Returns three similar posts based on the queried post's title similarity
     * and returns the related models in translated format.
     *
     * @param TCG\Voyager\Translator $postCollection   The queried post's model
     * @param float $minSimilarityPercentage Min similarity percentage required for a post to be considered as similar
     * @return TCG\Voyager\Translator\Collection   The collection of similar posts models, translated
     */
    public function getSimilars(
        VoyagerTranslator $postCollection,
        float $minSimilarityPercentage = 0.75
    ): VoyagerCollection
    {
        $similars = $this->model::query()
            ->selectRaw(
                "*, MATCH ({$this->masterNamingKey}) AGAINST (? IN NATURAL LANGUAGE MODE) as similarity",
                [$postCollection->{$this->masterNamingKey}]
            )
            ->where('id', '!=', $postCollection->id)
            ->whereRaw(
                "MATCH ({$this->masterNamingKey}) AGAINST (? IN NATURAL LANGUAGE MODE) > ?",
                [$postCollection->{$this->masterNamingKey}, $minSimilarityPercentage]
            )
            ->orderBy('similarity', 'desc')
            ->take(3)
            ->get();

        // Eğer hiç benzerlik bulunamadıysa, sonraki 3 kaydı döndür
        if ($similars->isEmpty()) {
            $similars = $this->model::query()
                ->where('id', '>', $postCollection->id)
                ->orderBy('id', 'asc')
                ->take(3)
                ->get();
        }

        // Eğer hiç benzerlik bulunamadıysa ve sonrasında kayıt yoksa
        // Önceki 3 kaydı döndür
        if ($similars->isEmpty()) {
            $similars = $this->model::query()
                ->where('id', '<', $postCollection->id)
                ->orderBy('id', 'asc')
                ->take(3)
                ->get();
        }

        return $similars->translate(app()->getLocale())->keyBy('id');
    }

    /**
     * Checks and handles redirects.
     *
     * @param VoyagerTranslator $postCollection The post collection which contains the post data.
     * @param integer $slug The slug of the post.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function handleRedirects(VoyagerTranslator $postCollection, string $slug): RedirectResponse
    {
        // Redirect post to different url
        if (mb_strlen($postCollection->redirect_url) > 5) {
            return redirect($postCollection->redirect_url);
        }

        /**
         * If the post has been reached somehow,
         * but the url is incorrect,
         * it will redirect to the main url.
         */
        $previousUrl = parse_url(url()->previous());
        $previousQuery = '';

        if (isset($previousUrl['query'])) {
            $previousQuery = '?' . $previousUrl['query'];
        }

        if ($postCollection->slug != $slug) {
            return redirect(
                route(
                    'post',
                    [
                        'lang' => app()->getLocale(),
                        'slug' => $postCollection->slug
                    ]
                ) . $previousQuery
            );
        }
    }

    /**
     * Returns a paginated list of posts, including
     * their IDs, titles, images, slugs, and excerpts.
     *
     * @return array
     */
    public function getPaginatedPosts(array $selectColumns = []): array
    {
        if (empty($selectColumns)) {
            $selectColumns = ['id', $this->masterNamingKey, 'image', 'slug', 'excerpt'];
        }

        $postsPaginator = $this->model::select($selectColumns)
            ->ordered()
            ->paginate(12);

        $posts = $postsPaginator->translate(app()->getLocale());

        return [
            $posts,
            $postsPaginator
        ];
    }

    /**
     * Returns all posts
     * their IDs, titles, images, slugs
     *
     * @return array
     */
    public function getAllPosts(array $selectColumns = []): VoyagerCollection
    {
        if (empty($selectColumns)) {
            $selectColumns = ['id', $this->masterNamingKey, 'slug', 'excerpt'];
        }

        $posts = $this->model::select($selectColumns)
            ->ordered()
            ->get()
            ->translate(app()->getLocale());

        return $posts;
    }

    /**
     * Get filtered posts
     *
     * @param  Request $request
     * @return array
     */
    public function getFilteredPosts(Request $request, $queryCallback = null): array
    {
        // init filter on post contents
        $postPaginator = $this->model::ordered();

        /*
        Search input filter
        */
        if ($request->input('search')) {
            $searchKey = $request->input('search');

            $this->checkInsufficientInput($searchKey, 1, 100);

            if (\Config('voyager.multilingual.default') == app()->getLocale()) {
                $postPaginator->where(function ($query) use ($searchKey) {
                    $query->where($this->masterNamingKey, 'LIKE', '%' . $searchKey . '%')
                        ->orWhere('excerpt', 'LIKE', '%' . $searchKey . '%')
                        ->orWhere('body', 'LIKE', '%' . $searchKey . '%');
                });
            } else {
                $postPaginator->where(function ($query) use ($searchKey) {
                    $query
                    ->whereTranslation($this->masterNamingKey, 'LIKE', '%'.$searchKey.'%', app()->getLocale(), false)
                        ->orWhere(function ($query) use ($searchKey) {
                            $query->whereTranslation('excerpt', 'LIKE', '%'.$searchKey.'%', app()->getLocale(), false);
                        })
                        ->orWhere(function ($query) use ($searchKey) {
                            $query->whereTranslation('body', 'LIKE', '%'.$searchKey.'%', app()->getLocale(), false);
                        });
                });
            }
        }

        /*
        Letter filter on db
        */
        if ($request->input('letter')) {
            $letter = $request->input('letter');

            $this->checkInsufficientInput($letter, 1, 1);

            if (\Config('voyager.multilingual.default') == app()->getLocale()) {
                $postPaginator
                ->where($this->masterNamingKey, 'LIKE', $letter . '%');
            } else {
                $postPaginator
                ->whereTranslation($this->masterNamingKey, 'LIKE', $letter.'%', app()->getLocale(), false);
            }
        }

        /*
        Branch filter on db
        */
        if ($request->input('branch') && intval(request()->input('branch')) > 0) {
            $branch = intval($request->input('branch'));

            $postPaginator->with('branches')->whereHas('branches', function ($query) use ($branch) {
                $query->where('medical_branches.id', $branch);
            });
        }

        if ($queryCallback) {
            $queryCallback($postPaginator);
        }

        $postsPaginator = $postPaginator
            ->paginate(12)
            ->appends(request()->query());

        $posts = $postsPaginator->translate(app()->getLocale());

        return [
            $posts,
            $postsPaginator
        ];
    }

    /**
     * Get filtered posts
     *
     * @param  Request $request
     * @return array
     */
    public function getSearchedPosts(Request $request): array
    {
        $searchKey = $request->input('search');

        if (mb_strlen($searchKey) > 100 || mb_strlen($searchKey) < 3) {
            abort(400);
        }

        $postsPaginator = Post::ordered()
            ->whereTranslation($this->masterNamingKey, 'LIKE', '%' . $searchKey . '%')
            ->orWhere(function ($query) use ($searchKey) {
                $query->whereTranslation('excerpt', 'LIKE', '%' . $searchKey . '%');
            })
            ->orWhere(function ($query) use ($searchKey) {
                $query->whereTranslation('body', 'LIKE', '%' . $searchKey . '%');
            })
            ->paginate(8)
            ->appends(request()->query());

        $posts = $postsPaginator->translate(app()->getLocale());

        return [
            $posts,
            $postsPaginator
        ];
    }
}
