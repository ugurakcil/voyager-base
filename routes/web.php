<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GeneralController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\SitemapController;

/**
 * Dilden bağımsız sayfalar aşağıda tanımlanır
 * Burayı nadiren kullanacaksınız
 *
 * İlk etapta dil parametresi gelmeden girilen
 * index sayfasını tetiklemek ve dil değişimini çağırmak
 * gibi /tr /en dil ön eki bağımsız işlemler burada gerçekleşir
 *
 * Form kayıt işlemleri de dil ön eki bağımsızdır
**/
Route::get('/', [GeneralController::class, 'home'])->name('index');
Route::get('locale/{locale?}', [LanguageController::class, 'setLocale'])->name('setLocale');
Route::get('sitemap/{lang}.xml', [SitemapController::class, 'sitemap'])->where('lang', '[a-z]{2}');

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
 * Yeni sayfa eklerken aşağıdaki yapıyı kullanın.
 *
 * app/Http/GeneralController.php dosyasına gidin
 * "example" method'unu kopyalayıp isimlendirin
 * ve ardından buraya route bilgisini aşağıdaki "example"
 * tanımlı route'da olduğu gibi ekleyin.
 *
 * Example'ınıza erişim sağlarken tr-en kullandığınıza dikkat edin
 *
 * Eğer route aktif olmazsa tarayıcıdan şunu çalıştırın;
 * thiswebsiteaddress.com/artisan/route-clear
**/
Route::group(['prefix' => '{lang}', 'where' => ['lang' => 'en|tr|ar|de']], function() { // [a-zA-Z]{2}
    Route::get('/', [GeneralController::class, 'home'])->name('home');
    Route::get('page/{slug}', [PageController::class, 'show'])->name('page');
    Route::get('post/{slug}', [PostController::class, 'show'])->name('post');
    Route::get('tag/{slug}', [PostController::class, 'tags'])->name('tag');
    Route::get('category/{slug}', [PostController::class, 'categories'])->name('category');
    Route::get('search', [PostController::class, 'search'])->name('search');

    // Route::get('/example', [GeneralController::class, 'example'])->name('example');

    /**
     * Benzer alanları aşağıdaki örneklerdeki gibi gruplayın
     */
    /* 
    Route::group(['prefix' => 'campaigns'], function() {
        Route::get('/', [CampaignController::class, 'index'])->name('campaigns');
        Route::get('{slug}', [CampaignController::class, 'show'])->name('campaign');
    });

    Route::group(['prefix' => 'custom'], function() {
        Route::get('{customList}', [CustomContentController::class, 'index'])->name('customList');
        Route::get('{customList}/{slug}', [CustomContentController::class, 'show'])->name('customPage');
    });
    */
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
    Route::get('/storage-link', function() {
        $exitCode = Artisan::call('storage:link');
        return '<h1>Storage link created</h1>';
    });
});
