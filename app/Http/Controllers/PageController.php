<?php

namespace App\Http\Controllers;

use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class PageController extends FrontController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function show($slug, Request $request)
    {
        /*
        * Blocks URLs that are too long or too short
        * as a general security measure
        * */
        if (mb_strlen($slug) > 90 || mb_strlen($slug) < 2) {
            abort(400);
        }

        /*
        * Searches the requested URL
        * in the language table and returns the corresponding page
        * */
        $page = Page::whereTranslation('slug', $slug)
            ->website($this->data['website']->id)
            ->with('translations')
            ->first();

        /*
        It prepares the language equivalents of this page
        directly for the language change.
        These language equivalents are prepared
        for the use of hreflang for seo purposes.
        */
        $this->data['translationsCurrentPage'] = [];
        foreach (\Config::get('app.available_locales') as $langKey => $langVal) {
            $this->data['translationsCurrentPage'][$langKey] = (object) [
                'route' => piri('page', [
                    'lang' => $langKey,
                    'slug' => $page->getTranslatedAttribute('slug', $langKey, 'tr')
                ]),
                'title' => $page->getTranslatedAttribute('title', $langKey, 'tr'),
                'language' => $langKey,
            ];
        }

        /*
        * Returns an error if the page requested
        * by the user is not found
        * */
        if (empty($page)) {
            abort(404);
        }

        /*
        * Fetch localized content based on user selection
        * */
        $this->data['page'] = $page->translate(app()->getLocale());

        /*
        * Redirect page to different url
        * */
        if(mb_strlen($this->data['page']->redirect_url) > 5) {
            return redirect($this->data['page']->redirect_url);
        }

        /*
        * If the page has been reached somehow,
        * but the url is incorrect,
        * it will redirect to the main url.
        * */
        $previousUrl = parse_url(url()->previous());
        $previousQuery = '';

        if(isset($previousUrl['query']))
            $previousQuery = '?'.$previousUrl['query'];

        if($this->data['page']->slug != $slug) {
            return redirect(
                piri(
                    'page',
                    [
                        'lang' => app()->getLocale(),
                        'slug' => $this->data['page']->slug
                    ]
                ).$previousQuery);
        }

        /*
        * Activates features used in the body area
        * */
        $this->bodyEngine('page');

        /*
        * Detect pages with custom structure
        * */
        if($this->data['page']->id == 3){
            return view('front.pages.contact', $this->data);
        } else {
            return view('front.pages.page', $this->data);
        }
    }
}
