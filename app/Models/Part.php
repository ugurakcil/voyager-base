<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;
use TCG\Voyager\Traits\Translatable;

class Part extends Model
{
    use Translatable;

    protected $translatable = [
        'title', 'sub_title', 'excerpt', 'body',
        'link1_text', 'link1_url',
	    'link2_text', 'link2_url', 
        'bulk_list_features'
    ];
    protected $dates        = [];

    public $searchable      = ['id', 'title', 'sub_title', 'excerpt', 'body', 'link1_text', 'link1_url'];
}
