@extends('layouts.app')

@section('content')

<main class="site-main normal_view">
  <div class="page-title place_list-title--small align-left">
      <div class="container">
                <div class="page-title__content">
                    <h1 class="page-title__name">
                            {{__('Category')}}                    
                    </h1>
                </div>
            </div>
        </div><!-- .page-title -->
  <div class="container">
     <div class="mw-box">
         <div class="mw-grid golo-grid grid-4 ">
           @foreach($categories as $category)
            <div class="grid-item">
            <div>
                <div class="places-item hover__box">
                    <div class="places-item__thumb hover__box__thumb">
                      <a title="{{$category->name}}" href="{{route('category_detail', $category->slug)}}"><img src="{{getImageUrl($category->image)}}" alt="{{$category->name}}">
                        <span class="title">{{$category->name}}</span>
                        <span class="place">{{$category->place_count}} {{__('Places')}}</span>
                      </a>
                    </div>
                  </div>
                </div>
                </div>
             @endforeach
            </div>
        </div><!-- .mw-box -->
    </div>
</main>
@stop

