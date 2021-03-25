@extends('layouts.backend')
@section('content')
    <div class="page-title">
        <div class="title_left">
            <h3>{{__('Bookings')}}</h3>
        </div>
        <div class="title_right">
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('booking_create')}}">{{__('Add New Booking')}}</a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 bg-white">
            <div class="x_panel">
                <div class="x_content">

                    <table class="table table-striped table-bordered golo-datatable">
                        <thead>
                            <thead>
                                <tr>
                                    <th width="10%">{{__('Client infos')}}</th>
                                    <th width="10%">{{__('Place')}}</th>
                                    <th width="10%">{{__('Booking For')}}</th>
                                    <th width="10%">{{__('Booking at')}}</th>
                                    <th width="10%">{{__('Status')}}</th>
                                    <th width="10%">{{__('Actions')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                     @foreach($bookings as $booking)
                                     <tr>
                                    @if($booking->type === \App\Booking::TYPE_BOOKING_FORM)
                                        @php
                                            $booking_name = $booking->name;
                                            $booking_email = $booking->email;
                                            $booking_phone = $booking->phone_number;
                                        @endphp
                                        <td>{{$booking_name}} -
                                            <small> {{$booking->phone_number}} - {{$booking->email}}</small>
                                        </td>
                                    @else
                                        @php
                                            $booking_name = $booking->name;
                                            $booking_email = $booking->email;
                                            $booking_phone = $booking->phone_number;
                                        @endphp
                                        <td>{{$booking_name}}</td>
                                    @endif
                                    @if(isset($booking['place']))
                                        <td><a href="{{route('place_detail', $booking['place']['slug'])}}" target="_blank">{{$booking['place']['name']}}</a></td>
                                    @else
                                        <td><i>Place deleted</i></td>
                                    @endif
                                    <td>{{$booking->date}}</td>
                                <td>{{formatDate($booking->created_at, 'H:i d/m/Y')}}</td>
                                <td>
                                    @if($booking->status === \App\Booking::STATUS_PENDING)
                                        <span class="status-pending">{{__('PENDING')}}</span>
                                    @elseif($booking->status === \App\Booking::STATUS_ACTIVE)
                                        <span class="status-approved">{{__('Approved')}}</span>
                                    @else
                                        <span class="status-cancel">{{__('Cancel')}}</span>
                                    @endif
                                </td>
                                <td>
                                <div class="dropdown">
                                    <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        {{ __('Actions') }}
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    @if(isset($booking['place']))
                                        <button type="button" data-target="modal_booking_detail"  class="dropdown-item booking_detail"
                                                data-id="{{$booking->id}}"
                                                data-name="{{$booking_name}}"
                                                data-email="{{$booking_email}}"
                                                data-phone="{{$booking_phone}}"
                                                data-place="{{$booking['place']['name']}}"
                                                data-bookingdatetime="{{$booking->time}} {{formatDate($booking->date, 'd/m/Y')}}"
                                                data-bookingat="{{formatDate($booking->created_at, 'H:i d/m/Y')}}"
                                                data-status="{{STATUS[$booking->status]}}"
                                                data-price="{{$booking['place']['price']}}"
                                                data-message="{{$booking->message}}"
                                                data-adult="{{$booking->numbber_of_adult}}"
                                                data-children="{{$booking->numbber_of_children}}"
                                                data-type="{{$booking->type}}"
                                        >{{__('Detail')}}
                                        </button>
                                        @if($booking->status === \App\Booking::STATUS_PENDING || $booking->status === \App\Booking::STATUS_DEACTIVE)
                                            <form class="d-inline" action="{{route('booking_update_status')}}" method="POST">
                                                @method('PUT')
                                                @csrf
                                                <input type="hidden" name="booking_id" value="{{$booking->id}}">
                                                <input type="hidden" name="status" value="{{\App\Booking::STATUS_ACTIVE}}">
                                                <button type="button" class="dropdown-item booking_approve" data-id="{{$booking->id}}">{{__('Approve')}}</button>
                                            </form>
                                        @endif
                                        @if($booking->status === \App\Booking::STATUS_PENDING || $booking->status === \App\Booking::STATUS_ACTIVE)
                                            <form class="d-inline" action="{{route('booking_update_status')}}" method="POST">
                                                @method('PUT')
                                                @csrf
                                                <input type="hidden" name="booking_id" value="{{$booking->id}}">
                                                <input type="hidden" name="status" value="{{\App\Booking::STATUS_DEACTIVE}}">
                                                <button type="button" class="dropdown-item booking_cancel">{{__('Cancel')}}</button>
                                            </form>
                                        @endif
                                        @if($booking->status === \App\Booking::STATUS_PENDING || $booking->status === \App\Booking::STATUS_ACTIVE)
                                            <form class="d-inline" action="{{route('sale_create_view')}}" method="POST">
                                                @csrf
                                                <input type="hidden" name="id" value="{{$booking->id}}">
                                                <button type="submit" class="dropdown-item">{{__('Sales')}}</button>
                                            </form>
                                        @endif
                                    @else
                                        <i>{{__('Place deleted')}}</i>
                                    @endif
                                    <a class="dropdown-item" href="{{route('booking_edit', $booking->id)}}">{{__('Edit')}}</a>
                                    <form action="{{route('booking_delete',$booking->id)}}" method="POST">
                                        @method('DELETE')
                                        @csrf
                                        <button type="button" class="dropdown-item booking_delete">{{__('Delete')}}</button>
                                    </form>
                                    </div>
                                </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
    @include('backend.booking.modal_booking_detail')
   
    @endsection


@push('scripts')
    <script src="{{asset('admin/js/page_booking.js')}}"></script>
@endpush