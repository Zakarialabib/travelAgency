<?php

namespace App\Http\Controllers\Backend;


use App\Http\Controllers\Controller;
use App\Booking;
use App\Place;
use App\User;
use App\Profile;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use nilsenj\Toastr\Facades\Toastr;

class BookingController extends Controller
{
    public function list()
    {
        $bookings = Booking::query()
            ->where('id', Auth::user()->id)
            ->with('user')
            ->with('place')
            ->orderBy('created_at', 'desc')
            ->get();

//        return $bookings;

        return view('backend.booking.booking_list', [
            'bookings' => $bookings
        ]);
    }

    public function create(Request $request)
    {
        $places = Place::all();
        $users = User::all();
          
        return view('backend.booking.booking_create', [
            'places' => $places,
            'users' => $users,
        ]);
    }



    public function store(Request $request)
    {
        $places = Place::all();
        $users = User::all();

        $request['user_id'] = Auth::id();

        if ($request->date) {
            $request['date'] = Carbon::parse($request->date);
        }

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

        $booking = new Booking();
        $booking->fill($data);
        $booking->save();
           
        return view('backend.booking.booking_create', [
            'booking' => $booking,
            'places' => $places,
            'users' => $users,
        ]);
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

        return view('backend.booking.booking_edit',compact('booking','users','places'));
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
        Toastr::success('Update booking success!');
    }
    else{
        Toastr::error('Unable to updated booking infos');
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
        Toastr::success('Status Updated with success!');
    }
    else{
        Toastr::error('Unable to update Status');
    }


        return back()->with('success', 'Update status success!');
    }
    
    public function destroy($id)
    {
        Booking::destroy($id);
        return back()->with('success', 'Booking Deleted with success!');
    }




}