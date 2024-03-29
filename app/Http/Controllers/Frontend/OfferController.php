<?php

namespace App\Http\Controllers\Frontend;


use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Models\Amenities;
use App\Models\Category;
use App\Models\City;
use App\Models\Country;
use App\Models\Offer;
use App\Models\PlaceType;
use App\Models\Review;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class OfferController extends Controller
{
    public function show($slug) 
    {
        $offer = Offer::where('slug', $slug)->first();
        
        if (!$offer) abort(404);

        return view('pages.frontend.offer.show', compact('offer'));
    }
}
