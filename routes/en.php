<?php
use App\Http\Controllers\GeneralController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PostController;

Route::get('/', [GeneralController::class, 'home'])->name('home');
Route::get('page/{slug}', [PageController::class, 'show'])->name('page');

Route::group(['prefix' => 'blog'], function() {
    Route::get('/', [PostController::class, 'list'])->name('blog');
    Route::get('post/{slug}', [PostController::class, 'show'])->name('blog.post');
    Route::get('tag/{slug}', [PostController::class, 'tags'])->name('blog.tag');
    Route::get('category/{slug}', [PostController::class, 'categories'])->name('blog.category');
    Route::get('search', [PostController::class, 'search'])->name('blog.search');
});

/**
 * Yeni sayfa eklerken aşağıdaki yapıyı kullanın.
 * **************************************************************
 * Route::get('/example', [GeneralController::class, 'example'])->name('example');
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
 *
 * Benzer alanları aşağıdaki örneklerdeki gibi gruplayın
 * **************************************************************
 * Route::group(['prefix' => 'custom'], function() {
 *  Route::get('{customList}', [CustomContentController::class, 'index'])->name('custom.list');
 *  Route::get('{customList}/{slug}', [CustomContentController::class, 'show'])->name('custom.page');
 * });
**/
