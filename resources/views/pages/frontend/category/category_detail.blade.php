@extends('layouts.app')

@php
    $banner_img = getImageUrl($category->image);
    $page_title_bg = "style=background-image:url({$banner_img});";
@endphp

@section('content')
 <main class="site-main normal_view">
   <div class="page-title" {!! $page_title_bg !!}>
     <div class="container">
                <div class="category-title__content">
                    <h1 class="page-title__name">{{ $category->name }}</h1>
                </div>
     </div>
        </div><!-- .page-title -->
        <div class="mw-box">
            <div class="mw-grid golo-grid grid-4 ">
            @if(count($offers))
                @foreach($offers as $offer)
                    <div class="grid-item">
                    <div>
                        <div class="places-item hover__box">
                            <div class="places-item__thumb hover__box__thumb">
                                <a title="{{ $offer->name }}"
                                    href="{{ route('offer.show', $offer->slug) }}"><img
                                        src="{{ getImageUrl($offer->image) }}" alt="{{ $offer->name }}"></a>
                            </div>
                        <div class="places-item__info">
                            <h3><a href="{{ route('place_detail', $offer->slug) }}"
                                    title="{{ $offer->name }}">{{ $offer->name }}</a></h3>
                        </div>
                    </div>
                  </div>
                </div>
                @endforeach
                @else
                <div class="col-md-12 text-center">
                    {{__('No offers')}}
                </div>
                @endif
            </div>
        </div><!-- .mw-box -->
    </main><!-- .site-main -->
@stop

