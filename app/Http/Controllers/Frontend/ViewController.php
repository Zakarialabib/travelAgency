<?php

namespace App\Http\Controllers\Frontend;

use App\BankDetail;
use App\FlightBooking;
use App\HotelBooking;
use App\Profile;
use App\Services\AmadeusConfig;
use App\Services\AmadeusHelper;
use App\Markup;
use App\Title;
use App\Vat;
use App\TravelPackage;
use App\Amenities;
use App\Category;
use App\City;
use App\Country;
use App\Place;
use App\PlaceType;
use App\Post;
use App\Page;
use App\Review;
use App\Testimonial;
use App\Commons\Response;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use function Symfony\Component\VarDumper\Dumper\esc;


class ViewController extends Controller
{ 
    private $AmadeusHelper;
    private $AmadeusConfig;
    private $HotelController;
    private $place;
    private $country;
    private $city;
    private $category;
    private $amenities;
    private $response;

    public function __construct(Place $place, Country $country, City $city, Category $category, Amenities $amenities, Response $response){
        $this->AmadeusHelper = new AmadeusHelper();
        $this->AmadeusConfig = new AmadeusConfig();
        $this->HotelController = new HotelController();
        $this->place = $place;
        $this->country = $country;
        $this->city = $city;
        $this->category = $category;
        $this->amenities = $amenities;
        $this->response = $response;
    }

    public function home(){

        $deals = TravelPackage::where('status', 1)
            ->with('images')
            ->with('flightDeal')
            ->with('hotelDeal')
            ->with('attractionDeal')
            ->limit(15)
            ->get();

        $places = Place::query()
        ->with('place_types')
        ->withCount('reviews')
        ->with('avgReview')
        ->withCount('wishList')
        ->where('status', Place::STATUS_ACTIVE)
        ->get();

        
        $countryList = Country::all();

          $blog_posts = Post::query()
            ->with(['categories' => function ($query) {
                $query->where('status', Category::STATUS_ACTIVE)
                    ->select('id', 'name', 'slug');
            }])
            ->where('type', Post::TYPE_BLOG)
            ->where('status', Post::STATUS_ACTIVE)
            ->limit(3)
            ->orderBy('created_at', 'desc')
            ->get(['id', 'category', 'slug', 'thumb']);

            $popular_cities = City::query()
            ->with('country')
            ->withCount(['places' => function ($query) {
                $query->where('status', Place::STATUS_ACTIVE);
            }])
            ->where('status', Country::STATUS_ACTIVE)
            ->limit(12)
            ->get();

            $categories = Category::query()
            ->where('categories.status', Category::STATUS_ACTIVE)
            ->where('categories.type', Category::TYPE_PLACE)
            ->join('places', 'places.category', 'like', DB::raw("CONCAT('%', categories.id, '%')"))
            ->limit(10)
            ->get();

            $trending_places = Place::query()
            ->with('categories')
            ->with('city')
            ->with('place_types')
            ->withCount('reviews')
            ->with('avgReview')
            ->withCount('wishList')
            ->where('status', Place::STATUS_ACTIVE)
            ->limit(10)
            ->get();

        $testimonials = Testimonial::query()
            ->where('status', Testimonial::STATUS_ACTIVE)
            ->get();
        
        return view('pages.frontend.home',compact('deals','testimonials','trending_places','countryList','places' ,'blog_posts','popular_cities','categories'));

    }

    public function changeLanguage($locale)
    {
        Session::put('language_code', $locale);
        $language = Session::get('language_code');

        return redirect()->back();
    }

    public function pageFaqs()
    {
        return view('frontend.page.faqs');
    }
    

    public function pageAbout(Request $request)
    {
        $keyword = $request->keyword;
        $category_id = $request->category_id;
        $city_id = $request->city_id;

        $places = Place::query()
        ->with(['city' => function ($query) {
            return $query->select('id', 'name', 'slug');
        }])
        ->with('place_types')
        ->withCount('reviews')
        ->with('avgReview')
        ->withCount('wishList')
        ->orWhere('address', 'like', "%{$keyword}%")
        ->whereTranslationLike('name', "%{$keyword}%")
        ->where('status', Place::STATUS_ACTIVE);

    if ($category_id) {
        $places->where('category', 'like', "%{$category_id}%");
    }

    if ($city_id) {
        $places->where('city_id', $city_id);
    }

    $places = $places->paginate(4);

        return view('frontend.page.about',[
            'places' => $places,
            'keyword' => $keyword
        ]);
    }
        public function termsConditions()
    {
        return view('frontend.page.termsconditions');
    }

    public function pageContact()
    {
        return view('frontend.page.contact');
    }

    public function pageLanding($page_number)
    {
        return view("frontend.page.landing_{$page_number}");
    }

    public function searchListing(Request $request)
    {
        $keyword = $request->keyword;
        
        $places = Place::query()
            ->with(['city' => function ($query) {
                return $query->select('id', 'name', 'slug');
            }])
            ->whereTranslationLike('name', "%{$keyword}%")
            ->orWhere('date', 'like', "%{$keyword}%")
            ->orWhere('address', 'like', "%{$keyword}%")
            ->where('status', Place::STATUS_ACTIVE);

        $places = $places->get(['id', 'city_id', 'date','name', 'slug', 'address']);

        $html = '<ul class="listing_items">';
        foreach ($places as $place):
            if (isset($place['city'])):
                $place_url = route('place_detail', $place->slug);
                $html .= "
                <li>
                    <a href=\"{$place_url}\">{$place->name}</a>
                </li>
                ";
            endif;
        endforeach;
        $html .= '</ul>';

        $html_notfound = "<ul><li><a href='#'><span>No listing found!</span></a></li></ul>";

        count($places) ?: $html = $html_notfound;

        return response($html, 200);
    }

    public function search(Request $request)
    {
        $keyword = $request->keyword;
        $category_id = $request->category_id;
        $city_id = $request->city_id;

        $places = Place::query()
            ->with(['city' => function ($query) {
                return $query->select('id', 'name', 'slug');
            }])
            ->with('place_types')
            ->withCount('reviews')
            ->with('avgReview')
            ->withCount('wishList')
            ->orWhere('address', 'like', "%{$keyword}%")
            ->whereTranslationLike('name', "%{$keyword}%")
            ->where('status', Place::STATUS_ACTIVE);

        if ($category_id) {
            $places->where('category', 'like', "%{$category_id}%");
        }

        if ($city_id) {
            $places->where('city_id', $city_id);
        }

        $places = $places->paginate(20);

        return view('frontend.search.search', [
            'places' => $places,
            'keyword' => $keyword
        ]);
    }

    public function pageSearchListing(Request $request)
    {
        $keyword = $request->keyword;
        $filter_category = $request->category;
        $filter_amenities = $request->amenities;
        $filter_place_type = $request->place_type;
        $filter_city = $request->city;
        $filter_date = $request->date;

        $categories = Category::query()
            ->where('type', Category::TYPE_PLACE)
            ->get();

        $place_types = PlaceType::query()
            ->get();

        $amenities = Amenities::query()
            ->get();

        $cities = City::query()
            ->get();

        $dates = Place::query()
        ->get();

        $places = Place::query()
            ->with(['city' => function ($query) {
                return $query->select('id', 'name', 'slug');
            }])
            ->with('categories')
            ->with('place_types')
            ->withCount('reviews')
            ->with('avgReview')
            ->withCount('wishList')
            ->orWhere('address', 'like', "%{$keyword}%")
            ->whereTranslationLike('name', "%{$keyword}%")
            ->where('status', Place::STATUS_ACTIVE);

        if ($filter_category) {
            foreach ($filter_category as $key => $item) {
                if ($key === 0) {
                    $places->where('category', 'like', "%$item%");
                } else {
                    $places->orWhere('category', 'like', "%$item%");
                }
            }
        }

        if ($filter_amenities) {
            foreach ($filter_amenities as $key => $item) {
                if ($key === 0) {
                    $places->where('amenities', 'like', "%$item%");
                } else {
                    $places->orWhere('amenities', 'like', "%$item%");
                }
            }
        }

        if ($filter_place_type) {
            foreach ($filter_place_type as $key => $item) {
                if ($key === 0) {
                    $places->where('place_type', 'like', "%$item%");
                } else {
                    $places->orWhere('place_type', 'like', "%$item%");
                }
            }
        }

        if ($filter_city) {
            $places->whereIn('city_id', $filter_city);
        }

        if ($filter_date) {
            $dates->whereIn('date', $filter_date);
        }


        if ($request->ajax == '1') {
            $places = $places->get();

            $city = null;
            if (isset($filter_city)) {
                $city = City::query()
                    ->whereIn('id', $filter_city)
                    ->first();
            }

            $data = [
                'city' => $city,
                'places' => $places
            ];

            return $this->response->formatResponse(200, $data, 'success');
        }

        $places = $places->paginate();

//        return $places;

        return view("frontend.search.search_01", [
            'keyword' => $keyword,
            'places' => $places,
            'categories' => $categories,
            'place_types' => $place_types,
            'amenities' => $amenities,
            'cities' => $cities,
            'dates' => $dates,
            'filter_category' => $filter_category,
            'filter_amenities' => $filter_amenities,
            'filter_place_type' => $filter_place_type,
            'filter_city' => $request->city,
            'filter_date' => $filter_date,
        ]);
    }

    public function sendAbout(Request $request)
    {
        Mail::send('frontend.mail.contact_form', [
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'phone_number' => $request->phone_number,
            'email' => $request->email,
            'note' => $request->note
        ], function ($message) use ($request) {
            $message->to(config('default_email_address'), "{$request->first_name}")->subject('Contact from ' . $request->first_name);
        });


        return back()->with('success', 'Contact has been send!');
    }

    public function sendContact(Request $request)
    {
        Mail::send('frontend.mail.contact_form', [
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'phone_number' => $request->phone_number,
            'email' => $request->email,
            'note' => $request->note
        ], function ($message) use ($request) {
            $message->to(setting('email_system'), "{$request->first_name}")->subject('Contact from ' . $request->first_name);
        });

        return back()->with('success', 'Contact has been send!');
    }

    public function ajaxSearch(Request $request)
    {
        $keyword = $request->keyword;
        $category_id = $request->category_id;
        $city_id = $request->city_id;

        $places = Place::query()
            ->with(['city' => function ($query) {
                return $query->select('id', 'name', 'slug');
            }])
            ->whereTranslationLike('name', "%{$keyword}%")
            ->orWhere('address', 'like', "%{$keyword}%")
            ->where('status', Place::STATUS_ACTIVE);

        if ($category_id) {
            $places->where('category', 'like', "%{$category_id}%");
        }

        if ($city_id) {
            $places->where('city_id', $city_id);
        }

        $places = $places->get(['id', 'city_id', 'name', 'slug', 'address']);

        $html = '<ul class="custom-scrollbar">';
        foreach ($places as $place):
            if (isset($place['city'])):
                $place_url = route('place_detail', $place->slug);
                $city_url = route('city_detail', $place['city']['slug']);
                $html .= "
                <li>
                    <a href=\"{$place_url}\">{$place->name}</a>
                    <a href=\"{$city_url}\"><i class=\"la la-city\"></i>{$place['city']['name']}</a>
                </li>
                ";
            endif;
        endforeach;
        $html .= '</ul>';

        $html_notfound = "<div class=\"golo-ajax-result\">No place found</div>";

        count($places) ?: $html = $html_notfound;

        return response($html, 200);
    }


    public function availableItineraries(){

        $availableItineraries = session()->get('availableItineraries');
        $availableAirlines    = $this->AmadeusHelper->lowFarePlusResponseAvailableAirline($availableItineraries);
        $availableCabins      = $this->AmadeusHelper->lowFarePlusResponseAvailableCabin($availableItineraries);
        $availableStops       = $this->AmadeusHelper->lowFarePlusResponseAvailableStops($availableItineraries);
        $availablePrices      = json_encode($this->AmadeusHelper->lowFarePlusResponseAvailablePrice($availableItineraries));
        $minimumPrice         = round($availableItineraries[0]['displayTotal'] /100);
        $lastItinerary        = count($availableItineraries) - 1;
        $maximumPrice         = round($availableItineraries[$lastItinerary]['displayTotal'] / 100);

        return view('pages.frontend.flight.search_result',compact('availableItineraries','availableCabins','availableAirlines','minimumPrice','maximumPrice','availableStops','availablePrices'));
    }

    public function itineraryBooking(){

        $itineraryPricingInfo = session()->get('itineraryPricingInfo');
        $selectedItinerary    = session()->get('selectedItinerary');
        $flightSearchParam    = session()->get('flightSearchParam');

        $months = [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
        ];

        return view('pages.frontend.flight.itinerary_booking',compact('itineraryPricingInfo','selectedItinerary','flightSearchParam','months'));

    }

    public function flightBookingPayment(){

        $itineraryPricingInfo   = session()->get('itineraryPricingInfo');
        $selectedItinerary      = session()->get('selectedItinerary');
        $flightSearchParam      = session()->get('flightSearchParam');
        $pnr = session()->get('pnr');
        $booking = FlightBooking::where('pnr',$pnr)->first();
        $banks = BankDetail::where('status',1)->get();

        return view('pages.frontend.flight.payment_option',compact('itineraryPricingInfo','selectedItinerary','flightSearchParam','booking','banks'));

    }

    public function flightPaymentConfirmation(){

          $paymentInfo            = session()->get('paymentInfo');
          $itineraryPricingInfo   = session()->get('itineraryPricingInfo');
          $selectedItinerary      = session()->get('selectedItinerary');
          $flightSearchParam      = session()->get('flightSearchParam');
          $pnr = session()->get('pnr');
          $booking = FlightBooking::where('pnr',$pnr)->first();
          $profile = Profile::getUserInfo(auth()->user()->id);
          return view('pages.frontend.flight.payment_confirmation',compact('paymentInfo','itineraryPricingInfo','selectedItinerary','flightSearchParam','booking','profile'));

    }

    public function palindrome($string){
        $cleanString = preg_replace("/[^a-zA-Z]+/","",$string);
        $stringLength = strlen($cleanString);
        $validator = 0;
        for($i = 0; $i < $stringLength; $i++){
            $initial = strtolower(substr($cleanString,$i,1));
            $later = strtolower(substr($cleanString,(-1-$i),1));
            if($initial != $later){
                $validator = $validator + 1;
            }
        }
        if($validator > 0){
            return "It is not a palindrome";
        }
        return "It is a palindrome";
    }

    public function availableHotels(){


        $hotels = session()->get('availableHotels');

        $hotelSearchParam = session()->get('hotelSearchParam');

        $availableHotels =  $this->AmadeusHelper->hotelAvailResponseSort($hotels);

        $ratings = [];
        $prices = [];
        foreach($availableHotels as $serial => $availableHotel){
            array_push($ratings,$availableHotel['hotelStarRating']);
            array_push($prices,round($availableHotel['minimumRate'] / 100));
        }

        $starRatings = array_values(array_unique($ratings));
        $minimumPrice = round(min($availableHotels)['minimumRate'] / 100);
        $maximumPrice = round(max($availableHotels)['minimumRate'] / 100);
        $availablePrices = json_encode(array_values(array_unique($prices)));
        return view('pages.frontend.hotel.search_result',compact('availableHotels','hotelSearchParam','minimumPrice','maximumPrice','starRatings','availablePrices'));

    }

    public function hotelInformation(){
        $selectedHotel = session()->get('selectedHotelInformation');
        $hotelInformation = $this->AmadeusHelper->hotelAvailRoomResponseSort($selectedHotel);
        return view('pages.frontend.hotel.hotel_details',compact('hotelInformation'));
    }

    public function hotelRoomBooking($id){

        $hotelInformation = $this->HotelController->selectedHotel();
        $searchParam      = session()->get('hotelSearchParam');
        $selectedRoom     = $hotelInformation['availableRooms'][$id];
        $hotelRoomInformation = session()->get('selectedHotelRoomInformation');
        $vat = 0;
        $adminMarkDown = 0;
        $agentMarkDown = 0;
        $agentMarkup = 0;
        $customerMarkDown = 0;
        $customerMarkup = 0;
        $voucherId = 0;
        $voucherAmount = 0;
        $totalAmount = 0;

        $agentMarkupInfo    = Markup::where('role_id', 2)->first();
        $customerMarkupInfo = Markup::where('role_id', 3)->first();
        $vatInfo            = Vat::where('id',1)->first();

        $agentMarkup    = $this->AmadeusHelper->priceTypeCalculator($agentMarkupInfo->hotel_markup_type,$agentMarkupInfo->hotel_markup_type,$selectedRoom['roomPrice']);
        $customerMarkup = $this->AmadeusHelper->priceTypeCalculator($customerMarkupInfo->hotel_markup_type,$customerMarkupInfo->hotel_markup_type,$selectedRoom['roomPrice']);
        $adminMarkup    = 0;
        $vat            = $this->AmadeusHelper->priceTypeCalculator($vatInfo->hotel_vat_type,$vatInfo->hotel_vat_type,$selectedRoom['roomPrice']);

        $adminTotalAmount = $selectedRoom['roomPrice'];
        $agentTotalAmount = $selectedRoom['roomPrice'] + $agentMarkup - $agentMarkDown + $vat;
        $customerTotalAmount = $selectedRoom['roomPrice'] + $customerMarkup - $customerMarkDown + $vat;

        $selectedRoom['vat'] = round($vat);
        $selectedRoom['agentMarkDown'] = round($agentMarkDown);
        $selectedRoom['agentMarkUp'] = round($agentMarkup);
        $selectedRoom['customerMarkDown'] = round($customerMarkDown);
        $selectedRoom['customerMarkUp'] = round($customerMarkup);
        $selectedRoom['adminMarkDown'] = round($adminMarkDown);
        $selectedRoom['adminMarkUp'] = round($adminMarkup);
        $selectedRoom['voucherId'] = $voucherId;
        $selectedRoom['voucherAmount'] = $voucherAmount;
        $selectedRoom['adminTotalAmount']    = round($adminTotalAmount);
        $selectedRoom['agentTotalAmount']    = round($agentTotalAmount);
        $selectedRoom['customerTotalAmount'] = round($customerTotalAmount);

        session()->put('selectedRoom',$selectedRoom);
        $titles = Title::all();
        return view('pages.frontend.hotel.hotel_booking',compact('hotelRoomInformation','searchParam','selectedRoom','hotelInformation','titles'));

    }

    public function hotelBookingPaymentPage(){
        $hotelInformation = $this->HotelController->selectedHotel();
        $searchParam      = session()->get('hotelSearchParam');
        $selectedRoom     = session()->get('selectedRoom');
        $hotelRoomInformation = session()->get('selectedHotelRoomInformation');
        $banks = BankDetail::where('status',1)->get();
        $titles = Title::all();
        return view('pages.frontend.hotel.hotel_payment_option',compact('hotelRoomInformation','searchParam','selectedRoom','hotelInformation','banks','titles'));
    }

    public function hotelBookingCompletion(){
        $hotelInformation = $this->HotelController->selectedHotel();
        $searchParam      = session()->get('hotelSearchParam');
        $selectedRoom     = session()->get('selectedRoom');
        $paymentInfo      = session()->get('paymentInfo');
        $bookingInfo      = HotelBooking::where('reference',$selectedRoom['bookingReference'])->first();


        return view('pages.frontend.hotel.hotel_payment_confirmation',compact('hotelInformation','searchParam','selectedRoom','paymentInfo','bookingInfo'));
    }

    public function flightDeals(){

        $flights = TravelPackage::where('attraction',0)
            ->where('hotel', 0)
            ->where('flight', 1)
            ->where('status', 1)
            ->orderBy('id','desc')
            ->paginate(8);

        return view('pages.frontend.deal.flight',compact('flights'));
    }

    public function hotelDeals(){

        $hotelDeals = TravelPackage::orderBy('id','desc')
            ->where('attraction',0)
            ->where('hotel', 1)
            ->where('flight', 0)
            ->where('status', 1)
            ->with('images')
            ->with('hotelDeal')
            ->get();
        return view('pages.frontend.deal.hotel',compact('hotelDeals'));
    }

    public function attractionDeals(){

        $attractionDeals = TravelPackage::where('attraction',1)
            ->where('hotel', 0)
            ->where('flight', 0)
            ->where('status', 1)
            ->orderBy('id','desc')
            ->with('images')
            ->with('sightSeeing')
            ->orderBy('id','desc')
            ->paginate(8);
        return view('pages.frontend.deal.attraction',compact('attractionDeals'));

    }

    public function hotDeals(){

        $hotDeals = TravelPackage::where('status', 1)
            ->with('flightDeal')
            ->with('hotelDeal')
            ->with('attractionDeal')
            ->with('sightSeeing')
            ->with('images')
            ->orderBy('id','desc')
            ->paginate(8);
        return view('pages.frontend.deal.attraction',compact('hotDeals'));
    }


    public function dealDetails($slug){
        
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

        $deal = TravelPackage::where('id',$id)
            ->with('hotelDeal')
            ->with('flightDeal')
            ->with('attractionDeal')
            ->with('sightSeeing')
            ->with('images')
            ->first();

        if($deal->status != 1){
            Toastr::error("The package you are trying to get is not active.");
            return back();
        }

        return view('pages.frontend.deal.details',compact('deal','place'), [
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

    public function dealBooking($id){

        $deal = TravelPackage::where('id',$id)
            ->with('hotelDeal')
            ->with('flightDeal')
            ->with('attractionDeal')
            ->with('sightSeeing')
            ->with('images')
            ->first();

        $titles = Title::all();

        if($deal->status != 1){
            Toastr::error("The package you are trying to get is not active.");
            return back();
        }

        return view('pages.frontend.deal.bookings',compact('deal','titles'));

    }

    public function dealPaymentOptions(){

        $booking_id = session()->get('deal_booking_id');

        $booking = PackageBooking::find($booking_id);

        $deal = TravelPackage::where('id',$booking->package_id)
            ->with('hotelDeal')
            ->with('flightDeal')
            ->with('attractionDeal')
            ->with('sightSeeing')
            ->with('images')
            ->first();

        $banks = BankDetail::where('status',1)->get();

        $titles = Title::all();

        return view('pages.frontend.deal.payment_options',compact('booking','deal','banks','titles'));

    }

    public function dealBookingConfirmation(){

        $booking_id = session()->get('deal_booking_id');

        $booking = PackageBooking::find($booking_id);

        $deal = TravelPackage::where('id',$booking->package_id)
            ->with('hotelDeal')
            ->with('flightDeal')
            ->with('attractionDeal')
            ->with('sightSeeing')
            ->with('images')
            ->first();

        $paymentInfo = session()->get('paymentInfo');

        return view('pages.frontend.deal.booking_confirmation',compact('booking','deal','paymentInfo'));

    }

}