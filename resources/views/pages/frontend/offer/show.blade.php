@extends('layouts.app')

@section('page-title') Details @endsection

@section('content')

<section class="breadcrumbs-custom bg-image context-dark">
                <div class="breadcrumbs-custom-inner">
                    <div class="container breadcrumbs-custom-container">
                        <div class="breadcrumbs-custom-main" >
                            <h1 class="breadcrumbs-custom-title"> {{ $offer->name }}</h1>
                        </div>
                        <ul class="breadcrumbs-custom-path">
                            <li><a href="{{ route('home')}}">{{__('Home')}}</a></li>
                            <li><a href="">{{__('Offers')}}</a></li>
                            <li><a href="">{{ $offer->name }}</a></li>
                        </ul>
                    </div>
                </div>
            </section> 


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
                <ul class="nav nav-tabs">
              <li class="nav-item">
                  <a data-toggle="tab" class="nav-link active" href="#overview">
                    <i class="fa fa-suitcase">
                    </i> 
                    <span>{{__('Detail')}}
                    </span>
                  </a>
                </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active" id="overview" >
                <div class="daily-schedule-body">
                    <p>
                      {!! $offer->description !!}
                    </p>
                </div>
                    @if(isset($offer['itinerary']))
                  <div class="daily-schedule">
                    @foreach($offer['itinerary'] as $itinerary)
                    <div class="title">
                      <p>
                        <span>{{$itinerary['title']}}
                        </span>
                      </p>
                    </div>
                    <div class="daily-schedule-body">
                      <p>{!! $itinerary['description'] !!}
                      </p>                                               
                    </div>
                    @endforeach
                  </div>
                  @endif
                </div>
                </div>
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
                        <h4><i class="fa fa-bookmark"></i>{{__('Package Summary')}}</h4>
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
                        <h3 class="text-center">{{__('Make a Booking')}}</h3>
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
                                        <input class="form-control" id="persons" name="numbber_of_adult" type="number">
                                    </div>
                                    <div class="tab-content">
                                        @foreach ($offer->packages as $key => $package)
                                        <div class="pack-{{$key + 1}} {{($loop->first ? 'active in' : '')}} tab-pane fade">
                                            @foreach ($package->rates as $rate)    
                                            <div class="room-price" data-start-date="{{$rate->start_date}}" data-end-date="{{$rate->end_date}}">
                                                <div class="col-md-8 col-sm-8 col-xs-8">
                                                    <label>
                                                        <input type="checkbox" class="rate" name="rate[]" value="{{$rate->id}}:1" data-id="{{$rate->id}}" data-capacity="{{$rate->capacity}}" data-price="{{$rate->price}}">
                                                        <span>{{$rate->title}}</span>
                                                        <span>
                                                        @for ($i = 0; $i < $rate->capacity; $i++)
                                                        <i class="fa fa-user"></i>
                                                        @endfor
                                                        </span>
                                                    </label>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-4">
                                                    <h5>{{$rate->price}}</h5>
                                                    <span data-capacity="{{$rate->capacity}}" class="price-factor"></span>
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
                                            <h4>{{__('Total')}} <span id="total">0</span> DH</h4>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <button type="submit">{{__('BOOK')}}</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="assistance-box sidebar-item">
                        <h4><i class="fa fa-phone"></i> {{__('Need Assistance')}}</h4>
                        <div class="assitance-body text-center">
                            <h5>{{__('Need Help? Call us or drop a message. Our agents will be in touch shortly.')}}</h5>
                            <h2><a href="tel:{{setting('home_phone')}}"></a>{{setting('home_phone')}}</h2>
                            <h3>{{__('Or')}}</h3>
                            <a href="mailto:{{setting('home_email')}}"><i class="fa fa-envelope-o"></i> {{__('Email Us')}}</a>
                        </div>
                    </div>  
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
        $('#total').text(calculateTotal($('#persons').val()));
    });

    $('#persons').on('change', function() {
        let numberOfPersons = $(this).val();

        $('.price-factor').each(function(index) {
            let factor = calculateFactor(numberOfPersons, parseInt($(this).data('capacity')));
            $(this).text('x ' + factor);
        });

        $('.rate').each(function() {
            let factor = calculateFactor(numberOfPersons, parseInt($(this).data('capacity')));
            $(this).val(`${$(this).data('id')}:${factor}`)
        });

        $('#total').text(calculateTotal(numberOfPersons));
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

function calculateFactor(numberOfPersons, capacity) {
    return Math.ceil(numberOfPersons / capacity);
}

function calculateTotal(numberOfPersons) {
    let total = 0;
    $('.rate').each(function(index) {
        if($(this).is(':checked')) {
            let factor = calculateFactor(numberOfPersons, parseInt($(this).data('capacity')));
            total += parseFloat($(this).data('price')) * factor;
        }
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
