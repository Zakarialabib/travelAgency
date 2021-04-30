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
            'category' => '',
            '%name%' => '',
            'slug' => '',
            '%description%' => '',
            'price' => '',
            'address' => '',
            'gallery' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000',
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
            $latest->reference++;
            $data['reference'] = $latest->reference;
        }

        $offer = new Offer();
        $offer->fill($data);
        $offer->save();

        if($offer){
            Toastr::success('Destination ajoutée avec succès');
        }
        else{
            Toastr::error("Impossible d'ajouter la destination");
        }

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
            '%name%' => '',
            '%description%' => '',
            'slug' => '',
            'category' => '',
            'price' => '',
            'itinerary' => '',
            'address' => '',
            'gallery' => '',
            'thumb' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'seo_title' => '',
            'seo_description' => '',
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