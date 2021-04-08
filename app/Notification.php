<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;


class Notification extends Model
{
    use Notifiable;

    protected $guarded = [];

    public function booking()
    {
    	return $this->belongsTo('App\Booking')->withDefault(function ($data) {
			foreach($data->getFillable() as $dt){
				$data[$dt] = __('Deleted');
			}
		});
    }

    public function user()
    {
    	return $this->belongsTo('App\User')->withDefault(function ($data) {
			foreach($data->getFillable() as $dt){
				$data[$dt] = __('Deleted');
			}
		});
    }


    public static function countRegistration()
    {
        return Notification::where('user_id','!=',null)->where('is_read','=',0)->orderBy('id','desc')->get()->count();
    }

    public static function countBooking()
    {
        return Notification::where('booking_id','!=',null)->where('is_read','=',0)->orderBy('id','desc')->get()->count();
    }


}
