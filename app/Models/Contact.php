<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    protected $fillable     = ['name', 'phone', 'email', 'message', 'area_code'];
    protected $dates        = ['created_at', 'updated_at', 'deleted_at'];

    public $searchable      = ['name', 'phone', 'email', 'message', 'area_code'];
}
