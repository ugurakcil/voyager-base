<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;
use TCG\Voyager\Traits\Translatable;

class Log extends Model
{
    public $timestamps      = false;
    protected $dates        = ['created_at'];
    protected $guarded      = [];

    public $searchable      = ['id', 'table_name', 'operation_name', 'data_id', 'user_id'];
}
