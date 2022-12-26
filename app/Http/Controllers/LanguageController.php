<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;

class LanguageController extends FrontController
{
    public function setLocale(Request $request, $locale){
        if(!array_key_exists($locale, Config::get('app.available_locales'))){
            return abort(403, 'Language not supported.');
        }

        //Session::put('locale', $locale);
        session(['locale' => $locale]);
        //Session::flash('locale',$locale); 

        $previousUrl = parse_url(url()->previous());
        
        $previousJustPath = '';
        if(isset($previousUrl['path']))
            $previousJustPath = $previousUrl['path'];

        $previousQuery = '';
        if(isset($previousUrl['query']))
            $previousQuery = '?'.$previousUrl['query'];

        $previousPath = str_replace(url('/').'/', '', $previousJustPath);
        $backSegments = array_values(array_filter(explode('/', $previousPath)));

        if(!isset($backSegments[0]) || strlen($backSegments[0]) <= 2) { // dil var ya da anasayfadan segmentsiz gelmiş
            $backSegments[0] = $locale;
            return redirect()->to(url(implode('/', $backSegments)).$previousQuery);
        } else if(isset($backSegments[0]) && $backSegments[0] == 'locale') { 
            if($locale == 'tr')
                $localeUrl = '';
            else 
                $localeUrl = $locale;
            return redirect()->to(url('/'.$localeUrl).$previousQuery);
        } else if(isset($backSegments[0]) && (!isset($backSegments[1]) || (isset($backSegments[1]) && strlen($backSegments[1]) <= 2))) { // website segmentinden sonra dil segmenti gelir
            $backSegments[1] = $locale;
            //dd(url(implode('/', $backSegments)).$previousQuery);
            return redirect()->to(url(implode('/', $backSegments)).$previousQuery);
        } else {
            return redirect()->to(url()->previous());
        }
    }
}