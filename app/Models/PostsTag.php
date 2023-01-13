<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostsTag extends Model
{
    protected $fillable     = ['post_id', 'tag_id'];
}
