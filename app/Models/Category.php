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
