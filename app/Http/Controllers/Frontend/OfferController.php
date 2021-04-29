<?php

namespace App\Http\Controllers\Frontend;


use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Amenities;
use App\Category;
use App\City;
use App\Country;
use App\Place;
use App\PlaceType;
use App\Review;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class PlaceController extends Controller
{
    private $place;
    private $country;
    private $city;
    private $category;
    private $amenities;
    private $response;

    public function __construct(Place $place, Country $country, City $city, Category $category, Amenities $amenities, Response $response)
    {
        $this->place = $place;
        $this->country = $country;
        $this->city = $city;
        $this->category = $category;
        $this->amenities = $amenities;
        $this->response = $response;
    }

    public function list(Request $request)
    {
        $param_country_id = $request->country_id;
        $param_city_id = $request->city_id;
        $param_cat_id = $request->category_id;
        $param_status = $request->status;
    
        $places = $this->place->listByFilter($param_status, $param_country_id, $param_city_id, $param_cat_id);
        $countries = $this->country->getFullList();
        $cities = $this->city->getListByCountry($param_country_id);
        $categories = $this->category->getListAll(Category::TYPE_PLACE);


//        return $places;


        return view('pages.frontend.place.place_list', [
            'places' => $places,
            'countries' => $countries,
            'status' => (int)$param_status,
            'country_id' => (int)$param_country_id,
            'cities' => $cities,
            'city_id' => (int)$param_city_id,
            'categories' => $categories,
            'cat_id' => (int)$param_cat_id,
        ]);
    }

    public function detail($slug)
    {
        $place = $this->place->getBySlug($slug);
        if (!$place) abort(404);

        $city = City::query()
            ->with('country')
            ->where('id', $place->city_id)
            ->first();

        $amenities = Amenities::query()
            ->whereIn('id', $place->amenities ? $place->amenities : [])
            ->get(['id', 'name', 'icon']);

        $categories = Category::query()
            ->whereIn('id', $place->category ? $place->category : [])
            ->get(['id', 'name', 'slug', 'icon_map_marker']);

        $place_types = PlaceType::query()
            ->whereIn('id', $place->place_type ? $place->place_type : [])
            ->get(['id', 'name']);

        $reviews = Review::query()
            ->with('user')
            ->where('place_id', $place->id)
            ->where('status', Review::STATUS_ACTIVE)
            ->get();
        $review_score_avg = Review::query()
            ->where('place_id', $place->id)
            ->where('status', Review::STATUS_ACTIVE)
            ->avg('score');

        $similar_places = Place::query()
            ->with('place_types')
            ->with('avgReview')
            ->withCount('reviews')
            ->withCount('wishList')
            ->where('city_id', $city->id)
            ->where('id', '<>', $place->id);
        foreach ($place->category as $cat_id):
            $similar_places->where('category', 'like', "%{$cat_id}%");
        endforeach;
        $similar_places = $similar_places->limit(4)->get();

//        return $categories;


//        date_default_timezone_set('Asia/Ho_Chi_Minh');
//        $date = getdate();
//
//        print_r(strtotime('05 PM'));
//
//
//        $time_open = "12:00:00";
//        $time_close = "17:00:00";
//
//
//        if ((time() > strtotime($time_open)) && (time() < strtotime($time_close))) {
//            echo "Open";
//        } else {
//            echo "Close";
//        }


        // SEO Meta
        $title = $place->seo_title ? $place->seo_title : $place->name;
        $description = $place->seo_description ? $place->seo_description : Str::limit($place->description, 165);
        SEOMeta($title, $description, getImageUrl($place->thumb));


        return view("pages.frontend.place.place_detail", [
            'place' => $place,
            'city' => $city,
            'amenities' => $amenities,
            'categories' => $categories,
            'place_types' => $place_types,
            'reviews' => $reviews,
            'review_score_avg' => $review_score_avg,
            'similar_places' => $similar_places
        ]);
    }

   
    
}
