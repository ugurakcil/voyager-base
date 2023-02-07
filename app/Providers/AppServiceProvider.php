<?php

namespace App\Providers;

use TCG\Voyager\Facades\Voyager;
use App\Http\Controllers\Admin\FormFields\BulkListFormField;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        // @datasins
        // Custom fields for laravel voyager
        Voyager::addFormField(BulkListFormField::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
