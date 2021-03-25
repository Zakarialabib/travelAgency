<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Commons\Helpers;

class Menu extends Model

{
   protected $table = "admin_menus";

   protected $fillable = ['id','name'];

}