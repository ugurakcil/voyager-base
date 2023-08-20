<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Country extends Model
{
    use Translatable;

    public $timestamps = false;

    protected $fillable     = ['name'];
    protected $dates        = [];

    public $searchable      = ['name', 'code'];

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

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at', 'desc');
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
}
