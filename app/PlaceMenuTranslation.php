<?php


namespace App;


use Illuminate\Database\Eloquent\Model;

class PlaceMenuTranslation extends Model
{
    public $timestamps = false;

    protected $fillable = ['name', 'description', 'price'];
}
