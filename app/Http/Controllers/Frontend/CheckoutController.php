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
    public function store(Request $request) {

        $booking = Booking::find($request->input('booking_id'));

        /*
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
        
        */
        /*

        foreach ($booking->rates as $key => $rate) {
            $count = $key + 1;
            $cmi["ProductCode{$count}"] = $rate->title;
            $cmi["Qty{$count}"] = $rate->pivot->quantity;
        }
        */ 

        $cmi = $request->all();
        
        return view('pages.frontend.cmi.payment', compact('cmi'));
    }
}
