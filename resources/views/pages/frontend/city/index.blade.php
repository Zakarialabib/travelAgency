@extends('layouts.app')

@section('content')
    <main class="site-main normal_view">
      @foreach ($cities as $city)
      <div class="card" style="max-width: 800px; padding: 2rem 0;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <div class="thumbnail">
              <img src="{{asset('uploads/' . $city->thumb)}}" alt="{{$city->slug}}">
            </div>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">{{$city->name}}</h5>
              <p class="card-text">{{$city->description}}</p>
              <div class="d-flex justify-content-between">
                <p class="card-text"><small class="text-muted">{{$city->places->count()}}</small></p>
                <a href="{{route('city_detail', ['slug' => $city->slug])}}" class="btn btn-primary">{{__('More')}}</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      @endforeach
    </main><!-- .site-main -->
@endsection