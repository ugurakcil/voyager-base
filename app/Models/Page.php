<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;
use TCG\Voyager\Traits\Translatable;

class Page extends Model
{
    use Translatable;

    protected $translatable = [
        'title', 'sub_title', 'excerpt', 'body', 'meta_description',
        'slug', 'seo_title', 'redirect_url'
    ];
    protected $dates        = [];

    public $searchable      = ['id', 'title', 'excerpt', 'body', 'meta_description', 'slug', 'seo_title'];

    //public $contentTypes    = ['draft', 'published', 'pending'];

    public function scopeWebsite($query) {
        //return $query->where('website_id', Request::header('X-Website', 0));
    }

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }

    public function scopeContentType($query, $contentTypeKey)
    {
        //return $query->where('status', $contentTypeKey);
    }

    public function save(array $options = [])
    {
        /**
         * Voyager durum kayıt hatasını düzeltir
         */
        if (!isset($this->status)) { //  || (isset($this->status) && !empty($this->status))
            $this->status = 1;
        }

        /**
         * Kullanıcının yaptığı işlemi loglar
         */
        $operation = $this->exists ? 'update' : 'add'; // işlem türünü alır

        event(new AdminLog($operation, $this->table, $this));

        return parent::save();
    }

    public function delete(array $options = [])
    {
        /**
         * Kullanıcının yaptığı silme işlemini loglar
         */
        $operation = 'delete'; // işlem türünü alır

        event(new AdminLog($operation, $this->table, $this));

        return parent::delete();
    }
}
