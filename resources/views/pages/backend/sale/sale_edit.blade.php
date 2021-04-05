@extends('layouts.backend')
@section('page-title')  {{__('Edit Sale')}}  @endsection
@section('content')
<div class="page-title">
        <div class="title_left">
            <h3>{{__('Edit Sale')}}</h3>
        </div>
    </div>
    <div class="clearfix"></div>
    
    <div class="row">
        <div class="col-md-12"> 
        <form method="POST" action="{{ route('sale_update' , $sale->id) }}" class="form-horizontal" id="update-form" data-sale="{{$sale->id}}" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="put">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                  <div class="row mb-2">
                            <div class="col-md-12 col-sm-12 bg-white">
                                <div class="dashboard_graph">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label> {{__('Reference no')}} *</label>
                                                   <input type="text" name="reference_no" value="{{$sale->reference_no}}" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label> {{__('User')}} *</label>
                                                <select name="user_id" class="form-control myselect" title="{{__('Select user')}}...">
                                                   @foreach($users as $user)
                                                    <option value="{{$user->id}}">{{$user->profile->sur_name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label> {{__('Customer')}} *</label>
                                                <select name="customer_id" class="form-control myselect" title="{{__('Select Customer')}}...">
                                                @foreach($customers as $customer)
                                                    @if ($customer->id === $sale->customer->id)
                                                    <option value="{{$customer->id}}" selected="selected">{{$customer->name}}</option>
                                                    @else
                                                    <option value="{{$customer->id}}">{{$customer->name}}</option>
                                                    @endif
                                                @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                                <div class="row clearfix">
                                                  <div class="col-md-12">
                                                    <table class="table table-bordered table-hover" id="tab_logic" data-items-number="{{$sale->details->count()}}">
                                                      <thead>
                                                        <tr>
                                                          <th class="text-center"> # </th>
                                                          <th class="text-center"> {{__('Product')}} </th>
                                                          <th class="text-center"> {{__('Qty')}} </th>
                                                          <th class="text-center"> {{__('Price')}} </th>
                                                          <th class="text-center"> {{__('Total')}} </th>
                                                        </tr>
                                                      </thead>
                                                      <tbody>
                                                        @php
                                                            $counter = 0;
                                                        @endphp
                                                        @foreach ($sale->details as $key => $detail)
                                                        @php
                                                            $counter = $key;
                                                        @endphp                                                      
                                                        <tr id='addr{{$counter}}'>
                                                          <td>{{$counter + 1}}</td>
                                                          <td>
                                                            <input id="name-{{$counter}}" value="{{$detail->name}}" type="text" name='name[]'  placeholder="{{__('Enter Product Name')}}" class="form-control" autocomplete="off" readonly />
                                                            <div class="search-suggestions place-suggestion" id="place-suggestion-{{$counter}}" style="display: none;">
                                                              <ul class="list-group">
                                                                  <li class="list-group-item">{{__('Loading...')}}</li>
                                                              </ul>
                                                            </div>
                                                          </td>
                                                          <td><input value="{{$detail->qty}}" type="number" name='qty[]' placeholder="{{__('Enter Qty')}}" class="form-control qty" step="0" min="0"/></td>
                                                          <td><input value="{{$detail->price}}" type="number" name='price[]' placeholder="{{__('Enter Unit Price')}}" class="form-control price"  step="0.00" min="0"/></td>
                                                          <td><input value="{{$detail->total}}" type="number" name='total[]' placeholder='0.00' class="form-control total" readonly/></td></tr>
                                                        </tr>
                                                        @endforeach
                                                        <tr id='addr{{$counter + 1}}'></tr>
                                                      </tbody>
                                                    </table>
                                                  </div>
                                                </div>
                                                <div class="row clearfix">
                                                  <div class="col-md-12">
                                                <a id="add_row" class="btn btn-primary text-white pull-left">{{__('Add Row')}}</a>
                                                <a id='delete_row' class="pull-right text-white btn btn-primary">{{__('Delete Row')}}</a>
                                                  </div>
                                                </div>
                                                <div class="row clearfix" style="margin-top:20px">
                                                  <div class="pull-right col-md-12">
                                                    <table class="table table-bordered table-hover" id="tab_logic_total">
                                                        <thead>
                                                            <th class="text-center">{{__('Sub Total')}}</th>
                                                            <th class="text-center">{{__('Tax')}}</th>
                                                            <th class="text-center">{{__('Tax Amount')}}</th>
                                                            <th class="text-center">{{__('Grand Total')}}</th>
                
                                                        </thead>
                                                        <tbody>
                                                            <td class="text-center"><input type="number" name='sub_total' placeholder='0.00' class="form-control" id="sub_total" readonly/></td>
                                                            <td class="text-center"><div class="input-group mb-2 mb-sm-0">
                                                                <input type="number" class="form-control" name="tax" value="{{$sale->tax}}" id="tax" placeholder="0">
                                                                <div class="input-group-addon">%</div>
                                                              </div></td>
                                                            <td class="text-center"><input type="number" name='tax_amount' id="tax_amount" placeholder='0.00' class="form-control" readonly/></td>
                                                            <td class="text-center"><input type="number" name='total_amount' id="total_amount" placeholder='0.00' class="form-control" readonly/></td>
                                                        </tbody>
                                                    </table>
                                                  </div>
                                                </div>
                               
                                        <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Sale Status')}} *</label>
                                                <select name="status" class="form-control">
                                                    <option value="{{App\Sale::STATUS_COMPLETE}}" {{$sale->status === App\Sale::STATUS_COMPLETE ? 'selected="selected"' : ''}}>{{__('Completed')}}</option>
                                                    <option value="{{App\Sale::STATUS_PENDING}}" {{$sale->status === App\Sale::STATUS_PENDING ? 'selected="selected"' : ''}}>{{__('Pending')}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Payment Status')}} *</label>
                                                <select name="payment_status" class="form-control">
                                                    <option value="{{App\Payment::STATUS_DUE}}" {{$sale->payment_status === App\Payment::STATUS_DUE ? 'selected="selected"' : ''}}>{{__('Due')}}</option>
                                                    <option value="{{App\Payment::STATUS_PENDING}}" {{$sale->payment_status === App\Payment::STATUS_PENDING ? 'selected="selected"' : ''}}>{{__('Pending')}}</option>
                                                    <option value="{{App\Payment::STATUS_PARTIAL}}" {{$sale->payment_status === App\Payment::STATUS_PARTIAL ? 'selected="selected"' : ''}}>{{__('Partial')}}</option>
                                                    <option value="{{App\Payment::STATUS_PAID}}" {{$sale->payment_status === App\Payment::STATUS_PAID ? 'selected="selected"' : ''}}>{{__('Paid')}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Paid By')}}</label>
                                                <select name="paid_by" class="form-control">
                                                    <option value="{{App\Payment::MEDIUM_CASH}}" {{$sale->paid_by === App\Payment::MEDIUM_CASH ? 'selected="selected"' : ''}}>{{__('Cash')}}</option>
                                                    <option value="{{App\Payment::MEDIUM_CHECK}}" {{$sale->paid_by === App\Payment::MEDIUM_CHECK ? 'selected="selected"' : ''}}>{{__('Cheque')}}</option>
                                                    <option value="{{App\Payment::MEDIUM_DEPOSIT}}" {{$sale->paid_by === App\Payment::MEDIUM_DEPOSIT ? 'selected="selected"' : ''}}>{{__('Deposit')}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div id="document" data-document="{{$sale->document ? '1' : '0'}}">
                                                    <div id="document-yes" style="{{$sale->document ? '' : 'display: none;'}}">
                                                       <span class="p-3 bg-secondary text-white">
                                                           {{$sale->document}}
                                                           <button id="delete-file" class="ml-2 p-1 bg-danger text-white font-weight-bold border-0">X</button>
                                                        </span>
                                                    </div>
                                                    <div id="document-no" style="{{$sale->document ? 'display: none;' : ''}}">
                                                        <label>{{__('Attach Document')}}</label> <i class="dripicons-question" data-toggle="tooltip" title="Only jpg, jpeg, png, gif, pdf, csv, docx, xlsx and txt file is supported"></i>
                                                        <input type="file" name="document" class="form-control" />
                                                        @if($errors->has('extension'))
                                                            <span>
                                                               <strong>{{ $errors->first('extension') }}</strong>
                                                            </span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

    
                                    <div id="payment">
                                        <div class="row">
                                          
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>{{__('Recieved Amount')}} *</label>
                                                    <input type="number" name="paid_amount" class="form-control" id="paid_amount" value="{{$sale->paid_amount}}" step="any" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>{{__('Paying Amount')}} *</label>
                                                    <input type="number" name="amount_topay" class="form-control" id="amount_topay" value="{{$sale->grand_total}}" step="any" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>{{__('Change Amount')}} *</label>
                                                    <input type="number" name="change" class="form-control" id="change" value="0" step="any" readonly/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label>{{__('Payment Note')}}</label>
                                                <textarea rows="3" class="form-control" name="payment_note">{{$sale->payment_note}}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>{{__('Sale Note')}}</label>
                                                <textarea rows="5" class="form-control" name="note">{{$sale->note}}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>{{__('Staff Note')}}</label>
                                                <textarea rows="5" class="form-control" name="staff_note">{{$sale->staff_note}}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <input type="number" name="is_locked" class="form-control" id="is_locked" value="{{$sale->is_locked}}" step="any" readonly/>

                <div class="row m-b-md">
                    <div class="col-md-12">
                        <button class="btn-primary btn">
                             {{__('Update')}}
                        </button>
                        <a class="btn btn-primary" href="{{route('sale_list')}}"> {{__('Back')}}</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

@stop


@push('scripts')
<script src="{{asset('admin/js/page_sale_edit.js')}}"></script>
@endpush