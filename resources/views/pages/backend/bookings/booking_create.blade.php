@extends('layouts.backend')
@section('content')
    <div class="page-title">
        <div class="title_left">
            <h3>{{ __('Create Booking') }}</h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 bg-white">
            <form method="post" action="{{ route('booking_store') }}" class="form-horizontal" role="form"
                enctype="multipart/form-data">
                @csrf
                <div class="row mb-2">
                    <div class="col-md-12 col-sm-12 bg-white ">
                        <div class="dashboard_graph">
                            <div class="row">
                               <div class="col-md-6 form-group">
                                   <label>{{ __('Deal Type') }}</label>
                                   <select id="offerselector" class="form-control myselect">
                                    <option>--Select--</option>
                                    <option value="package">{{__('TYPE PACKAGE')}}</option>
                                    <option value="place">{{__('TYPE PLACE')}}</option> 
                                  </select>
                                </div>
                             
                                <div class="col-md-6 form-group selected" id="place">
                                    <label>{{ __('Place') }}</label>
                                    <select name="place_id" id="place_id" class="form-control myselect">
                                       <option>--Select--</option>
                                        @foreach ($places as $place)
                                            <option value="{{ $place->id }}">{{ $place->name }}</option>
                                        @endforeach
                                    </select>
                                </div>


                                <div class="col-md-6 form-group selected" id="package">
                                    <label>{{ __('Package') }}</label>
                                    <select name="package_id" id="package_id" class="form-control myselect">
                                        <option>--Select--</option>
                                        @foreach ($packages as $package)
                                            <option value="{{ $package->id }}">{{ $package->offer->name }} - {{ $package->title }}</option>
                                        @endforeach
                                    </select>
                                </div>


                                <div class="col-md-6 form-group">
                                    <label>{{ __('Number of adult') }}</label>
                                    <input type="number" name="numbber_of_adult" value="0" class="form-control">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('Number of Children') }}</label>
                                    <input type="number" name="numbber_of_children" value="0" class="form-control">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('Start Date') }}</label>
                                    <input type="date" name="date" placeholder="{{ __('Start Date') }}" class="form-control"
                                        autocomplete="off">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('End Date') }}</label>
                                    <input type="date" name="end_date" placeholder="{{ __('End Date') }}" class="form-control"
                                        autocomplete="off">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('Name') }}</label>
                                    <input type="text" name="name" placeholder="{{ __('Name') }}" class="form-control">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('Email') }}</label>
                                    <input type="email" name="email" placeholder="{{ __('Email') }}"
                                        class="form-control">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('Phone Number') }}</label>
                                    <input type="text" name="phone_number" placeholder="{{ __('Phone Number') }}"
                                        class="form-control">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>{{ __('Status') }}</label>
                                    <select name="status" class="form-control">
                                        <option class="form-control" value="{{ \App\Models\Booking::STATUS_ACTIVE }}">
                                            {{ __('ACTIVE') }}</option>
                                        <option class="form-control" value="{{ \App\Models\Booking::STATUS_DEACTIVE }}">
                                            {{ __('INACTIVE') }}</option>
                                        <option class="form-control" value="{{ \App\Models\Booking::STATUS_PENDING }}">
                                            {{ __('PENDING') }}</option>
                                    </select>
                                </div>
                                <input type="hidden" name="type" id="type" value="1">

                                <div class="clearfix"></div>
                            </div>
                            <div class="row m-b-md">
                                <div class="col-md-12">
                                    <button class="btn-primary btn">
                                        {{ __('Save') }}
                                    </button>
                                    <a class="btn btn-primary" href="{{ route('booking_list') }}"> {{ __('Back') }}</a>

                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>



@endsection

@push('scripts')
    <script>
       $(function() {    
    
        // Makes sure the code contained doesn't run until
       //     all the DOM elements have loaded

            $('#offerselector').change(function(){
                $('.selected').hide();
                $('#' + $(this).val()).show();
            });

        });
    </script>
@endpush