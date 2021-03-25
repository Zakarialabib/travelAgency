<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class PlaceTypeTranslation extends Model
{
    public $timestamps = false;

    protected $fillable = ['name'];
}