@extends('layouts.app')

@section('css')
<style>
  .city__container {
    display: flex;
    flex-direction: column;
    width: 900px;
    margin: 3rem auto;
  }
  .city {
    display: flex;
    width: 100%;
    margin: 2rem 0;
    border-radius: 15px;
    padding: 10px;
    transition: .2s ease-out all;
    box-shadow: 0px 1px 5px 0px rgba(0,0,0,0.75);
    -webkit-box-shadow: 0px 1px 5px 0px rgba(0,0,0,0.75);
    -moz-box-shadow: 0px 1px 5px 0px rgba(0,0,0,0.75);
  }

  .city:hover {
    transform: translateY(-10px);
  }
  
  .city .city__image {
    width: 20%;
    overflow: hidden;
  }

  .city .city__title {
    font-size: 3rem;
    font-weight: bold;
    color: #ee5000;
    margin: 0;
  }
  .city .city__description {
    margin: 1rem 0;
  }

  .city .city__image .wrapper {
    width: 100%;
    height: 0;
    padding-top: 100%; /* 1:1 Aspect Ratio */
    position: relative;  
  }

  .city .city__image .wrapper img {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    object-fit: cover;
  }

  .city .city__body {
    width: 80%;
    padding: 1rem;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  .city .city__body .foot {
    display: flex;
    justify-content: space-between;
  }

  @media only screen and (max-width: 768px) {
    .city__container {
      width: 600px;
    }

    .city .city__image {
      width: 33%;
    }

    .city .city__body {
      width: 66%;
    }

    .city .city__image .wrapper {
      padding-top: 150%;
    }
  }

  @media only screen and (max-width: 460px) {
    .city__container {
      width: 80%;
    }
    .city {
      flex-direction: column;
      height: 400px;
    }

    .city .city__image {
      width: 100%;
      height: 50%;
    }

    .city .city__image .wrapper {
      padding-top: 60%;
    }

    .city .city__body {
      width: 100%;
      height: 50%;
    }
  }
</style>
@endsection

@section('content')
    <main class="site-main normal_view">
      <div class="city__container">
        @foreach ($cities as $city)
        <div class="city">
          <div class="city__image">
            <div class="wrapper">
              <a href="{{route('city_detail', ['slug' => $city->slug])}}">
              <img src="{{asset('uploads/' . $city->thumb)}}" alt="{{$city->slug}}">
              </a>
            </div>
          </div>
          <div class="city__body">
            <div class="head">
              <a href="{{route('city_detail', ['slug' => $city->slug])}}">
              <h5 class="city__title">{{$city->name}}</h5>
              </a>
              <p class="city__description">{{$city->seo_description}}</p>
            </div>
            <div class="foot">
              <p class="card-text"><small class="text-muted">{{$city->places->count()}}</small>{{__('Place')}}</p>
              <a href="{{route('city_detail', ['slug' => $city->slug])}}" class="btn mybtn1">{{__('More')}}</a>
            </div>
          </div>
        </div>
        @endforeach
      </div>
    </main><!-- .site-main -->
@endsection