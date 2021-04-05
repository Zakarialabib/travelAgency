@extends('layouts.backend')
@section('page-title')  {{__('Create New Return')}}  @endsection

@section('content')
<div class="page-title">
        <div class="title_left">
            <h3>{{__('New Return')}}</h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 bg-white"> 
            <form method="post" action="{{ route('return_create') }}" class="form-horizontal" role="form" enctype="multipart/form-data">
                @csrf
                  <div class="row mb-2">
                            <div class="col-md-12 col-sm-12">
                                <div class="dashboard_graph">
                                 <div class="row">
                                     <div class="col-md-4">
                                         <div class="form-group">
                                             <label> {{__('Reference no')}} *</label>
                                                <input type="text" name="reference_no" id="reference_no" class="form-control" />
                                         </div>
                                     </div>
                                   
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label> {{__('User')}} *</label>
                                            <select name="user_id" id="user_id" class="form-control myselect" data-live-search="true" data-live-search-style="begins"  title="{{__('Select user')}}...">
                                               @foreach($users as $user)
                                                <option value="{{$user->id}}">{{$user->profile->sur_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                      <table class="table table-bordered table-hover" id="tab_logic">
                                        <thead>
                                          <tr>
                                            <th class="text-center"> # </th>
                                            <th class="text-center"> {{__('Product')}} </th>
                                            <th class="text-center"> {{__('Qty')}} </th>
                                            <th class="text-center"> {{__('Prix')}} </th>
                                            <th class="text-center"> {{__('Total')}} </th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr id='addr0'>
                                            <td>1</td>
                                            <td><input type="text" name='name[]'  placeholder="{{__('Enter Product Name')}}" class="form-control"/></td>
                                            <td><input type="number" name='qty[]' placeholder="{{__('Enter Qty')}}" class="form-control qty" step="0" min="0"/></td>
                                            <td><input type="number" name='price[]' placeholder="{{__('Enter Unit Price')}}" class="form-control prix"  step="0.00" min="0"/></td>
                                            <td><input type="number" name='total[]' placeholder='0.00' class="form-control total" readonly/></td>
                                          </tr>
                                          <tr id='addr1'></tr>
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
                                    <div class="col-md-12">
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
                                                <input type="number" class="form-control" name="tax" id="tax" placeholder="0" value="0">
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
                                            <label>{{__('Return Status')}} *</label>
                                            <select name="status" class="form-control">
                                                <option value="{{App\Returns::STATUS_COMPLETE}}">{{__('Completed')}}</option>
                                                <option value="{{App\Returns::STATUS_PENDING}}">{{__('Pending')}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{__('Payment Status')}} *</label>
                                            <select name="payment_status" class="form-control">
                                                <option value="{{App\Payment::STATUS_PENDING}}">{{__('Pending')}}</option>
                                                <option value="{{App\Payment::STATUS_DUE}}">{{__('Due')}}</option>
                                                <option value="{{App\Payment::STATUS_PARTIAL}}">{{__('Partial')}}</option>
                                                <option value="{{App\Payment::STATUS_PAID}}">{{__('Paid')}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Paid By')}}</label>
                                                <select name="paid_by" class="form-control">
                                                    <option value="{{App\Payment::MEDIUM_CASH}}">{{__('Cash')}}</option>
                                                    <option value="{{App\Payment::MEDIUM_CHECK}}">{{__('Cheque')}}</option>
                                                    <option value="{{App\Payment::MEDIUM_DEPOSIT}}">{{__('Deposit')}}</option>
                                                </select>
                                            </div>
                                    </div>
                                      <div class="col-md-12">
                                        <div class="form-group">
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
                                    <div id="payment">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Paid Amount')}} *</label>
                                                <input type="number" name="paid_amount" class="form-control" id="paid_amount"  step="any" placeholder="0" value="0" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Paying Amount')}} *</label>
                                                <input type="number" name="amount_topay" class="form-control" id="amount_topay" step="any" readonly/>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>{{__('Change Amount')}}</label>
                                                <input type="number" name="change" class="form-control" id="change" value="0" step="any" readonly/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>{{__('Payment Note')}}</label>
                                            <textarea rows="3" class="form-control" name="payment_note"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>{{__('Return Note')}}</label>
                                            <textarea rows="5" class="form-control" name="note"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>{{__('Staff Note')}}</label>
                                            <textarea rows="5" class="form-control" name="staff_note"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   </div>
                <div class="row m-b-md">
                    <div class="col-md-12">
                        <button class="btn-primary btn">
                             {{__('Save')}}
                        </button>
                        <a class="btn btn-primary" href="{{route('return_list')}}"> {{__('Back')}}</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

@stop


@push('scripts')
<script src="{{asset('admin/js/page_return_create.js')}}"></script>
@endpush