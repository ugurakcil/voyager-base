<?php

namespace App\Http\Controllers;

use App\Models\Website;
use App\Models\Page;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;

class FrontController extends Controller
{
    protected $data = [];

    public function __construct()
    {
        /**
         * Canlıda css, js güncellemesi yaptığınızda 
         * cache sorunu engellemek için versiyon ekleyin
         * Denemeler için 3.haneyi, küçük çaplı güncellemeler için 2.haneyi,
         * büyük çaplı değişiklikleri bildirmek için ilk haneyi bir arttırın
         */
        $this->data['assetVersion'] = '0.0.1';

        /**
         * Proje development modundayken (local),
         * assetVersion her sayfa her saniye değişir (zero-cache)
         */
        if(\App::environment() == 'local') {
            $this->data['assetVersion'] = md5(time());
        }

        /**
         * Default dil yönü tanımlamasıdır
         */
        $this->data['languageDirection'] = 'ltr';

        if(app()->getLocale() == 'ar') {
            $this->data['languageDirection'] = 'rtl';
        }

        # This Website's Generic Settings
        $this->data['website'] = Website::first()->translate(app()->getLocale());

        /*
        Database query of post categories to be used in areas such as navbar and site-wide
        */
        $this->data['postCategories'] = Category::select(['id', 'title', 'slug'])
            ->get()->translate(app()->getLocale())->keyBy('id');

        /*
        globalPages defines data such as title, slug for pages like about us
        */
        $this->data['globalPages'] = Page::select(['id', 'title', 'slug', 'redirect_url'])
            ->get()->translate(app()->getLocale())->keyBy('id');
    }

    /*
    * Re-Order Pagination
    * */
    protected function reorderPagination($listPaginator) {
        // $listPaginator = json_Decode(json_encode($listPaginator));

        $pagination = [
            'current_page' => $listPaginator->current_page,
            'from' => $listPaginator->from,
            'to' => $listPaginator->to,
            'per_page' => $listPaginator->per_page,
            'last_page' => $listPaginator->last_page,
            'total' => $listPaginator->total,
            'links' => $listPaginator->links,
        ];

        $pagination['links'] = array_map(function($row){
            return [
                'label' => $row->label,
                'active' => $row->active
            ];
        }, $pagination['links']);

        return $pagination;
    }

    /*
    * Body Content Manipulation
    * */
    protected function bodyEngine($bodyDirective) {
        $this->data[$bodyDirective]->body = str_replace(
            ['[pdf]'],
            ['<img height="64" width="64" src="'.url('/assets/front/assets/icons/pdf-flat/64x64.png').'" class="pdf-class" alt="Download SideStar Document">'],
            $this->data[$bodyDirective]->body);
    }
}
