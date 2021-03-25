@extends('layouts.backend')

@section('content')

    <div class="page-title">
        <div class="title_left">
            <h3>{{__('Pages')}}</h3>
        </div>
        <div class="title_right">
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('page_create')}}">{{__('Add new Page')}}</a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    @unless(isRoute('page_list_page'))
                        <form class="row">
                            <div class="col-md-3 form-group">
                                <label>Select Categories:</label>
                                <select class="form-control" id="select_category_id" name="category_id" onchange="this.form.submit()">
                                    <option value="">{{__('All categories')}}</option>
                                    @foreach($categories as $cat)
                                        <option value="{{$cat->id}}" {{isSelected($cat->id, $filter['category_id'])}}>{{$cat->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </form>
                    @endunless
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">

                    <table class="table table-striped table-bordered golo-datatable post_list">
                        <thead>
                        <tr>
                            <th width="3%">ID</th>
                            <th width="5%">Image</th>
                            <th>{{__('Title')}}</th>
                            <th>{{__('Status')}}</th>
                            <th width="15%">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($pages as $page)
                            <tr>
                                <td>{{$page->id}}</td>
                                <td><img class="post_list_thumb" src="{{getImageUrl($page->thumb)}}" alt="post thumb"></td>
                                <td class="row"><a href="{{route('page_detail', [$page->slug, $page->id])}}" target="_blank">{{$page->title}}</a></td>
                                <td><input type="checkbox" class="js-switch post_status" data-id="{{$page->id}}" /></td>
                                <td class="golo-flex">
                                <div class="btn-group row">
                                    <a class="btn-sm btn-warning place_edit" href="{{route('page_edit', $page->id)}}">{{__('Edit')}}</a>
                                    <form class="d-inline" action="{{route('page_delete', $page->id)}}" method="POST">
                                        @method('DELETE')
                                        @csrf
                                        <button type="button" class="btn-sm btn-danger place_delete" onclick="if(confirm('Are you sure? The post that deleted can not restore!')) $(this).parent().submit();">{{__('Delete')}}</button>
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

@stop

@push('scripts')
    <script src="{{asset('admin/js/page_page.js')}}"></script>
@endpush