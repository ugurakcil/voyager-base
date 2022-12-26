<?php
namespace App\Http\Controllers;
use App\Models\Slide;

use Illuminate\Http\Request;

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
        * Homepage Contents
        * */
        /*
        $homepage = Homepage::first();

        if($homepage) {
            $this->data['homepage'] = $this->reorderSeries($homepage->translate(app()->getLocale()));
	        $this->bodyEngine('homepage');
        }
        */

        /*
        * Main Page Slider Data
        * */
        $this->data['slideList'] = Slide::ordered()->get()->translate(app()->getLocale());

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
