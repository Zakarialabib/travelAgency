<?php

namespace App\Http\Controllers\Frontend;


use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Amenities;
use App\Category;
use App\City;
use App\Country;
use App\Offer;
use App\PlaceType;
use App\Review;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class OfferController extends Controller
{
    public function show($slug) 
    {
        $offer = Offer::where('slug', $slug)->first();
        return view('pages.frontend.offer.show', compact('offer'));
    }
}
