@extends('layouts.app')

@section('page-title') Details @endsection

@section('activeDeals') active @endsection

@section('content')

    {{--

    <!-- START: PAGE TITLE -->
    <div class="row page-title">
        <div class="container clear-padding text-center">
            <h3>Golf Club Rotana</h3>
            <h4>6 Nights/7 Days</h4>
            <span>Paris (2)<i class="fa fa-long-arrow-right"></i>London (2)<i class="fa fa-long-arrow-right"></i>Amesterdam (2)</span>
        </div>
    </div>
    <!-- END: PAGE TITLE -->
    --}}

    <div class="row package-detail">
        <div class="container clear-padding">
            <div class="main-content col-md-8">

                <!-- START: HOLIDAY GALLERY -->
                <div id="gallery" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      @foreach ($offer->gallery as $key => $gallery)
                      <li data-target="#gallery" data-slide-to="{{$key}}" {{($loop->first) ? 'class="active"' : ''}}></li>
                      @endforeach
                    </ol>
                    <div class="carousel-inner" role="listbox">
                      @foreach ($offer->gallery as $key => $gallery)
                      <div class="item {{($loop->first) ? 'active' : ''}}">
                        <img src="{{asset('uploads/' . $gallery)}}" alt="">
                      </div>
                      @endforeach
                    </div>
                    <a class="left carousel-control" href="#gallery" role="button" data-slide="prev">
                        <span class="fa fa-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#gallery" role="button" data-slide="next">
                        <span class="fa fa-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <!-- END: HOLIDAY GALLRY -->

                <div class="package-complete-detail">
                    <ul class="nav nav-tabs">
                        @foreach ($offer->packages as $key => $package)
                        <li class="{{$loop->first ? 'active' : ''}}">
                            <a class="package-tab" data-toggle="tab" data-period="{{$package->period}}" data-title="{{$package->title}}" data-id="{{$package->id}}" data-target=".pack-{{$key + 1}}"><i class="fa fa-suitcase"></i> <span>{{__('Package')}} {{$key + 1}}</span></a>
                        </li>    
                        @endforeach
                    </ul>
                    <div class="tab-content">
                    @foreach ($offer->packages as $key => $package)
                    <div class="pack-{{$key + 1}} {{($loop->first ? 'active in' : '')}} tab-pane fade" >
                        <h4 class="tab-heading">{{__('Features')}}</h4>
                        <p class="inc">
                            @foreach ($package->features as $feature)    
                            <i class="fa fa-check-circle"></i> {{$feature->title}}<br>
                            @endforeach
                        </p>
                        <h4 class="tab-heading">{{__('Conditions')}}</h4>
                        <p class="inc">
                            @foreach ($package->conditions as $condition)    
                            <i class="fa fa-check-circle"></i> {{$condition->title}}<br>
                            @endforeach
                        </p>
                    </div>   
                    @endforeach
                    </div>
                    
                </div>
            </div>
            <div class="col-md-4 package-detail-sidebar">
                <div class="col-md-12 sidebar-wrapper clear-padding">
                    <div class="package-summary sidebar-item">
                        <h4><i class="fa fa-bookmark"></i> Package Summary</h4>
                        <div class="package-summary-body">
                            <h5><i class="fa fa-heart"></i>{{__('Offer')}}</h5>
                            <p>{{$offer->name}}</p>
                            <h5><i class="fa fa-map-marker"></i>{{__('Package')}}</h5>
                            <p><span id="package-title">{{$offer->packages->first()->title}}</span></p>
                            <h5><i class="fa fa-globe"></i>{{__('City')}}</h5>
                            <p>{{$offer->city->name}}</p>
                            <h5><i class="fa fa-globe"></i>{{__('Min Stay')}}</h5>
                            <p><span id="min-stay">{{$offer->packages->first()->period}}</span> {{__('nights')}}</p>
                        </div>
                    </div>
                    <div class="sidebar-booking-box">
                        <h3 class="text-center">MAKE A BOOKING</h3>
                        <div class="booking-box-body">
                            <form action="{{route('booking_submit')}}" method="POST">
                                @csrf
                                <input type="hidden" id="package_id" name="package_id" value="{{$offer->packages->first()->id}}">
                                <input type="hidden" name="type" value="{{\App\Booking::TYPE_BOOKING_FORM}}">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Start</label>
                                        <input 
                                        type="date" 
                                        id="check_in" 
                                        name="date" 
                                        class="form-control" 
                                        value="{{\Carbon\Carbon::today()->format('Y-m-d')}}">
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>{{__('Person')}}</label>
                                        <select class="form-control" name="numbber_of_adult">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                        </select>
                                    </div>
                                    <div class="tab-content">
                                        @foreach ($offer->packages as $key => $package)
                                        <div class="pack-{{$key + 1}} {{($loop->first ? 'active in' : '')}} tab-pane fade">
                                            @foreach ($package->rates as $rate)    
                                            <div class="room-price" data-start-date="{{$rate->start_date}}" data-end-date="{{$rate->end_date}}">
                                                <div class="col-md-8 col-sm-8 col-xs-8">
                                                    <label><input type="checkbox" class="rate" name="rate[]" value="{{$rate->id}}" data-price="{{$rate->price}}"><span>{{$rate->title}}</span></label>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-4">
                                                    <h5>{{$rate->price}}</h5>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            @endforeach
                                        </div>
                                        @endforeach
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>{{__('Name')}}</label>
                                        <input class="form-control" type="text" id="name" name="name" placeholder="{{__('Enter your name')}} *" required>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>{{__('Email')}}</label>
                                        <input class="form-control" type="text" id="email" name="email" placeholder="{{__('Enter your email')}} *" required>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>{{__('Phone')}}</label>
                                        <input class="form-control" type="text" id="phone_number" name="phone_number" placeholder="{{__('Enter your phone')}}" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="grand-total text-center">
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h4>Total <span id="total">0</span> DH</h4>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <button type="submit">BOOK</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--
                    <div class="assistance-box sidebar-item">
                        <h4><i class="fa fa-phone"></i> Need Assistance</h4>
                        <div class="assitance-body text-center">
                            <h5>Need Help? Call us or drop a message. Our agents will be in touch shortly.</h5>
                            <h2>+91 1234567890</h2>
                            <h3>Or</h3>
                            <a href="mailto:info@yourdomain.com"><i class="fa fa-envelope-o"></i> Email Us</a>
                        </div>
                    </div>
                    <div class="review sidebar-item">
                        <h4><i class="fa fa-comments"></i> Package Reviews</h4>
                        <div class="sidebar-item-body text-center">
                            <div class="rating-box">
                                <div class="col-md-6 col-sm-6 col-xs-6 clear-padding tripadvisor">
                                    <img src="assets/images/tripadvisor.png" alt="cruise"><br>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <h5>4.0/5.0 Based on 12 Reviews</h5>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 clear-padding">
                                    <i class="fa fa-users"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <h5>Based on 128 Guest Reviews</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="guest-say rating-box">
                                <h2><i class="fa fa-check-circle"></i> Perfect</h2>
                                <div>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5 clear-padding user-img">
                                    <img src="assets/images/user1.jpg" alt="cruise">
                                </div>
                                <div class="col-md-7 col-sm-7 col-xs-7 clear-padding user-name">
                                    <span>Lenore, USA</span>
                                    <span>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </div>
    <!-- END: ROOM GALLERY -->

@endsection

@push('scripts')
<script>
$(document).ready(function() {

    handleRoomPrices(new Date($('#check_in').val()));

    $('#check_in').on('change', function() {
        handleRoomPrices(new Date($(this).val()));
    });

    $('.rate').on('change', function() {
        $('#total').text(calculateTotal());
    });

    $('.package-tab').on('click', function() {
        $('#package_id').val($(this).data('id'))
        $('#package-title').text($(this).data('title'));
        $('#min-stay').text($(this).data('period'));
        $('#total').text(0);

        $('.rate').each(function(index) {
            $(this).prop( "checked", false );
        });
    });
});

function calculateTotal() {
    let total = 0;
    $('.rate').each(function(index) {
        if($(this).is(':checked'))
            total += parseFloat($(this).data('price'));
    });
    return total;
}

function handleRoomPrices(checkInDate) {
    $('.room-price').each(function(index) {
        let roomStartDate = new Date($(this).data('start-date'));
        let roomEndDate = new Date($(this).data('end-date'));

        if(isDateValid(checkInDate, roomStartDate, roomEndDate))
            $(this).show();
        else
            $(this).hide();
    });
}

function isDateValid(checkIn, start, end) {
    let isValid = false;

    if(checkIn >= start && checkIn <= end)
        isValid = true;

    return isValid;
}
</script>
@endpush
