@extends('layouts.backend')

@section('page-title')  {{__('Category Type List')}}  @endsection

@section('content')

    <div class="page-title">
        <div class="title_left">
            <h3>{{__('Category Type List')}}</h3>
        </div>
        <div class="title_right">
            <div class="pull-right">
                <button class="btn btn-primary" id="btn_add_place_type">{{__('Add Category Type')}}</button>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 bg-white">
            <div class="x_panel">
                <div class="x_title">
                    
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-striped table-bordered col-4-datatable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>{{__('Category type Name')}}</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($category_types as $category_type)
                            <tr>
                                <td>{{$category_type->id}}</td>
                                <td>{{$category_type->name}}</td>
                                <td class="golo-flex">
                                <div class="btn-group row">
                                    <button type="button" class="btn-sm  btn-warning place_type_edit"
                                            data-id="{{$category_type->id}}"
                                            data-catid="{{$category_type->category_id}}"
                                            data-name="{{$category_type->name}}"
                                            data-translations="{{$category_type->translations}}"
                                    >{{__('Edit')}}
                                    </button>
                                    <form class="d-inline" action="{{route('place_type_delete',$category_type->id)}}" method="POST">
                                        @method('DELETE')
                                        @csrf
                                        <button type="button" class="btn-sm  btn-danger place_type_delete">{{__('Delete')}}</button>
                                    </form>
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
    @include('pages.backend.category_type.modal_add_place_type')
@endsection

@push('scripts')
    <script src="{{asset('admin/js/page_place_type.js')}}"></script>
@endpush