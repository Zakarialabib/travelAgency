@extends('layouts.backend')
<!-- popup -->
@php
$id= request()->route('id');
@endphp
<!-- end popup -->
@section('content')
<div>
          <h2> CHOOSE A TEMPLATE </h2>
          <div class="row">
            <div class="card-group col-md-12 col-sm-12 col-xs-12 bg-white" style='padding:10px;'>
                @foreach ($templates as $key => $template)
                <div class="card">
                  <img class="card-img-top" src="{{$template->image}}" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">{{$template->name}}</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_action', ['action' => \App\Invoice::PREVIEW_ACTION,'type' => $type, 'id' => $id, 'template' => $template->id])}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark js-send-download" data-invoice="{{$template->id}}">  <a href="{{route('invoice_action', ['action' => \App\Invoice::DOWNLOAD_ACTION,'type' => $type, 'id' => $id, 'template' => $template->id])}}" style='text-decoration:none;color:white;'>Download</a></button>
                    <button type="button" class="btn btn-warning js-send-invoice" data-toggle="modal" data-target="#invoice-modal" data-invoice="1" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>
                @endforeach
                {{--
                <div class="card">
                  <img class="card-img-top" src="https://templates.invoicehome.com/invoice-template-us-neat-750px.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template1</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale1', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark js-send-download" data-invoice="5">  <a href="{{route('download_pdf', $id)}}" style='text-decoration:none;color:white;'>Download</a></button>
                    <button type="button" class="btn btn-warning js-send-invoice" data-toggle="modal" data-target="#invoice-modal" data-invoice="1" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>

                <div class="card">
                  <img class="card-img-top" src="https://trulysmall.com/wp-content/uploads/2020/12/green-invoice-template.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center; padding-top:40px;">template2</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale2', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark js-send-download" data-invoice="6" ><a href="{{route('download_pdf2', $id)}}" style='text-decoration:none;color:white;' > Download</a></button>
                    <button type="button" class="btn btn-warning js-send-invoice" data-toggle="modal" data-target="#invoice-modal" data-invoice="2" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>

                <div class="card">
                  <img class="card-img-top" src="https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template3</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale3', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark js-send-download" data-invoice="7"><a href="{{route('download_pdf3', $id)}}" style='text-decoration:none;color:white;' > Download </a></button>
                    <button type="button" class="btn btn-warning js-send-invoice" data-toggle="modal" data-target="#invoice-modal" data-invoice="3" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>

                <div class="card">
                  <img class="card-img-top" src="https://wcpdfinvoices.com/wp-content/themes/zerif-lite-child/images/new-invoice.png" alt="Card image cap">
                  <div class="card-block">
                    <h4 class="card-title" style="text-align:center;">template4</h4>
                    <button type="button" class="btn btn-success" ><a href="{{route('invoice_sale3', $id)}}" style='text-decoration:none;color:white;'>Preview</a></button>
                    <button type="button" class="btn btn-dark js-send-download" data-invoice="8"><a href="{{route('download_pdf4', $id)}}" style='text-decoration:none;color:white;' >Download</a></button>
                    <button type="button" class="btn btn-warning js-send-invoice" data-toggle="modal" data-target="#invoice-modal" data-invoice="4" data-whatever="@mdo"  id='ok'>Envoyer</button>
                  </div>
                </div>
                --}}
              </div>
        

        <form action="{{route('invoice_send', ['id' => $id])}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="modal fade" id="invoice-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <input type='hidden' name="type" id="js-invoice-type" value="{{$type}}" />
                    <input type='hidden' name="template_id" id="js-invoice-template" value="1" />
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
                </div>
              </div>    
            </div>    
             </form>  
            </div>    
@endsection

@push('scripts')
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script>
$('.js-send-invoice').on('click', function(event) {
  let invoiceId = $(event.target).data('invoice');
  $('#js-invoice-template').val(invoiceId);
});
</script>
@endpush

@section('css')
<link rel="stylesheet" href="{{asset('backend/app-assets/css/cards.css')}}">
@endsection