<?php

namespace App\Http\Controllers\Frontend;

use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Booking;
use App\Place;
use App\Offer;
use App\User;
use Carbon\Carbon;
use nilsenj\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Services\PortalCustomNotificationHandler;

class BookingController extends Controller
{
    private $response;

    public function __construct(Response $response)
    {
        $this->response = $response;
    }

    public function booking(Request $request)
    {

        $data = $this->validate($request, [
            'numbber_of_adult' => '',
            'numbber_of_children' => '',
            'date' => '',
            'end_date' => '',
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'message' => '',
            'type' => ''
        ]);

        if($request->has('place_id'))
            $place = Place::find($request->place_id);
        else if($request->has('offer_id'))
            $place = Offer::find($request->offer_id);

        if($place) {

            // generate refenrce number
            $reference = Booking::latest()->first() ? 
                $place->reference . Booking::latest()->first()->id . Carbon::now()->format('dmy') : 
                $place->reference . '1' . Carbon::now()->format('dmy');

            $booking = new Booking();
            $booking->fill([
                'user_id' => Auth::id() ?? NULL,
                'reference' => $reference,
                'numbber_of_adult' => $data['numbber_of_adult'],
                'numbber_of_children' => $data['numbber_of_children'],
                'date' => Carbon::parse($data['date']),
                'end_date' => Carbon::parse($data['end_date']),
                'name' => $data['name'],
                'email' => $data['email'],
                'phone_number' => $data['phone_number'],
                'type' => $data['type'],
            ]);

            $booking->bookable()->associate($place);
            $booking->save();

            if ($booking) {
                
        
                PortalCustomNotificationHandler::bookingCreated($booking);

                if($request->has('offer_id'))
                    $this->addToCart($booking);
            
                Toastr::success('Vous avez créé votre réservation avec succès','Success');
        
                return $this->response->formatResponse(200, $booking, 'Vous avez créé votre réservation avec succès!');
            }
        }

    }

    public function cart()
    {
        return view('pages.frontend.user.user_cart');
    }
    
    public function addToCart($booking)
    {
        $cart = session()->get('cart');
         
        $cart_booking = new CartBooking(
            $booking->bookable->name,
            $booking->bookable->thumb,
            $booking->bookable->price,
            Carbon::parse($booking->date)->diffInDays(Carbon::parse($booking->end_date)) + 1,
            $booking->numbber_of_adult,     // number of persons
            $booking->numbber_of_adult,
            $booking->numbber_of_children,
        );

        $cart[$booking->id] = [
            "name" => $booking->bookable->name,
            "thumb" => $booking->bookable->thumb,
            "quantity" => $booking->numbber_of_adult,
            "days" => Carbon::parse($booking->date)->diffInDays(Carbon::parse($booking->end_date)) + 1,
            "price" => $booking->bookable->price,
            'adults' => $booking->numbber_of_adult,
            'children' => $booking->numbber_of_children,                        
        ];

        // add element to cart 
        session()->put('cart', $cart);      
    }

    public function update(Request $request)
    {
        if($request->id and $request->quantity)
        {
            $cart = session()->get('cart');
            $cart[$request->id]["quantity"] = $request->quantity;
            $cart[$request->id]["person"] = $request->person;
            
            session()->put('cart', $cart);
            $subTotal = $cart[$request->id]['quantity'] * $cart[$request->id]['person'] * $cart[$request->id]['price'];
            $total = $this->getCartTotal();
            
            return back()->with('success', 'Offer added to cart successfully!');      

            session()->flash('success', 'Cart updated successfully');
        }
    }

    public function remove(Request $request)
    {
        if($request->id) {
            $cart = session()->get('cart');
            if(isset($cart[$request->id])) {
                unset($cart[$request->id]);
                session()->put('cart', $cart);
            }
            $total = $this->getCartTotal();
            
            return back()->with('success', 'Offer added to cart successfully!');      

            session()->flash('success', 'Offer removed successfully');
        }
    }

    /**
     * getCartTotal
     *
     *
     * @return float|int
     */
    private function getCartTotal()
    {
        $total = 0;
        $cart = session()->get('cart');

        foreach($cart as $id => $details) {
            $total += $details['price'] * $details['quantity'] * $details['person'];
        }

        return number_format($total, 2);
    }

}

class CartBooking 
{
    public $name;
    public $thumb;
    public $price;
    public $days;
    public $persons;
    public $adults;
    public $children;

    function __construct($name, $gallery, $price, $days, $persons, $adults, $children) {
        $this->name = $name;
        $this->gallery = $gallery;
        $this->price = $price;
        $this->days = $days;
        $this->persons = $persons;
        $this->adults = $adults;
        $this->children = $children;
    }
}