@extends('layouts.app')

@section('page-title') Welcome @endsection

@section('css')
<link rel="stylesheet" href="{{asset('frontend/assets/css/intlTelInput.min.css')}}">
@endsection

@php
    $checkout_title_bg = "style='background-image:url(/assets/images/img-bg-blog.png)'";
@endphp
@section('content')
<main id="main" class="site-main">
  <div class="page-title page-title--small page-title--blog align-left" {!! $checkout_title_bg !!}>
    <div class="container">
        <div class="page-title__content">
            <h1 class="page-title__name">
                    {{__('Checkout')}}
            </h1>
        </div>
    </div>
  </div><!-- .page-title -->
  <div class="container-fluid my-5">
    <form action="{{route('checkout_store')}}" method="POST">
      @csrf
      <div class="row">
        <div class="col-md-4">
          <table class="table">
            <thead>
              <th>{{ __('Name') }}</th>
              <th>{{ __('Price') }}</th>
            </thead>
            <tbody>
            @foreach($booking->rates as $key => $rate)
              <tr>
                  <td>{{ $rate->title }}</td>
                  <td>{{ $rate->price }}</td>
              </tr>
            @endforeach
            </tbody>
          </table>
        </div>
        <div class="col-md-4">
          <div class="row">
            <div class="form-group col-md-6">
              <label for="first_name">{{ __('First name') }}</label>
              <input type="text" class="form-control" name="first_name" placeholder="First name">
            </div>
            <div class="form-group col-md-6">
              <label for="last_name">{{ __('Last name') }}</label>
              <input type="text" class="form-control" name="last_name" placeholder="Last name">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label for="email">Email</label>
              <input type="email" class="form-control" name="email" placeholder="Email">
            </div>
            <div class="form-group col-md-6">
              <label for="password">Password</label>
              <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-12">
              <label for="address">Address</label>
              <input type="text" class="form-control" name="address1" placeholder="1234 Main St">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-8">
              <label for="phone">Phone</label>
              <input type="tel" name="phone" id="phone" class="form-control" autocomplete="off" data-intl-tel-input-id="0" required>
            </div>
            <div class="form-group col-md-4">
              <label for="zip">Zip</label>
              <input type="text" class="form-control" name="zip">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label for="city">City</label>
              <input type="text" class="form-control" name="city">
            </div>
            <div class="form-group col-md-6">
              <label for="state">State</label>
              <select name="state" class="form-control">
                <option selected>Casablanca</option>
                <option>...</option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-12">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="condition_check" required>
                <label class="form-check-label" for="condition_check">
                  Check me out
                </label>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          cmi method
        </div>
      </div>
      <div class="row">
        <button type="submit" class="btn btn-primary">Payment <i class="fa fa-angle-right"></i></button>
      </div>
    </form>
  </div>
</main>
@endsection

@section('javascript')
<script src="{{asset('frontend/assets/js/intlTelInput.min.js')}}"></script>
<script>
  var input = document.querySelector("#phone");
  window.intlTelInput(input, {
    initialCountry: "MA",
    autoHideDialCode: true,
    autoPlaceholder: true,
    nationalMode: false,
  });
</script>
@endsection