<?php

namespace App\Http\Controllers\Frontend;

use App\Commons\Response;
use App\Http\Controllers\Controller;
use App\Booking;
use App\Place;
use App\Offer;
use App\Package;
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
        dd($request);
        
        $data = $this->validate($request, [
            'numbber_of_adult' => '',
            'numbber_of_children' => 'sometimes',
            'date' => '',
            'end_date' => 'sometimes',
            'rate' => 'sometimes',
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'message' => '',
            'type' => ''
        ]);

        if($request->has('place_id')) {
            $place = Place::find($request->place_id);
            $endDate = Carbon::parse($data['end_date']);
        }
        else if($request->has('package_id')) {
            $place = Package::find($request->package_id);
            $endDate = Carbon::parse($data['date'])->addDays($place->period);
        }

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
                'numbber_of_children' => $data['numbber_of_children'] ?? 0,
                'date' => Carbon::parse($data['date']),
                'end_date' => $endDate,
                'name' => $data['name'],
                'email' => $data['email'],
                'phone_number' => $data['phone_number'],
                'type' => $data['type'],
            ]);

            $booking->bookable()->associate($place);
            $booking->save();

            if ($booking) {
                
        
                PortalCustomNotificationHandler::bookingCreated($booking);

                if($request->has('package_id')) {
                    $booking->rates()->sync($request->rate);
                }
            
                Toastr::success('Vous avez créé votre réservation avec succès','Success');
        
                return view('pages.frontend.user.user_checkout', compact('booking'));
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

        $cart[$booking->id] = [
            "name" => $booking->bookable->name,
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