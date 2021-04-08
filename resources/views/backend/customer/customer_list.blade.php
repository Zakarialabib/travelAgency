@extends('layouts.backend')
@section('content')
    <div class="page-title">
        <div class="title_left">
            <h3>{{__('Customers')}}</h3>
        </div>
        <div class="title_right">
        <div class="pull-right">
        <a class="btn btn-primary" href="{{route('admin_customer_create_view')}}">{{__('Add New Customer')}}</a>
        </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <div class="row">
                        <div class="col-md-3 form-group">

                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">

                    <table class="table table-striped table-bordered col-5-datatable">
                        <thead>
                        <tr>
                            <th >ID</th>
                            <th width="15%">{{__('Name')}}</th>
                            <th width="15%">{{__('Email')}}</th>
                            <th width="15%">{{__('Company name')}}</th>
                            <th width="15%">{{__('Phone')}}</th>
                            <th width="15%">{{__('Created at')}}</th>
                            <th >Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($customers as $customer)
                            <tr>
                                <td>{{$customer->id}}</td>
                                <td>{{$customer->name}}</td>
                                <td>{{$customer->email}}</td>
                                <td>{{$customer->company_name}}</td>
                                <td>{{$customer->phone_number}}</td>
                                <td>{{formatDate($customer->created_at, 'H:i d/m/Y')}}</td>
                                <td>
                                <a class="btn-sm btn-warning" href="{{route('admin_customer_edit', $customer->id)}}">{{__('Edit')}}</a>
                                    <form action="{{route('admin_customer_delete',$customer->id)}}" method="POST">
                                        @method('DELETE')
                                        @csrf
                                        <button type="button" class="btn-sm btn-danger user_delete">{{__('Delete')}}</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
@stop

@push('scripts')
    <script src="{{asset('admin/js/page_user.js')}}"></script>
@endpush