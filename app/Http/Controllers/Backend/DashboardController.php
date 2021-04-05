<?php

namespace App\Http\Controllers\Backend;


use App\Http\Controllers\Controller;
use App\Booking;
use App\City;
use App\Place;
use App\Review;
use App\User;
use App\Sale;
use App\Purchase;

class DashboardController extends Controller
{
    public function index()
    {
        $count_cities = City::query()
            ->where('status', City::STATUS_ACTIVE)
            ->count();

        $count_places = Place::query()
            ->where('status', City::STATUS_ACTIVE)
            ->count();

        $count_bookings = Booking::query()
            ->where('status', City::STATUS_ACTIVE)
            ->count();

        $count_reviews = Review::query()
            ->where('status', City::STATUS_ACTIVE)
            ->count();

        $count_users = User::query()
            ->count();

        
        $count_sales = Sale::query()
        ->count();

        $count_purchases = Purchase::query()
        ->count();


        return view('backend.dashboard.index', [
            'count_cities' => $count_cities,
            'count_places' => $count_places,
            'count_bookings' => $count_bookings,
            'count_reviews' => $count_reviews,
            'count_users' => $count_users,
            'count_sales' => $count_sales,
            'count_purchases' => $count_purchases,

        ]);
    }
}