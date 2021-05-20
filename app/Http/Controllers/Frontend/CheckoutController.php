<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Booking;
use App\Profile;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class CheckoutController extends Controller
{
    public function show() {
        $booking = Booking::find(134);
        return view('pages.frontend.user.user_checkout', compact('booking'));
    }

    public function store(Request $request) {

        if(!$request->has('user_id'))
        {
            $data = $request->validate([
                'first_name' => '',
                'last_name' => '',
                'email' => '',
                'password' => '',
                'address' => '',
                'phone' => '',
                'zip' => '',
                'city' => '',
                'state' => '',
                'condition_check' => '',
            ]);

            $user = User::create([
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
            ]);

            if($user)
            {
                $user->attachRole(3);
        
                $user->profile()->create([
                    'sur_name' => $data['last_name'],
                    'first_name' => $data['first_name'],
                    'phone_number' => $data['phone'],
                    'address' => $data['address'],
                ]);
            }
    
        }
        else
        {
            $user = Auth::user();
        }

        return view('pages.frontend.cmi.payment', compact('user'));
    }
}
