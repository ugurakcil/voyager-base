<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class FirstVisitorRules
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        /**
         * Kullanıcının ilk segment isteği
         * kullanılabilir bir dil kısaltması değilse
         * hiçbir işlem yapmadan bu methodu atla
         */
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
            return redirect()->route('home', ['lang' => Session::get('locale')]);
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
