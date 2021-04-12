<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="">
    <meta name="keywords" content="travel, tourism, tickets, flight, hotel">
    <meta name="author" content="{{config('app.name')}}">
    <title> {{config('app.name')}} - @yield('page-title')</title>
    <script type="text/javascript">
        var baseUrl = "{{url("/")}}";
        var path = "{{ route('typeaheadJs') }}";
        var airline_path = "{{ route('airlineTypeAheadJs') }}";
    </script>
@include('partials.backend.css')
@section('css')
<link rel="stylesheet" href="{{asset('backend/app-assets/css/cards.css')}}">
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>

@endsection
</head>
<body class="vertical-layout vertical-content-menu 2-columns   menu-expanded fixed-navbar" data-open="click" data-menu="vertical-content-menu" data-col="2-columns">

<!-- fixed-top-->
@include('partials.backend.header')
<div class="app-content content">
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        @include('partials.backend.sidebar')
        <div class="content-body">
          <h2> CHOOSE A TEMPLATE </h2>
          <div class="row">
            <div class="card-group col-md-12 col-sm-12 col-xs-12 bg-white" style='padding:10px;'>
                <div class="card">
@php
$id= request()->route('id');
@endphp
                  <a href="{{route('invoice_sale1', $id)}}">
                  <img class="card-img-top" src="https://templates.invoicehome.com/invoice-template-us-neat-750px.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template1</h4>
                    <p class="card-text" style="text-align: justify; padding:10px;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum est corrupti, sequi eaque eligendi a veritatis fuga praesentium recusandae quod? Blanditiis fuga dolores animi officia. Est inventore repellendus facilis cum?</p>
                  </div>
                  </a>
                </div>
                <div class="card">
                 <a href="{{route('invoice_sale2', $id)}}">
                  <img class="card-img-top" src="https://trulysmall.com/wp-content/uploads/2020/12/green-invoice-template.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center; padding-top:40px;">template2</h4>
                    <p class="card-text" style="text-align: justify; padding:10px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae quisquam sit optio, saepe deleniti quam aliquid ex quas enim corrupti, natus, quis obcaecati numquam officia! Labore sunt magni sed assumenda!</p>
                  </div>
                  </a>
                </div>
                <div class="card">
                <a href="{{route('invoice_sale3', $id)}}">
                  <img class="card-img-top" src="https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template3</h4>
                    <p class="card-text" style="text-align: justify; padding:10px;">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rem, non eius ea cupiditate dolore libero ipsam. Deserunt iste voluptates doloribus, quidem repellendus obcaecati doloremque architecto quaerat totam, reprehenderit, id veritatis?</p>
                  </div>
                  </a>
                </div>
              </div>
            </div>

        </div>
    </div>
</div>
@include('partials.backend.footer')

@include('partials.backend.js')
@yield('javascript')
{!! Toastr::render() !!}
</body>