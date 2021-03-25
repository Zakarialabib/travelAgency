@extends('layouts.backend')

@section('content')
    <div class="page-title">
        <div class="title_left">
            <h3>{{__('Edit Page')}}</h3>
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="row">
    <form method="POST" action="{{ route('page_update' , $page->id) }}" class="form-horizontal" role="form" enctype="multipart/form-data">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <ul class="nav nav-tabs bar_tabs" role="tablist">
                            @foreach($languages as $index => $language)
                                <li class="nav-item">
                                    <a class="nav-link {{$index !== 0 ?: "active"}}" id="home-tab" data-toggle="tab" href="#language_{{$language->code}}" role="tab" aria-controls="" aria-selected="">{{$language->name}}</a>
                                </li>
                            @endforeach
                        </ul>
                        <div class="tab-content">
                            @foreach($languages as $index => $language)
                                @php
                                    $trans = $page ? $page->translate($language->code) : [];
                                @endphp
                                <div class="tab-pane fade show {{$index !== 0 ?: "active"}}" id="language_{{$language->code}}" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="post_title_{{$language->code}}">{{__('Title')}}
                                                <small>({{$language->code}})</small>
                                                : *</label>
                                            <input type="text" class="form-control post_title" id="post_title_{{$language->code}}" name="{{$language->code}}[title]" value="{{$trans ? $trans->title :''}}" placeholder="Add title" autocomplete="off" {{$index !== 0 ?: "required"}}>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="post_content_{{$language->code}}">{{__('Content')}}
                                            <small>({{$language->code}})</small>
                                            :</label>
                                        <textarea type="text" class="form-control tinymce_editor" id="post_content_{{$language->code}}" name="{{$language->code}}[content]" rows="10">{{$trans ? $trans->content :''}}</textarea>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>

                <div class="x_panel">
                    <div class="x_title">
                        <h2>{{__('SEO')}}</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="form-group">
                            <label for="seo_title">{{__('SEO title')}}:</label>
                            <input type="text" class="form-control" id="seo_title" name="seo_title" value="{{$page->seo_title}}">
                        </div>
                        <div class="form-group">
                            <label for="seo_description">{{__('Meta Description')}}:</label>
                            <textarea class="form-control" id="seo_description" name="seo_description">{{$page['seo_description']}}</textarea>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>{{__('Publish')}}</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <button type="submit" class="btn btn-success">
                            {{__('Update')}}                       
                        </button>
                    </div>
                </div>

                <div class="x_panel">
                    <div class="x_title">
                        <h2>{{__('Thumbnail image')}}</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <label class="page_thumb" for="page_thumb">
                            <img id="preview_thumb" src="{{getImageUrl($page['thumb'])}}" alt="post thumb">
                            <input type="file" class="form-control" id="page_thumb" name="thumb" accept="image/*">
                        </label>
                    </div>
                </div>

            </div>

        </form>
    </div>
@stop

@push('scripts')
    <script src="{{asset('admin/js/page_page.js')}}"></script>  
        <script>
            $("#menu_pages").addClass("active");
        </script>
@endpush