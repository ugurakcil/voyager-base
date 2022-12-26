<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Website extends Model
{
    use Translatable;

    public $timestamps = false;
    public $searchable = ['name', 'slug', 'seo_title', 'meta_description'];

    protected $translatable = [
        'name', 'seo_title', 'meta_description', 'slug'
    ];

    public function scopeOrdered($query)
    {
        return $query->orderBy('order', 'asc');
    }
}