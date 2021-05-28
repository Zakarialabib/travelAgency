@extends('layouts.app')

@section('page-title') Welcome @endsection

@section('css')
<link rel="stylesheet" href="{{asset('frontend/assets/css/intlTelInput.min.css')}}">
@endsection

@php
    $checkout_title_bg = "style='background-image:url(/assets/images/img-bg-blog.png)'";
		$orgClientId  = '600002306';
    $orgOkUrl =  route('cmi_ok_fail');
    $orgFailUrl = route('cmi_ok_fail');
    $shopurl = route('home');
    $orgTransactionType = "PreAuth";
    $orgRnd =  microtime();
    $orgCallbackUrl = route('cmi_callback');
    $orgCurrency = "504";
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
    <form action="{{route('checkout_store')}}" method="POST" style="margin: 3rem 2rem;">
      @csrf
      <input type="hidden" name="booking_id" value="{{$booking->id}}">
      <input type="hidden" name="BillToCountry" value="504">
      <input type="hidden" name="clientid" value="<?php echo $orgClientId ?>"> 
      <input type="hidden" name="okUrl" value="<?php echo $orgOkUrl ?>">
      <input type="hidden" name="failUrl" value="<?php echo $orgFailUrl ?>">
      <input type="hidden" name="TranType" value="<?php echo $orgTransactionType ?>">
      <input type="hidden" name="callbackUrl" value="<?php echo $orgCallbackUrl ?>">
      <input type="hidden" name="shopurl" value="<?php echo $shopurl ?>">
      <input type="hidden" name="currency" value="<?php echo $orgCurrency ?>">
      <input type="hidden" name="rnd" value="<?php echo $orgRnd ?>">
      <input type="hidden" name="storetype" value="3D_PAY_HOSTING">
      <input type="hidden" name="hashAlgorithm" value="ver3">
      <input type="hidden" name="lang" value="fr">
      <input type="hidden" name="refreshtime" value="5">
      <input type="hidden" name="encoding" value="UTF-8">
			<input type="hidden" name="oid" value="{{$booking->reference}}"> <!-- La valeur du paramètre oid doit être unique par transaction -->
      <div class="row">
        <div class="col-md-6 mx-auto">
          <table class="table">
            <thead>
              <th>{{ __('Name') }}</th>
              <th>{{ __('Price') }}</th>
              <th>{{ __('Quantity') }}</th>
              <th>{{ __('Total') }}</th>
            </thead>
            <tbody>
            @php $total = 0; @endphp
            @foreach($booking->rates as $key => $rate)
              <tr>
                  <td>{{ $rate->title }}</td>
                  <td>{{ $rate->price }}</td>
                  <td>x {{$rate->pivot->quantity }}</td>
                  <td>{{ $rate->price * $rate->pivot->quantity }}</td>
                  @php $total += $rate->price * $rate->pivot->quantity; @endphp
              </tr>
            @endforeach
              <tr>
                <td><strong>TOTAL</strong></td>
                <td></td>
                <td></td>
                <td><strong>{{ number_format($total, 2, '.', '') }}</strong></td>
                <input type="hidden" name="amount" value="{{ number_format($total, 2, '.', '') }}">
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-md-6">
          <div class="row">
            <div class="form-group col-md-6">
              <label for="BillToName">{{ __('Bill To Name') }}</label>
              <input type="text" class="form-control" name="BillToName" placeholder="Bill To Name" value="{{$booking->name}}">
            </div>
            <div class="form-group col-md-6">
              <label for="BillToCompany">{{ __('Bill To Company') }}</label>
              <input type="text" class="form-control" name="BillToCompany" placeholder="Bill To Company">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-12">
              <label for="BillToStreet1">{{ __('Bill To Address') }}</label>
              <input type="text" class="form-control" name="BillToStreet1" placeholder="Bill To Address">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label for="BillToCity">{{ __('Bill To City') }}</label>
              <select type="text" class="form-control" name="BillToCity">
                <option selected>Casablanca</option>
                <option>...</option>
              </select>
            </div>
            <div class="form-group col-md-6">
              <label for="BillToStateProv">{{ __('Bill To State') }}</label>
              <input type="text" class="form-control" name="BillToStateProv" placeholder="Bill To State">
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label for="tel">Phone</label>
              <input type="tel" name="tel" id="phone" class="form-control" autocomplete="off" data-intl-tel-input-id="0" value="{{$booking->phone_number}}" required>
            </div>
            <div class="form-group col-md-4">
              <label for="BillToPostalCode">Zip</label>
              <input type="text" class="form-control" name="BillToPostalCode">
            </div>
          </div>
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