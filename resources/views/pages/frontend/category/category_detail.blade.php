@extends('layouts.app')

@section('page-title')  {{__('Category detail')}}  @endsection

@php
$banner_img = getImageUrl($category->image);
$page_title_bg = "style=background-image:url({$banner_img});";
@endphp

@section('content')
    <main class="site-main normal_view">
        <section class="breadcrumbs-custom bg-image context-dark" {!! $page_title_bg !!}>
            <div class="breadcrumbs-custom-inner">
                <div class="container breadcrumbs-custom-container">
                    <div class="breadcrumbs-custom-main" >
                        <h1 class="breadcrumbs-custom-title">{{ $category->name }}</h1>
                    </div>
                    <ul class="breadcrumbs-custom-path">
                        <li><a href="{{ route('home')}}">{{__('Home')}}</a></li>
                        <li><a href="{{ url('/categorie')}}">{{__('Category')}}</a></li>
                        <li class="active"><a href="{{ route('category_detail' , $category->slug)}}"  style="color: #ee5000;">{{ $category->name }}</li>
                    </ul>
                </div>
             </div>
        </section><!-- .page-title -->
        <div class="mw-grid golo-grid grid-4 ">
        @foreach($categorytype as $cat)
            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                <div class="">
                        <a class="entry-thumb">
                            <img title="{{ $cat->name }}" src="{{ getImageUrl($cat->image) }}" alt="{{ $cat->name }}">
                        </a>
                        <div class="entry-detail">
                            <h3 class="place-title">
                            {{ $cat->name }}
                            </h3>
                        </div>
                </div>
            </div>
        @endforeach
    </div>
        <div class="mw-box">
            <div class="city-content__panel" id="inspire">
            @if(count($offers))
                @foreach($offers as $key => $city)
                <div class="city-content__item">
                    <h2 class="title title--more">{{ $key }}</h2> 
                    <div class="city-slider">
                        <div class="city-slider__grid">
                        @foreach($city as $offer)    
                            <div>
                                <div class="places-item hover__box">
                                    <div class="places-item__thumb hover__box__thumb">
                                        <a title="{{ $offer->name }}"
                                            href="{{ route('offer.show', $offer->slug) }}"><img
                                                src="{{ getImageUrl($offer->image) }}" alt="{{ $offer->name }}"></a>
                                    </div>
                                    <div class="places-item__info">
                                        <h3>
                                            <a href="{{ route('place_detail', $offer->slug) }}"
                                                title="{{ $offer->name }}">{{ $offer->name }}</a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </div><!-- .city-slider__grid -->
                        <div class="city-slider__nav slick-nav">
                            <div class="city-slider__prev slick-nav__prev">
                                <i class="la la-arrow-left la-24"></i>
                            </div><!-- .city-slider__prev -->
                            <div class="city-slider__next slick-nav__next">
                                <i class="la la-arrow-right la-24"></i>
                            </div><!-- .city-slider__next -->
                        </div><!-- .city-slider__nav -->
                    </div><!-- .city-slider -->
                </div><!-- .city-content__item -->
                @endforeach
            @endif
            </div><!-- .city-content__panel -->
        </div><!-- .mw-box -->
    </main><!-- .site-main -->
@stop
