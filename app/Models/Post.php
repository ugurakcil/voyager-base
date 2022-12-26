<?php

namespace App\Models;

use App\Traits\Visitable;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Post extends Model
{
    use Translatable, Visitable;

    protected $translatable = ['title', 'slug', 'excerpt', 'body', 'seo_title', 'meta_description', 'status'];
    protected $dates        = ['created_at', 'updated_at', 'deleted_at'];

    public $searchable          = ['id', 'title', 'excerpt', 'body', 'meta_description'];
    public $contentTypes        = ['draft', 'published', 'pending'];
    public $baseCategoryName    = 'post_category_id';

    public function scopeContentType($query, $contentTypeKey)
    {
        return $query->where('status', $contentTypeKey);
    }

    public function scopeActive($query){
        if(app()->getLocale() == config('app.fallback_locale')) {
            return $query->where('status', 1);
        } else {
            return $query->whereHas('translations', function ($query) {
                $query->where('locale', app()->getLocale())
                ->where('column_name', 'status')
                ->where('value', 1);
            });
        }
    }

    public function scopeVisit() {
        $this->visit();
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Models\Tag', 'posts_tags');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'post_category_id');
    }
}
