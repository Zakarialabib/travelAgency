<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Offer;

class PackageController extends Controller
{
    public function index(Request $request)
    {
        $offer = Offer::find($request->offer);
        return view('pages.backend.package.index', compact('offer'));
    }

    public function create(Request $request)
    {
        dd($request->offer);
    }
}
