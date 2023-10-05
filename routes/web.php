<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\SitemapController;

/**
 * Dilden bağımsız sayfalar burada tanımlanır
 * Burayı nadiren kullanacaksınız
 *
 * İlk etapta dil parametresi gelmeden girilen
 * gibi /tr /en dil ön eki bağımsız işlemler burada gerçekleşir
 *
 * Form kayıt işlemleri de dil ön eki bağımsızdır
 *
 * Dil etkin sayfalar için en.php, tr.php gibi routes dosyalarını kullanın
**/

Route::get('locale/{locale?}', [LanguageController::class, 'setLocale'])->name('setLocale');

Route::group(['prefix' => 'sitemap'], function() {
    Route::get('all.xml', [SitemapController::class, 'allSitemaps']);
    Route::get('{lang}.xml', [SitemapController::class, 'sitemap'])->where('lang', '[a-z]{2}');
});

/**
 * Form kayıt istekleri bu bölümden yapılır
 * thiswebsiteaddress.com/save/formSaveRoutingName şeklinde
 * save prefix'i sonrası çağrılır
 */
Route::middleware('throttle:3333,1')->group(function () {
    Route::group(['prefix' => 'save'], function() {
        Route::any('contact', [FormController::class, 'saveContact'])->name('saveContact');
        Route::any('newsletter', [FormController::class, 'saveNewsletter'])->name('saveNewsletter');
    });
});

/**
 * Voyager panel routes
**/
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

/*
* Urls to run artisan commands on shared servers
* */
Route::group(['prefix' => 'artisan'], function () {
    Route::get('/clear-cache', function() {
        $exitCode = Artisan::call('cache:clear');
        return '<h1>Cache facade value cleared</h1>';
    });

    //Reoptimized class loader:
    Route::get('/optimize', function() {
        $exitCode = Artisan::call('optimize');
        return '<h1>Reoptimized class loader</h1>';
    });

    //Route cache:
    Route::get('/route-cache', function() {
        $exitCode = Artisan::call('route:cache');
        return '<h1>Routes cached</h1>';
    });

    //Clear Route cache:
    Route::get('/route-clear', function() {
        $exitCode = Artisan::call('route:clear');
        return '<h1>Route cache cleared</h1>';
    });

    //Clear View cache:
    Route::get('/view-clear', function() {
        $exitCode = Artisan::call('view:clear');
        return '<h1>View cache cleared</h1>';
    });

    //Clear Config cache:
    Route::get('/config-cache', function() {
        $exitCode = Artisan::call('config:cache');
        return '<h1>Clear Config cleared</h1>';
    });

    //Clear Config cache:
    Route::get('/config-clear', function() {
        $exitCode = Artisan::call('config:cache');
        return '<h1>Clear Config cleared</h1>';
    });

    //Clear Config cache:
    Route::get('/storage-link', function() {
        $exitCode = Artisan::call('storage:link');
        return '<h1>Storage link created</h1>';
    });
});
