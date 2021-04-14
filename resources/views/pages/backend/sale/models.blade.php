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

<!-- popup -->
@php
$id= request()->route('id');
@endphp
<!-- end popup -->
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
                  <img class="card-img-top" src="https://templates.invoicehome.com/invoice-template-us-neat-750px.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template1</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale1', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark"> <a href="{{route('download_pdf', $id)}}" style='text-decoration:none;color:white;'>Download</a></button>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>

                <div class="card">
                  <img class="card-img-top" src="https://trulysmall.com/wp-content/uploads/2020/12/green-invoice-template.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center; padding-top:40px;">template2</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale2', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark"><a href="{{route('download_pdf', $id)}}" style='text-decoration:none;color:white;' > Download</a></button>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>

                <div class="card">
                  <img class="card-img-top" src="https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template3</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale3', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark" ><a href="{{route('download_pdf', $id)}}" style='text-decoration:none;color:white;' > Download </a></button>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>

                <div class="card">
                  <img class="card-img-top" src="https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template4</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale4', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark" ><a href="{{route('download_pdf', $id)}}" style='text-decoration:none;color:white;' >Download</a></button>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                  </a>
                </div>
              </div>
            </div>

        </div>
    </div>
</div>
@include('partials.backend.footer')

<form class="" action="{{route('invoice_send_mail', $id)}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <input type='hidden' value=''
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                        <input type="text" class="form-control" id="recipient-name" name="recepient">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Subject:</label>
                        <input type="text" class="form-control" id="subject-name" name="subject">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text" name='msg'></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn-sm btn-success inline-block align-middle select-none border whitespace-no-wrap py-2 px-4 bg-blue-600 hover:bg-blue-700 focus:ring-blue-500 focus:ring-offset-blue-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg">
                    Send Mail 
                    </button>
      </form>        
                </div>
                </div>
            </div>
            </div>


@include('partials.backend.js')
@yield('javascript')
{!! Toastr::render() !!}
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

</body>