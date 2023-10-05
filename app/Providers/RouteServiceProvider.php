<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Config;
use App\Http\Middleware\IgnoreLangCode;


class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to the "home" route for your application.
     *
     * This is used by Laravel authentication to redirect users after login.
     *
     * @var string
     */
    public const HOME = '/home';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        $this->configureRateLimiting();

        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));


            // Domaini al
            $domain = request()->getHost();

            // Dil eşleşmesini bul
            $locales = Config::get('app.available_locales');
            $lang = array_search($domain, $locales);

            // Eşleşme varsa ve dosya mevcutsa o dosyayı, yoksa default dosyayı yükle
            $routeFile = base_path(
                'routes/' . ($lang && file_exists(base_path('routes/' . $lang . '.php'))
                ? $lang : Config::get('app.locale')) . '.php');

            if (Config::get('app.multidomain')) {
                Route::middleware('web')
                     ->namespace($this->namespace)
                     ->group($routeFile);
            } else {
                Route::get('/', [\App\Http\Controllers\GeneralController::class, 'home'])->name('index');

                Route::middleware(['web', IgnoreLangCode::class])
                     ->prefix('{lang}')
                     ->where(['lang' => 'en|tr|ar|de'])
                     ->namespace($this->namespace)
                     ->group($routeFile);
            }
        });
    }

    /**
     * Configure the rate limiters for the application.
     *
     * @return void
     */
    protected function configureRateLimiting()
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by($request->user()?->id ?: $request->ip());
        });
    }
}
