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
        $mainLocale = array_key_first(\Config::get('app.available_locales'));

        /**
         * Kullanıcı bir dil session'ına sahip,
         * Bu session default dil değil,
         * ve anasayfaya girmeye çalışıyor.
         * Bu durumda ilgili dil sayfasına yönlendirir
         */
        if(Session::has('locale') && Session::get('locale') != $mainLocale && !request()->segment(1)) {
            return redirect()->route('home', ['lang' => Session::get('locale')]);
        }

        /**
         * Kullanıcı default dil'e sahip
         * ve ilgili dil sayfasına giriş yapıyor
         * onu index'e gönder
         */
        if(Session::has('locale') && Session::get('locale') == $mainLocale && request()->segment(1) && !request()->segment(2)) {
            return redirect()->route('index');
        }

        return $next($request);
    }
}
