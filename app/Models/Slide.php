<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;
use TCG\Voyager\Traits\Translatable;

class Slide extends Model
{
    use Translatable;

    public $timestamps = false;
    // protected $dates        = ['created_at', 'updated_at', 'deleted_at'];

    protected $translatable = [
        'title', 'sub_title', 'excerpt', 'page_url',
    ];

    public $searchable      = ['id', 'title', 'excerpt'];

    public function scopeOrdered($query) {
        return $query->orderBy('order', 'asc');
    }
}
