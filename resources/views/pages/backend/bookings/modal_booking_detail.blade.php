<div class="modal fade" id="modal_booking_detail" tabindex="-1" role="dialog" aria-labelledby="modal_booking_detail" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{{__('Booking detail')}} </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>

            <div class="modal-body">
            <div class="container"> 
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="row">Reference</th>
                        <th id="booking_reference"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">{{__('Name')}}</th>
                        <td id="booking_name"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Email')}}</th>
                        <td id="booking_email"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Phone Number')}}</th>
                        <td id="booking_phone"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Booking place')}}</th>
                        <td id="booking_place"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Booking datetime')}}</th>
                        <td id="booking_datetime"></td>
                    </tr>
                    </tbody>
                </table>
                </div>
                <div class="container"> 
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th width="30%"></th>
                        <th width="70%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">{{__('Number of Adult')}}</th>
                        <td id="booking_numberofadult"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Number of Children')}}</th>
                        <td id="booking_numberofchildren"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Price')}}</th>
                        <td id="booking_price"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Message')}}</th>
                        <td id="booking_message"></td>
                    </tr>
                    {{--<tr>--}}
                        {{--<th scope="row">Booking type</th>--}}
                        {{--<td id="booking_type">@twitter</td>--}}
                    {{--</tr>--}}
                    <tr>
                        <th scope="row">{{__('Booking status')}}</th>
                        <td id="booking_status"></td>
                    </tr>
                    <tr>
                        <th scope="row">{{__('Booking at')}}</th>
                        <td id="booking_at"></td>
                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
</div>