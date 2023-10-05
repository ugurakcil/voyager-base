<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Config;

class IgnoreLangCode
{
    public function handle($request, Closure $next)
    {
        $request->route()->forgetParameter('lang');

        if (Config::get('app.multidomain')) {
            return $next($request);
        }

        if(! array_key_exists(request()->segment(1), \Config::get('app.available_locales'))) {
            return $next($request);
        }

        /**
         * Kullanıcı bir dil seçimine sahip,
         * Bu session default dil değil,
         * ve anasayfaya girmeye çalışıyor.
         * Bu durumda ilgili dil sayfasına yönlendirir
         */
        $mainLocale = array_key_first(\Config::get('app.available_locales'));

        if(app()->getLocale() != $mainLocale && !request()->segment(1)) {
            return redirect()->piri('home', ['lang' => Session::get('locale')]);
        }

        /**
         * Kullanıcı default dil'e sahip
         * ve ilgili dil sayfasına giriş yapıyor
         * onu index'e gönder
         */
        if(app()->getLocale() == $mainLocale && request()->segment(1) && !request()->segment(2)) {
            return redirect()->route('index');
        }

        return $next($request);
    }
}
