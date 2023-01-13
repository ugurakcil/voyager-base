<?php
namespace App\Http\Controllers;
use App\Models\Part;
use App\Models\Post;
use App\Models\Slide;

use Illuminate\Http\Request;
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
        * Homepage Contents - Example
        * */
        /*
        $this->data['homepage'] = Homepage::first()->translate(app()->getLocale());
        $this->bodyEngine('homepage');
        */

        /*
        Part contents
        */
        $this->data['parts'] = Part
            ::whereIn('id', [1,2,3])
            ->get()
            ->translate(app()->getLocale())->keyBy('id');

        /*
        DB queries of posts
        */
        $this->data['homePosts'] = Post
            ::select(['id', 'title', 'excerpt', 'slug', 'image', 'post_category_id'])
            ->latest()
            ->active()
            ->limit(3)
            ->get()
            ->translate(app()->getLocale());

        /*
        * Main Page Slider Data
        * */
        $this->data['slideList'] = Slide
            ::ordered()
            ->get()
            ->translate(app()->getLocale());

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
