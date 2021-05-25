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
        $booking = Booking::find(142);
        return view('pages.frontend.user.user_checkout', compact('booking'));
    }

    public function store(Request $request) {

        $data = $this->validate($request, [
            'booking_id' => '',
            'first_name' => 'sometimes',
            'last_name' => 'sometimes',
            'email' => 'sometimes',
            'password' => 'sometimes',
            'condition_check' => '',
            'okUrl' => '',
            'amount' => '',
            'failUrl' => '',
            'TranType' => '',
            'callbackUrl' => '', 
            'shopurl' => '',
            'currency' => '',
            'rnd' => '',
            'storetype' => '',
            'hashAlgorithm' => '',
            'lang' => '',
            'refreshtime' => '', 
            'clientid' => '',
            'BillToName' => '',
            'BillToCompany' => '',
            'BillToStreet1' => '',
            'tel' => '',
            'BillToPostalCode' => '',
            'BillToCity' => '',
            'BillToCountry' => '',
            'BillToStateProv' => '',
            'encoding' => '',
            'oid' => '',
        ]);

        $user = Auth::user();

        if(! $user)
        {

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
                    'phone_number' => $data['tel'],
                    'address' => $data['BillToStreet1'],
                ]);
            }
    
        }

        $booking = Booking::find($data['booking_id']);

        $cmi = [
            'clientid' => $data['clientid'],
            'email' => $user->email,
            'okUrl' => $data['okUrl'],
            'amount' => $data['amount'],
            'failUrl' => $data['failUrl'],
            'TranType' => $data['TranType'],
            'callbackUrl' => $data['callbackUrl'], 
            'shopurl' => $data['shopurl'],
            'currency' => $data['currency'],
            'rnd' => $data['rnd'],
            'storetype' => $data['storetype'],
            'hashAlgorithm' => $data['hashAlgorithm'],
            'lang' => $data['lang'],
            'refreshtime' => $data['refreshtime'], 
            'BillToName' => $data['BillToName'],
            'BillToCompany' => $data['BillToCompany'],
            'BillToStreet1' => $data['BillToStreet1'],
            'tel' => $data['tel'],
            'BillToPostalCode' => $data['BillToPostalCode'],
            'BillToCity' => $data['BillToCity'],
            'BillToCountry' => $data['BillToCountry'],
            'BillToStateProv' => $data['BillToStateProv'],
            'encoding' => $data['encoding'],
            'oid' => $data['oid'],
        ];

        /*

        foreach ($booking->rates as $key => $rate) {
            $count = $key + 1;
            $cmi["ProductCode{$count}"] = $rate->title;
            $cmi["Qty{$count}"] = $rate->pivot->quantity;
        }
        */
        
        return view('pages.frontend.cmi.payment', compact('cmi'));
    }
}
