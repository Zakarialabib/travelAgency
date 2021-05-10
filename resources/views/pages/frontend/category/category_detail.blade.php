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
            <div class="city-content__panel" id="inspire">
            @if(count($offers))
                @php
                $currentCityId = $offers->first()->city_id
                @endphp
                @foreach($offers as $offer)
             <div class="city-content__item">
                  <h2 class="title title--more">
                    @if($currentCityId !== $offer->city_id || $loop->first)
                    {{ $offer->city->name }}
                    @endif
                    @php
                    $currentCityId = $offer->city_id
                    @endphp                                
                </h2>
             <div class="">
                    <div class="city-slider__grid row">
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
                    </div><!-- .city-slider__grid -->
                 </div><!-- .city-slider -->
               </div><!-- .city-content__item -->
               @endforeach
            @endif
          </div><!-- .city-content__panel -->
        </div><!-- .mw-box -->
    </main><!-- .site-main -->
@stop
