@extends('layouts.app')
@section('content')
<main id="main" class="site-main place-04">
  <div class="place">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 clear-padding">
          <div class="slick-sliders">
            <div class="slick-slider photoswipe" data-item="1" data-arrows="true" data-itemscroll="1" data-dots="true" data-infinite="true" data-centermode="true" data-centerPadding="0">
              @if(isset($offer->gallery))
              @foreach($offer->gallery as $gallery)
              <div class="place-slider__item photoswipe-item">
                <a href="{{getImageUrl($gallery)}}" data-height="900" data-width="1200" data-caption="{{$gallery}}">
                  <img src="{{getImageUrl($gallery)}}" alt="{{$gallery}}">
                </a>
              </div>
              @endforeach
              @else
              <div class="place-slider__item">
                <a href="#">
                  <img src="https://via.placeholder.com/1280x500?text=Rentacstours" alt="slider no image">
                </a>
              </div>
              @endif
            </div>
            <!-- .pswp -->
          </div>
          <!-- .place-slider -->
        </div>
        <div class="col-md-6 clear-padding">
          <div class="widget widget-shadows widget-reservation">
            <h1 style="font-weight: 800;">{{$offer->name}}</h1>
            <div class="place__box place__box-overview">
              <div class="place__desc">{!! $offer->description !!} </div>
              <!-- .place__desc -->
              <a href="#" class="show-more" title="{{__('Show more')}}">{{__('Show more')}}  </a>
              @guest()
              <button class="btn btn-block btn-login open-login">{{__('Book now')}}  </button>
              @else
              <button class="btn btn-block booking_submit_btn"><a href="#booking" style="color: white;">{{__('Book now')}}</a></button>
              @endguest
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <aside  id="booking"  class="widget widget-shadow widget-reservation">
          <h3>{{__('Make a reservation')}}
          </h3>
          <form action="#" method="POST" class="form-underline" id="booking_offer_form">
            @csrf
            <div class="field-select field-input">
              <input type="text" id="name" name="name" placeholder="{{__('Enter your name')}} *" required>
            </div>
            <div class="field-select field-input">
              <input type="text" id="email" name="email" placeholder="{{__('Enter your email')}} *" required>
            </div>
            <div class="field-select field-input">
              <input type="text" id="phone_number" name="phone_number" placeholder="{{__('Enter your phone')}}">
            </div>
            <div class="field-select has-sub field-guest">
              <input type="text" placeholder="{{__('Guest')}} *" readonly>
              <i class="la la-angle-down">
              </i>
              <div class="field-sub">
                <ul>
                  <li>
                    <span>{{__('Adults')}}
                    </span>
                    <div class="shop-details__quantity">
                      <span class="minus">
                        <i class="la la-minus">
                        </i>
                      </span>
                      <input type="number" name="numbber_of_adult" value="0" class="qty number_adults">
                      <span class="plus">
                        <i class="la la-plus">
                        </i>
                      </span>
                    </div>
                  </li>
                  <li>
                    <span>{{__('Childrens')}}
                    </span>
                    <div class="shop-details__quantity">
                      <span class="minus">
                        <i class="la la-minus">
                        </i>
                      </span>
                      <input type="number" name="numbber_of_children" value="0" class="qty number_childrens">
                      <span class="plus">
                        <i class="la la-plus">
                        </i>
                      </span>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="field-select field-date">
              <input type="text" name="date" placeholder="Date *" class="datepicker" autocomplete="off">
              <i class="la la-angle-down">
              </i>
            </div>
            <div class="field-select field-date">
              <input type="text" name="end_date" placeholder="End Date *" class="datepicker" autocomplete="off">
              <i class="la la-angle-down">
              </i>
            </div>
            <input type="hidden" name="offer_id" value="{{$offer->id}}">
            <input type="hidden" name="type" value="{{\App\Booking::TYPE_CONTACT_FORM}}">
            <button class="btn booking_submit_btn">{{__('Send')}}</button>
            <p class="note">{{__("You won't be charged yet")}}
            </p>
            <div class="alert alert-success alert_booking booking_success">
              <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                  <path fill="#20D706" fill-rule="nonzero" d="M9.967 0C4.462 0 0 4.463 0 9.967c0 5.505 4.462 9.967 9.967 9.967 5.505 0 9.967-4.462 9.967-9.967C19.934 4.463 15.472 0 9.967 0zm0 18.065a8.098 8.098 0 1 1 0-16.196 8.098 8.098 0 0 1 8.098 8.098 8.098 8.098 0 0 1-8.098 8.098zm3.917-12.338a.868.868 0 0 0-1.208.337l-3.342 6.003-1.862-2.266c-.337-.388-.784-.589-1.207-.336-.424.253-.6.863-.325 1.255l2.59 3.152c.194.252.415.403.646.446l.002.003.024.002c.052.008.835.152 1.172-.45l3.836-6.891a.939.939 0 0 0-.326-1.255z">
                  </path>
                </svg>
                {{__('You successfully created your booking.')}}
              </p>
            </div>
            <div class="alert alert-error alert_booking booking_error">
              <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                  <path fill="#FF2D55" fill-rule="nonzero"
                        d="M11.732 9.96l1.762-1.762a.622.622 0 0 0 0-.88l-.881-.882a.623.623 0 0 0-.881 0L9.97 8.198l-1.761-1.76a.624.624 0 0 0-.883-.002l-.88.881a.622.622 0 0 0 0 .882l1.762 1.76-1.758 1.759a.622.622 0 0 0 0 .88l.88.882a.623.623 0 0 0 .882 0l1.757-1.758 1.77 1.771a.623.623 0 0 0 .883 0l.88-.88a.624.624 0 0 0 0-.882l-1.77-1.771zM9.967 0C4.462 0 0 4.462 0 9.967c0 5.505 4.462 9.967 9.967 9.967 5.505 0 9.967-4.462 9.967-9.967C19.934 4.463 15.472 0 9.967 0zm0 18.065a8.098 8.098 0 1 1 8.098-8.098 8.098 8.098 0 0 1-8.098 8.098z">
                  </path>
                </svg>
                {{__('Your Booking is Pending, We Will Contact You as Soon as Possible.')}}
              </p>
            </div>
          </form>
        </aside>
      </div>
    </div>
  </div>
    <!-- .place -->
    {{--    
    <div class="similar-places">
      <div class="container">
        <h2 class="similar-places__title title">{{__('Similar places')}}
        </h2>
        <div class="similar-places__content">
          <div class="row">
            @foreach($similar_places as $offer)
            <div class="col-lg-3 col-md-6">
              @include('frontend.common.place_item')
            </div>
            @endforeach
          </div>
        </div>
      </div>
    </div>
    <!-- .similar-places --> --}}
</main>
  <!-- .site-main -->
@endsection