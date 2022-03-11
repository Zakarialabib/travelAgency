<?php

namespace App\Http\Controllers\Backend;


use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\Place;
use App\Models\Package;
use App\Models\User;
use App\Models\Profile;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use nilsenj\Toastr\Facades\Toastr;
use App\Services\PortalCustomNotificationHandler;

class BookingController extends Controller
{
    public function list()
    {

        $user = User::where('is_admin','=',1)->first();

        $bookings = Booking::query()
      //      ->where('id', Auth::user()->id)
            ->with('user')
            ->with('place')
            ->with('offer')
            ->orderBy('created_at', 'desc')
            ->get();

//        return $bookings;

        return view('pages.backend.bookings.booking_list', [
            'bookings' => $bookings,
            'user' => $user
        ]);
    }

    public function create(Request $request)
    {
        $users = User::all();
        $booking = Booking::all();
        $places = Place::all();
        $packages = Package::query()
        ->with('offer')
        ->get();
  
        return view('pages.backend.bookings.booking_create', [
            'places' => $places,
            'users' => $users,
            'packages' => $packages,
            'booking' => $booking,
        ]);
    }



    public function store(Request $request)
    {
        $users = User::all();
      
        $request['user_id'] = Auth::id();

        $data = $this->validate($request, [
            'numbber_of_adult' => '',
            'numbber_of_children' => 'sometimes',
            'date' => '',
            'end_date' => 'sometimes',
            'name' => '',
            'email' => '',
            'phone_number' => '',
            'type' => '',
            'status' => '',
        ]);
        
        if($request->has('place_id')) {
            $places = Place::find($request->place_id);
        }
        else if($request->has('package_id')) {
            $packages = Package::find($request->package_id);
        }
        
        if($places) {

            // generate refenrce number
            $reference = Carbon::now()->format('ymd') . mt_rand(1000000, 9999999);

            $booking = new Booking();
            $booking->fill([
                'user_id' => Auth::id() ?? NULL,
                'reference' => $reference,
                'numbber_of_adult' => $data['numbber_of_adult'],
                'numbber_of_children' => $data['numbber_of_children'] ?? 0,
                'date' => Carbon::parse($data['date']),
                'end_date' => $data['end_date'],
                'name' => $data['name'],
                'email' => $data['email'],
                'phone_number' => $data['phone_number'],
                'type' => $data['type'],
            ]);

            $booking->bookable()->associate($places);
            $booking->save();
            
            PortalCustomNotificationHandler::bookingCreated($booking);
            return redirect()->route('booking_list', compact('booking','places','users'));
                
        } else if ($request->has('package_id')){

            $packages = Package::find($request->package_id);
            // generate refenrce number
            $reference = Carbon::now()->format('ymd') . mt_rand(1000000, 9999999);

            $booking = new Booking();
            $booking->fill([
                'user_id' => Auth::id() ?? NULL,
                'reference' => $reference,
                'numbber_of_adult' => $data['numbber_of_adult'],
                'numbber_of_children' => $data['numbber_of_children'] ?? 0,
                'date' => Carbon::parse($data['date']),
                'end_date' => $data['end_date'],
                'name' => $data['name'],
                'email' => $data['email'],
                'phone_number' => $data['phone_number'],
                'type' => $data['type'],
            ]);

            $booking->bookable()->associate($packages);
            $booking->save();
            
            PortalCustomNotificationHandler::bookingCreated($booking);

           
            
            return redirect()->route('booking_list', compact('booking','places','users'));
                
        }

    }      

      /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $booking = Booking::find($id);
        $places = Place::all();
        $users = User::all();

        $profile = \App\Models\Profile::where('user_id',$booking->user_id)->first();
        $user['profile'] = $profile;

        return view('pages.backend.bookings.booking_edit',compact('booking','profile','users','places'));
    }


    public function update(Request $request)
    {

        $user = auth()->user();
    $userProfile = Profile::getUserInfo($user->id);
    $user['profile'] =  $userProfile;

    $data = $this->validate($request, [
        'user_id' => '',
        'place_id' => '',
        'numbber_of_adult' => '',
        'numbber_of_children' => '',
        'date' => '',
        'name' => '',
        'email' => '',
        'phone_number' => '',
        'price' => '',
        'message' => '',
        'type' => '',
        'status' => '',
    ]);

    $booking = Booking::find($request->booking_id);
    $data = $request->all();
    $booking->update($data);

    if($booking){
        Toastr::success('Reservation à jour avec succès!');
    }
    else{
        Toastr::error('Impossible de faire la mise à jour');
    }

   return redirect()->route('booking_list');    
    
}

    public function updateStatus(Request $request)
    {
        $data = $this->validate($request, [
            'status' => 'required',
        ]);

        $model = Booking::find($request->booking_id);
        $model->fill($data)->save();

      if($model){
        Toastr::success('Status à jour avec Succès!');
    }
    else{
        Toastr::error('Impossible de faire la mise à jour');
    }


        return back()->with('success', 'Status à jour avec Succès!');
    }
    
    public function destroy($id)
    {
        Booking::destroy($id);
        return back()->with('success', 'Reservation supprimé avec succès!');
    }




}