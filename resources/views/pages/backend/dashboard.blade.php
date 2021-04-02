@extends('layouts.backend')

@section('page-title')  Dashboard  @endsection

@section('content')

    <div class="row">
        <div class="col-md-12">
            @if (session('status'))
                <div class="alert round bg-success alert-icon-left alert-arrow-left alert-dismissible mb-2" role="alert">
                    <span class="alert-icon"><i class="la la-thumbs-o-up"></i></span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <strong>{{__('Great !!!')}} </strong> {{ session('status') }}
                </div>
            @endif
            @if($errors->any())
                @foreach($errors->all() as $serial => $error)
                    <div class="alert round bg-danger alert-icon-left alert-arrow-left alert-dismissible mb-2" role="alert">
                        <span class="alert-icon"><i class="la la-thumbs-o-down"></i></span>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <strong>{{__('Oh snap!')}}</strong> {{$error}}
                    </div>
                @endforeach
            @endif
        </div>
    </div>

    @role('admin')

    <div class="row">
        <div class="col-xl-12 col-12">
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Flight Bookings')}}</h6>
                                        <h3>{{number_format(($generalSuccessfulFlightBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-plane primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Hotel Bookings')}}</h6>
                                        <h3>{{number_format(($generalSuccessfulHotelBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-home primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Package Bookings')}} </h6>
                                        <h3>{{number_format(($generalSuccessfulPackageBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-bag primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
       <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title text-center">{{__('Booking Size')}}</h4>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($generalTotalFlightBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Flight')}}</p>
                            </div>
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center ">
                                <h4 class="font-large-2 text-bold-400">{{number_format($generalTotalHotelBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Hotel')}}</p>
                            </div>
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($generalTotalPackageBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Packages')}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <h2><strong>{{__('Staticts')}}:</strong></h2>
    <div class="row">
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-info  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="fa fa-building text-info font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_cities}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('cities')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-warning  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="fa fa-home text-warning font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_places}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('Places')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-danger  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="fa fa-calendar text-danger font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_bookings}}</h2>
                        <p class="mb-0 line-ellipsis"> {{__('Bookings')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-primary  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="fa fa-pencil text-primary font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_reviews}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('reviews')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-success  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="fa fa-user text-success font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_users}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('Users')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-danger  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="fa fa-money text-danger font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_sales}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('Sales')}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-info  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="feather icon-eye text-info font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_purchases}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('Purchases')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-warning  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="feather icon-message-square text-warning font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">{{$count_posts}}</h2>
                        <p class="mb-0 line-ellipsis">{{__('Posts')}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-danger  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="feather icon-shopping-bag text-danger font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">00</h2>
                        <p class="mb-0 line-ellipsis">DATA</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-primary  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="feather icon-heart text-primary font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">00</h2>
                        <p class="mb-0 line-ellipsis">DATA</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-success  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="feather icon-award text-success font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">00</h2>
                        <p class="mb-0 line-ellipsis">DATA</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-content">
                    <div class="card-body">
                        <div class="avatar bg-rgba-danger  m-0 mb-1">
                            <div class="avatar-content">
                                <i class="feather icon-truck text-danger font-medium-5"></i>
                            </div>
                        </div>
                        <h2 class="text-bold-700">00</h2>
                        <p class="mb-0 line-ellipsis">DATA</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endrole

    @role('customer')

    <div class="row">
        <div class="col-xl-12 col-12">
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Flight Bookings')}}</h6>
                                        <h3>{{number_format(($userGeneralSuccessfulFlightBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-plane primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Hotel Bookings')}}</h6>
                                        <h3>{{number_format(($userGeneralSuccessfulHotelBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-home primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Package Bookings')}} </h6>
                                        <h3>{{number_format(($userGeneralSuccessfulPackageBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-bag primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title text-center">{{__('Booking Size')}}</h4>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($userGeneralTotalFlightBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Flight')}}</p>
                            </div>
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($userGeneralTotalHotelBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Hotel')}}</p>
                            </div>
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($userGeneralTotalPackageBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Packages')}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"><a>{{__('Latest Booking')}}</a></h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="la la-minus"></i></a></li>
                            <li><a data-action="expand"><i class="la la-expand"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered file-export">
                                <thead>
                                <tr>
                                    <th>{{__('Infos')}}</th>
                                    <th>{{__('Place')}}</th>
                                    <th>{{__('Booking For')}}</th>
                                    <th>{{__('Booking at')}}</th>
                                    <th>{{__('Status')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                     @foreach($bookings as $booking)
                                     <tr>
                                    @if($booking->type === \App\Booking::TYPE_BOOKING_FORM)
                                        @php
                                            $booking_name = $booking->name;
                                            $booking_email = $booking->email;
                                            $booking_phone = $booking->phone_number;
                                        @endphp
                                        <td>{{$booking_name}} -
                                            <small> {{$booking->phone_number}} - {{$booking->email}}</small>
                                        </td>
                                    @else
                                        @php
                                            $booking_name = $booking->name;
                                            $booking_email = $booking->email;
                                            $booking_phone = $booking->phone_number;
                                        @endphp
                                        <td>{{$booking_name}}</td>
                                    @endif
                                    @if(isset($booking['place']))
                                        <td><a href="{{route('place_detail', $booking['place']['slug'])}}" target="_blank">{{$booking['place']['name']}}</a></td>
                                    @else
                                        <td><i>{{__('Place deleted')}}</i></td>
                                    @endif
                                    <td>{{$booking->date}}</td>
                                    <td>{{formatDate($booking->created_at, 'H:i d/m/Y')}}</td>
                                    <td>
                                        @if($booking->status === \App\Booking::STATUS_PENDING)
                                            <span class="status-pending">{{__('PENDING')}}</span>
                                        @elseif($booking->status === \App\Booking::STATUS_ACTIVE)
                                            <span class="status-approved">{{__('Approved')}}</span>
                                        @else
                                            <span class="status-cancel">{{__('Cancel')}}</span>
                                        @endif
                                    </td>
                                    </tr>
                                        @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endrole

    @role('agent')

    <div class="row">
        <div class="col-xl-12 col-12">
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Flight Bookings')}}</h6>
                                        <h3>{{number_format(($userGeneralSuccessfulFlightBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-plane primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Hotel Bookings')}}</h6>
                                        <h3>{{number_format(($userGeneralSuccessfulHotelBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-home primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">{{__('Successful Package Bookings')}} </h6>
                                        <h3>{{number_format(($userGeneralSuccessfulPackageBookingPrice/100),2)}}DH</h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-bag primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title text-center">{{__('Booking Size')}}</h4>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($userGeneralTotalFlightBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Flight')}}</p>
                            </div>
                            <div class="col-md-4 col-12 text-center border-right-blue-grey border-right-lighten-5">
                                <h4 class="font-large-2 text-bold-400">{{number_format($userGeneralTotalHotelBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Hotel')}}</p>
                            </div>
                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400">{{number_format($userGeneralTotalPackageBookings)}}</h4>
                                <p class="blue-grey lighten-2 mb-0">{{__('Packages')}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @endrole

@endsection





@section('javascript')
    <script src="{{asset('backend/app-assets/js/scripts/pages/dashboard-sales.min.js')}}" type="text/javascript"></script>
@endsection
