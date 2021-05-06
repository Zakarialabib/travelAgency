<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class PlaceTranslation extends Model
{
    public $timestamps = false;

    protected $fillable = ['name', 'description'];
}
