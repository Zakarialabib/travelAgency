<?php

namespace App\Http\Controllers\Frontend;

use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Booking;
use App\Place;
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
        if ($request->date) {
            $request['date'] = Carbon::parse($request->date);
        }

        $data = $this->validate($request, [
            'place_id' => '',
            'numbber_of_adult' => '',
            'numbber_of_children' => '',
            'date' => '',
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'message' => '',
            'type' => ''
        ]);

        $data['user_id'] = Auth::user() ? Auth::user()->id : NULL; 

        // generate refenrce number
        $latest = Booking::latest()->first();
        $place = Place::find($data['place_id']);
        if($latest) {
            $data['reference'] = $place->reference . $data['user_id'] . $latest->id . Carbon::now()->format('dmy');
        } else {
            $data['reference'] = $place->reference . $data['user_id'] . '1' . Carbon::now()->format('dmy');
        }
        

        $booking = new Booking();
        $booking->fill($data);

        if ($booking->save()) {
            PortalCustomNotificationHandler::bookingCreated($booking);
            $place = Place::find($request['place_id']);

        }
        
        Toastr::success('You successfully created your booking','Success');

        return $this->response->formatResponse(200, $booking, 'You successfully created your booking!');
    }

    public function cart()
    {
        return view('frontend.user.user_cart');
    }
    public function addToCart($id)
    {
        $place = Place::find($id);
        if(!$place) {
            abort(404);
        }
        $cart = session()->get('cart');
        // if cart is empty then this the first place
        if(!$cart) {
            $cart = [
                    $id => [
                        "name" => $place->name,
                        "gallery" => $place->gallery,
                        "quantity" => 1,
                        "price" => $place->price,
                        'person' => 1,                        
                    ]
            ];
            
            session()->put('cart', $cart);
            return back()->with('success', 'Offer added to cart successfully!');      
        }
        // if cart not empty then check if this place exist then increment quantity
        if(isset($cart[$id])) {
            $cart[$id]['quantity']++;
            session()->put('cart', $cart);
            
            return back()->with('success', 'Offer added to cart successfully!');      
        }
        // if item not exist in cart then add to cart with quantity = 1
        $cart[$id] = [
            "name" => $place->name,
            "gallery" => $place->gallery,
            "quantity" => 1,
            "price" => $place->price,
            'person' => 1,
            
        ];
        
        session()->put('cart', $cart);
        
        return with('success', 'Offer added to cart successfully!');      
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