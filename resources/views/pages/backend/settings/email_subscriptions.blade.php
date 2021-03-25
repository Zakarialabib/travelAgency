@extends('layouts.backend')

@section('page-title') {{__('Email Subscriptions')}} @endsection

@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"> {{__('Emails')}}</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="la la-minus"></i></a></li>
                            <li><a data-action="expand"><i class="la la-expand"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered file-export">
                                <thead>
                                <tr>
                                    <th>S/N</th>
                                    <th>{{__('Emails')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($emails as $serial => $email)
                                <tr>
                                    <td>{{$serial}}</td>
                                    <td>{{$email->email}}</td>
                                </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('javascript')

@endsection

@section('css')

@endsection