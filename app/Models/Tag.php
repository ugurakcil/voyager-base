<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Tag extends Model
{
    use Translatable;
    protected $translatable = ['title', 'slug'];
    public $timestamps = false;

    public $searchable      = ['id', 'title', 'slug'];

    public function posts()
    {
        return $this->belongsToMany('App\Models\Post', 'posts_tags');
    }
}
