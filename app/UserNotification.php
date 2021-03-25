<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{

    public static function countOrder($id)
    {
        return UserNotification::where('user_id','=',$id)->where('is_read','=',0)->get()->count();
    }

}
