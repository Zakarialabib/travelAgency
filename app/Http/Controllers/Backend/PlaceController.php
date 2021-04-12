<?php

namespace App\Http\Controllers\Backend;

use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Category;
use App\City;
use App\Country;
use App\Amenities;
use App\Place;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use nilsenj\Toastr\Facades\Toastr;


class PlaceController extends Controller
{
    private $place;
    private $country;
    private $city;
    private $category;
    private $amenities;
    private $response;

    public function __construct(
        Place $place,
        Country $country,
        City $city,
        Category $category,
        Amenities $amenities,
        Response $response
    )
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

        $places = $this->place->listByFilter($param_country_id, $param_city_id, $param_cat_id);
        $countries = $this->country->getFullList();
        $cities = $this->city->getListByCountry($param_country_id);
        $categories = $this->category->getListAll(Category::TYPE_PLACE);

//        return $places;

        return view('pages.backend.place.place_list', [
            'places' => $places,
            'countries' => $countries,
            'country_id' => (int)$param_country_id,
            'cities' => $cities,
            'city_id' => (int)$param_city_id,
            'categories' => $categories,
            'cat_id' => (int)$param_cat_id,
        ]);
    }

    public function create(Request $request)
    {
        $place = Place::find($request->id);
      
        $country_id = $place ? $place->country_id : false;

        $countries = $this->country->getFullList();
        $categories = $this->category->getListAll(Category::TYPE_PLACE);
        $cities = $this->city->getListByCountry($country_id);
        $amenities = $this->amenities->getListAll();

        $place_types = Category::query()
            ->with('place_type')
            ->get();

        return view('pages.backend.place.place_create', compact('countries', 'cities', 'categories', 'place_types', 'amenities', 'place'));
    }

    public function store(Request $request)
    {
        $request['slug'] = getSlug($request, 'name');
        $rule_factory = RuleFactory::make([
            'user_id' => '',
            'country_id' => '',
            'city_id' => '',
            'category' => '',
            'place_type' => '',
            '%name%' => '',
            'slug' => '',
            '%description%' => '',
            'price_range' => '',
            'price' => '',
            'date' => '',
            'amenities' => '',
            'address' => '',
            'lat' => '',
            'lng' => '',
            'email' => '',
            'phone_number' => '',
            'website' => '',
            'social' => '',
            'opening_hour' => '',
            'gallery' => '',
            'video' => '',
            'booking_type' => '',
            'link_bookingcom' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'seo_title' => '',
            'seo_description' => '',
            'itinerary' => '',
        ]);
        $data = $this->validate($request, $rule_factory);

        
        if (!isset($data['social'])) {
            $data['social'] = null;
        }
        
        if (!isset($data['itinerary'])) {
            $data['itinerary'] = null;
        }
        
        if ($request->hasFile('thumb')) {
            $thumb = $request->file('thumb');
            $thumb_file = $this->uploadImage($thumb, '');
            $data['thumb'] = $thumb_file;
        }

        // generate place reference
        $latest = Place::latest()->first();
        if(!$latest) {
            $data['reference'] = 'PLACE0000000001';
        }else{
            $latest->reference++;
            $data['reference'] = $latest->reference;
        }

        $model = new Place();
        $model->fill($data);
        $model->save();

        if($model){
            Toastr::success('New place successfully');
        }
        else{
            Toastr::error('Unable to create new place');
        }

        return redirect()->route('place_list');

    }

    public function edit($id)
    {
        $place = Place::find($id);

        $country_id = $place ? $place->country_id : false;

        $countries = $this->country->getFullList();
        $categories = $this->category->getListAll(Category::TYPE_PLACE);
        $cities = $this->city->getListByCountry($country_id);
        $amenities = $this->amenities->getListAll();

        $place_types = Category::query()
            ->with('place_type')
            ->get();

        return view('pages.backend.place.place_edit',compact('countries', 'cities', 'categories', 'place_types', 'amenities', 'place'));
    }


    public function update(Request $request)
    {
        $request['slug'] = getSlug($request, 'name');
        $rule_factory = RuleFactory::make([
            'country_id' => '',
            'city_id' => '',
            'category' => '',
            'place_type' => '',
            '%name%' => '',
            'slug' => '',
            '%description%' => '',
            'price_range' => '',
            'price' => '',
            'date' => '',
            'amenities' => '',
            'address' => '',
            'lat' => '',
            'lng' => '',
            'email' => '',
            'phone_number' => '',
            'website' => '',
            'social' => '',
            'opening_hour' => '',
            'gallery' => '',
            'video' => '',
            'booking_type' => '',
            'link_bookingcom' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'seo_title' => '',
            'seo_description' => '',
            'itinerary' => '',
        ]);
        $data = $this->validate($request, $rule_factory);
     
        if (!isset($data['social'])) {
            $data['social'] = null;
        }
        
        if (!isset($data['itinerary'])) {
            $data['itinerary'] = null;
        }

        if ($request->hasFile('thumb')) {
            $thumb = $request->file('thumb');
            $thumb_file = $this->uploadImage($thumb, '');
            $data['thumb'] = $thumb_file;
        }
    
        $model = Place::find($request->place_id);
        $model->fill($data);

        if ($model->save()) {
            return redirect(route('place_list'))->with('success', 'Update place success!');
        }
    }

    public function updateStatus(Request $request)
    {
        $data = $this->validate($request, [
            'status' => 'required',
        ]);

        $model = Place::find($request->place_id);
        $model->fill($data)->save();

        return $this->response->formatResponse(200, $model, 'Update place status success!');
    }

    public function destroy($id)
    {
        Place::destroy($id);
        return back()->with('success', 'Delete place success!');
    }
}