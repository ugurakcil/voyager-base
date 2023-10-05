<?php
namespace App\Http\Controllers;

use App\Models\Part;
use App\Models\Post;
use App\Models\Slide;

use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\FrontController;

class GeneralController extends FrontController
{
    public function __contruct()
    {
        parent::__contruct();
    }

    public function home()
    {
        /*
        * Special configurations for this page
        * */
        $this->data['isHome'] = true;

        /*
        It prepares the language equivalents of this page
        directly for the language change.
        These language equivalents are prepared
        for the use of hreflang for seo purposes.

        Don't forget: For the homepage,
        the main language must be directed directly to the base url.
        */

        $this->data['translationsCurrentPage'] = [];
        foreach (\Config::get('app.available_locales') as $langKey => $langVal) {
            $this->data['translationsCurrentPage'][$langKey] = (object) [
                'route' => piri('home', [
                    'lang' => $langKey,
                ]),
                'title' => $this->data['websiteTranslations']->getTranslatedAttribute('seo_title', $langKey, 'tr'),
                'language' => $langKey,
            ];
        }

        /**
        * Part contents
        ********************************************************************************
        * 1 : Homepage Intro Text   | 2 : Test                  | 3 : Demo
        * 6 : Test                  | 8 : Test                  | 9 : Test
        */
        $this->data['parts'] = Cache
        ::remember('homeParts'.app()->getLocale(), config('cache.ttl'), function () {
            return Part
                ::whereIn('id', [1,2,3])
                ->get()
                ->translate(app()->getLocale())->keyBy('id');
        });

        /*
        DB queries of posts
        */
        $this->data['homePosts'] = Cache
        ::remember('homePosts'.app()->getLocale(), config('cache.ttl'), function () {
            return Post
                ::select(['id', 'title', 'excerpt', 'slug', 'image', 'post_category_id'])
                ->latest()
                ->active()
                ->limit(3)
                ->get()
                ->translate(app()->getLocale());
        });

        /*
        * Main Page Slider Data
        * */
        $this->data['slideList'] = Cache
        ::remember('homeParts'.app()->getLocale(), config('cache.ttl'), function () {
            return Slide
                ::ordered()
                ->get()
                ->translate(app()->getLocale());
        });

        /*
        * Send all data to view
        * */
        return view('front.pages.home', $this->data);
    }

    /**
     * Sadece example yazan alanları değiştirerek
     * yeni kayıt ekleyebilirsiniz;
     */

    /*
    public function example()
    {
        return view('front.pages.example', $this->data);
    }
    */
}
