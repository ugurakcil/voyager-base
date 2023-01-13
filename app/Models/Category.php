<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use UgurAkcil\VoyagerBooster\Facades\VoyagerRecursiveCategories;

class Category extends Model
{
    use Translatable;

    public $timestamps = false;

    protected $translatable = ['title', 'slug'];

    public $searchable = ['id', 'title'];

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }

    public function categoryIdList()
    {
        return VoyagerRecursiveCategories::generate($this::get());
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('order', 'asc');
    }

}
