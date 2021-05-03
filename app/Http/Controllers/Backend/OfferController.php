<?php

namespace App\Http\Controllers\Backend;

use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Category;
use App\Offer;
use App\User;
use Astrotomic\Translatable\Validation\RuleFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use nilsenj\Toastr\Facades\Toastr;


class OfferController extends Controller
{
    private $offer;
    private $category;
    private $response;

    public function __construct(
        Offer $offer,
        Category $category,
        Response $response
    )
    {
        $this->offer = $offer;
        $this->category = $category;
        $this->response = $response;
    }

    public function list(Request $request)
    {
        $user = User::where('is_admin','=',1)->first();

        $offers = Offer::query()
        ->with('categories')
        ->get();

        $categories = $this->category->getListAll(Category::TYPE_OFFER);

//        return $offers;

        return view('pages.backend.offer.offer_list', [
            'offers' => $offers,
            'categories' => $categories,
            'user' => $user

        ]);
    }

    public function create(Request $request)
    {
        $offer = Offer::find($request->id);
      
        $categories = $this->category->getListAll(Category::TYPE_OFFER);

        return view('pages.backend.offer.offer_create', compact('categories', 'offer'));
    }

    public function store(Request $request)
    {
        $request['slug'] = getSlug($request, 'name');

        $data = $this->validate($request, array(
            'user_id' => '',
            '%name%' => 'required',
            '%description%' => 'required',
            'slug' => '',
            'price' => 'required|numeric',
            'category' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'gallery' => '',
            'seo_title' => '',
            'seo_description' => '',
            'itinerary' => '',
        ));

        if (!isset($data['itinerary'])) {
            $data['itinerary'] = null;
        }
        
        if ($request->hasFile('thumb')) {
            $thumb = $request->file('thumb');
            $thumb_file = $this->uploadImage($thumb, '');
            $data['thumb'] = $thumb_file;
        }

        // generate offer reference
        $latest = Offer::latest()->first();
        if(!$latest) {
            $data['reference'] = '0000000001';
        }else{
            $data['reference'] = $latest->reference + 1;
        }
        $offer = Offer::create([
            'user_id' => $data['user_id'],
            '%name%' => $data['%name%'],
            '%description%' => $data['%description%'],
            'slug' => $data['slug'],
            'price' => $data['price'],
            'category' => $data['category'],
            'thumb' => $data['thumb'],
            'gallery' => $data['gallery'],
            'seo_title' => $data['seo_title'],
            'seo_description' => $data['seo_description'],
            'itinerary' => $data['itinerary']
            ]);
           

        return redirect()->route('offer_list');

    }

    public function edit($id)
    {
        $offer = Offer::find($id);

        $categories = $this->category->getListAll(Category::TYPE_OFFER);

        return view('pages.backend.offer.offer_edit',compact('categories', 'offer'));
    }


    public function update($id, Request $request)
    {
        $offer = Offer::find($id);
        $request['slug'] = getSlug($request, 'name');
        
        $request->validate([
            'user_id' => '',
            '%name%' => 'required',
            '%description%' => 'required',
            'slug' => '',
            'price' => 'required|numeric',
            'category' => '',
            'gallery' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'seo_title' => '',
            'seo_description' => '',
            'itinerary' => '',
        ]);

        if (!isset($data['itinerary'])) {
            $data['itinerary'] = null;
        }

        if ($request->hasFile('thumb')) {
            $thumb = $request->file('thumb');
            $thumb_file = $this->uploadImage($thumb, '');
            $data['thumb'] = $thumb_file;
        }

        $input = $request->all();
        $offer->update($input);
    
         return redirect(route('offer_list'))->with('success', 'Destination à jour!');
    
    }

    public function updateStatus(Request $request)
    {
        $data = $this->validate($request, [
            'status' => 'required',
        ]);

        $model = Offer::find($request->offer_id);
        $model->fill($data)->save();

        return $this->response->formatResponse(200, $model, 'Status à jour!');
    }

    public function destroy($id)
    {
        Offer::destroy($id);
        return back()->with('success', 'Destination supprimée avec succes!');
    }
}