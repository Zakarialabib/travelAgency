@extends('layouts.backend')
@section('content')
<div class="page-title">
        <div class="title_left">
            <h3>{{__('Create Customer')}}</h3>
        </div>
        <div class="title_right">
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('admin_customer_list')}}"> {{__('Back')}}</a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12"> 
            <form method="post" action="{{ route('admin_customer_create') }}" class="form-horizontal" role="form" enctype="multipart/form-data">
                @csrf
                  <div class="row mb-2">
                     <div class="col-md-12 col-sm-12 bg-white ">
                        <div class="dashboard_graph">
                            <div class="row x_title">
                              {{__('New Customer')}}
                            </div>
           <div class="row">
                <div class="col-md-6 form-group">
                    <label>{{__('Name')}}</label>
                    <input type="text" name="name" placeholder="{{__('Name')}}" class="form-control" >
                </div>
               <div class="col-md-6 form-group">
                    <label>{{__('Company Name')}}</label>
                    <input type="text" name="company_name" class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('Email')}}</label>
                    <input type="email" name="email" placeholder="{{__('Email')}}" class="form-control" >
                </div>


                    <div class="col-md-6 form-group">
                    <label>{{__('Phone Number')}}</label>
                    <input type="text" name="phone_number" placeholder="{{__('Phone Number')}}" class="form-control" >
                    </div>

                    <div class="col-md-6 form-group">
                                    <label>{{__('Tax Number')}}</label>
                                    <input type="text" name="tax_no" class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                    <label>{{__('Address')}}</label>
                                    <input type="text" name="address" class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                    <label>{{__('Postal Code')}}</label>
                                    <input type="text" name="postal_code" class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                    <label>{{__('City')}} *</label>
                                    <input type="text" name="city" class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                    <label>{{__('Country')}}</label>
                                    <input type="text" name="country" class="form-control">
                            </div>
                                    <div class="clearfix"></div>
                                </div>
                   

                <div class="row m-b-md">
                    <div class="col-md-12">
                        <button class="btn-primary btn">
                             {{__('Save')}}
                        </button>
                    </div>
                </div>
                </div>
                        </div>
            </form>
        </div>
    </div>

@stop


