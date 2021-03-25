@extends('layouts.backend')
@section('content')
<div class="page-title">
        <div class="title_left">
            <h3>{{__('Create Supplier')}}</h3>
        </div>
        <div class="title_right">
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('admin_supplier_list')}}"> {{__('Back')}}</a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12"> 
            <form method="post" action="{{ route('admin_supplier_create') }}" class="form-horizontal" role="form" enctype="multipart/form-data">
                @csrf
                  <div class="row mb-2">
                     <div class="col-md-12 col-sm-12 ">
                        <div class="dashboard_graph">
                            <div class="row x_title">
                              {{__('New Supplier')}}
                            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                    <label>{{__('Name')}}</label>
                    <input type="text" name="name" placeholder="{{__('Name')}}" class="form-control" >
                </div>
               <div class="col-md-6 form-group">
                    <label>{{__('Company Name')}}</label>
                    <input type="text" name="company_name" placeholder="{{__('Company Name')}}" class="form-control">
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
                    <input type="text" name="tax_number" placeholder="{{__('Tax Number')}}" class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('Address')}}</label>
                    <input type="text" name="address" placeholder="{{__('Address')}}"  class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('Postal Code')}}</label>
                    <input type="text" name="postal_code" placeholder="{{__('Postal Code')}}" class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('City')}}</label>
                    <input type="text" name="city" placeholder="{{__('City')}}" class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label>{{__('Country')}}</label>
                    <input type="text" name="country" placeholder="{{__('Country')}}" class="form-control">
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


