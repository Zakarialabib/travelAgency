<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class CategoryTypeTranslation extends Model
{
    public $timestamps = false;

    protected $fillable = ['name','description'];
}