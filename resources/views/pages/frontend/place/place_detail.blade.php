@extends('layouts.app')
@section('content')
   <main id="main" class="site-main place-04">
  <div class="place">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 clear-padding">
          <div class="slick-sliders">
            <div class="slick-slider photoswipe" data-item="1" data-arrows="true" data-itemscroll="1" data-dots="true" data-infinite="true" data-centermode="true" data-centerPadding="0">
              @if(isset($place->gallery))
              @foreach($place->gallery as $gallery)
              <div class="place-slider__item photoswipe-item">
                <a href="{{getImageUrl($gallery)}}" data-height="900" data-width="1200" data-caption="{{$gallery}}">
                  <img src="{{getImageUrl($gallery)}}" alt="{{$gallery}}">
                </a>
              </div>
              @endforeach
              @else
              <div class="place-slider__item">
                <a href="#">
                  <img src="https://via.placeholder.com/1280x500?text=Rentacstours" alt="slider no image">
                </a>
              </div>
              @endif
            </div>
            <div class="place-share">
              <a title="Save" href="#" class="add-wishlist @if($place->wish_list_count) remove_wishlist active @else @guest open-login @else add_wishlist @endguest @endif" data-id="{{$place->id}}">
                <i class="la la-bookmark la-24">
                </i>
              </a>
              <a title="Share" href="#" class="share">
                <i class="la la-share-square la-24">
                </i>
              </a>
              <div class="social-share">
                <div class="list-social-icon">
                  <a class="facebook" href="#" onclick="window.open('https://www.facebook.com/sharer.php?u=' + window.location.href,'popUpWindow','height=550,width=600,left=200,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes');">
                    <i class="la la-facebook">
                    </i>
                  </a>
                  <a class="twitter" href="#" onclick="window.open('https://twitter.com/share?url=' + window.location.href,'popUpWindow','height=500,width=550,left=200,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes');">
                    <i class="la la-twitter">
                    </i>
                  </a>
                  <a class="linkedin" href="#" onclick="window.open('https://www.linkedin.com/shareArticle?mini=true&url=' + window.location.href,'popUpWindow','height=550,width=600,left=200,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes');">
                    <i class="la la-linkedin">
                    </i>
                  </a>
                  <a class="pinterest" href="#" onclick="window.open('https://pinterest.com/pin/create/button/?url=' + window.location.href,'popUpWindow','height=500,width=550,left=200,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes');">
                    <i class="la la-pinterest">
                    </i>
                  </a>
                </div>
              </div>
            </div>
            <!-- .place-share -->
            <div class="place-gallery">
              <a class="show-gallery" title="Gallery" href="#">
                <i class="la la-images la-24">
                </i>
                {{__('Gallery')}}
              </a>
              @if($place->video)
              <a title="Video" href="{{$place->video}}" data-lity class="lity-btn">
                <i class="la la-youtube la-24">
                </i>
                {{__('Video')}}
              </a>
              @endif
            </div>
            <!-- .place-item__photo -->
            <div class="place-breadcrumbs">
              <ul class="breadcrumbs">
                <li>
                  <a title="{{$city->name}}" href="{{route('city_detail', $city->slug)}}">{{$city->name}}
                  </a>
                </li>
                @foreach($categories as $cat)
                <li>
                  <a href="{{route('city_category_detail', [$city->slug, $cat->slug])}}" title="{{$cat->name}}">{{$cat->name}}
                  </a>
                </li>
                @endforeach
              </ul>
              <!-- .place__breadcrumbs -->
              @if(isset($place_types))
              <div class="place__category">
                @foreach($place_types as $type)
                <a title="{{$type->name}}" href="#">{{$type->name}}
                </a>
                @endforeach
              </div>
              @endif
            </div>
            <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
              <!-- Background of PhotoSwipe.It's a separate element as animating opacity is faster than rgba(). -->
              <div class="pswp__bg">
              </div>
              <!-- Slides wrapper with overflow:hidden. -->
              <div class="pswp__scroll-wrap">
                <!-- Container that holds slides.PhotoSwipe keeps only 3 of them in the DOM to save memory.Don't modify these 3 pswp__item elements, data is added later on. -->
                <div class="pswp__container">
                  <div class="pswp__item">
                  </div>
                  <div class="pswp__item">
                  </div>
                  <div class="pswp__item">
                  </div>
                </div>
                <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
                <div class="pswp__ui pswp__ui--hidden">
                  <div class="pswp__top-bar">
                    <!--  Controls are self-explanatory. Order can be changed. -->
                    <div class="pswp__counter">
                    </div>
                    <button class="pswp__button pswp__button--close" title="Close (Esc)">
                    </button>
                    <button class="pswp__button pswp__button--share" title="Share">
                    </button>
                    <button class="pswp__button pswp__button--fs" title="Toggle fullscreen">
                    </button>
                    <button class="pswp__button pswp__button--zoom" title="Zoom in/out">
                    </button>
                    <!-- element will get class pswp__preloader--active when preloader is running -->
                    <div class="pswp__preloader">
                      <div class="pswp__preloader__icn">
                        <div class="pswp__preloader__cut">
                          <div class="pswp__preloader__donut">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                    <div class="pswp__share-tooltip">
                    </div>
                  </div>
                  <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
                  </button>
                  <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
                  </button>
                  <div class="pswp__caption">
                    <div class="pswp__caption__center">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- .pswp -->
          </div>
          <!-- .place-slider -->
        </div>
        <div class="col-md-6 clear-padding">
          <div class="widget widget-shadows widget-reservation">
            <h1 style="font-weight: 800;">{{$place->name}}</h1>
             <h5>{{__('Starting From')}}</h5>
            <h4 style="color: #ee5000;">{{$place->price}}DH/{{PRICE_RANGE[$place['price_range']]}}</h4>
            <span class="place__reviews__number reviews__number"> {{$review_score_avg}}<i class="la la-star"> </i>  </span>
            <span class="place__places-item__count reviews_count">({{count($reviews)}} {{__('reviews')}})
            </span>
            <div class="place__box place__box-overview">
              <div class="place__desc">{!! $place->description !!} </div>
              <!-- .place__desc -->
              <a href="#" class="show-more" title="{{__('Show more')}}">{{__('Show more')}}  </a>
              @guest()
              <button class="btn btn-block btn-login open-login">{{__('Book now')}}  </button>
              @else
              <button class="btn btn-block booking_submit_btn"><a href="#booking" style="color: white;">{{__('Book now')}}</a></button>
              @endguest
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="package-complete-detail">
              <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a data-toggle="tab" class="nav-link" href="#itinerary">
                    <i class="fa fa-street-view">
                    </i> 
                    <span>{{__('Itinerary')}}
                    </span>
                  </a>
                </li>
                  <li class="nav-item">
                  <a data-toggle="tab" class="nav-link active" href="#overview">
                    <i class="fa fa-suitcase">
                    </i> 
                    <span>{{__('Detail')}}
                    </span>
                  </a>
                </li>
              </ul>
              <div class="tab-content">
               <div  class="tab-pane fade"  id="itinerary">
                  @if(isset($place['itinerary']))
                  <h4 class="tab-heading">{{__('Package Itinerary')}}
                  </h4>
                  <div class="daily-schedule">
                    @foreach($place['itinerary'] as $itinerary)
                    <div class="title">
                      <p>
                        <span>{{$itinerary['question']}}
                        </span>
                      </p>
                    </div>
                    <div class="daily-schedule-body">
                      <p>{!! $itinerary['answer'] !!}
                      </p>                                               
                    </div>
                    @endforeach
                  </div>
                  @endif
                </div>
                <div class="tab-pane active" id="overview" >
                  <h4 class="tab-heading">{{__('Description')}}
                  </h4>
                  <div class="daily-schedule-body">
                    <p>
                      {!! $place->description !!}
                    </p>
                     <h4 class="tab-heading"> {{__('Included')}}
                     </h4>
                     <div class="container my-1">
                      @foreach($amenities as $key => $item)
                      <div class="col-md-6 col-sm-6">
                        <p>
                          <img src="{{getImageUrl($item->icon)}}" alt="{{$item->name}}"> {{$item->name}}
                        </p>
                      </div>
                      @endforeach
                      </div>
                    </div>
             
                  @if(isset($place['video']))
                  <div class="place__box">
                    <h3 class="tab-heading">Videos
                    </h3>
                    <iframe width="100%" height="400" src="https://www.youtube.com/embed/{{getYoutubeId($place['video'])}}" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                    </iframe>
                  </div>
                  <!-- .place__box -->
                  @endif
              <div class="place__box place__box-map">
                <h3 class="place__title--additional tab-heading">
                  {{__('Location & Maps')}}
                </h3>
                <div class="maps">
                  <div id="golo-place-map">
                  </div>
                  <input type="hidden" id="place_lat" value="{{$place->lat}}">
                  <input type="hidden" id="place_lng" value="{{$place->lng}}">
                </div>
                <div class="address">
                  <i class="la la-map-marker">
                  </i>
                  {{$place->address}}
                  <a href="https://maps.google.com/?q={{$place->address}}" title="Direction" target="_blank" rel="nofollow">({{__('Direction')}})
                  </a>
                </div>
              </div>               
                <div class="place__box place__box--reviews">
                  <h3 class="place__title--reviews">
                    {{__('Review')}} ({{count($reviews)}})
                    @if(isset($reviews))
                    <span class="place__reviews__number"> {{$review_score_avg}}
                      <i class="la la-star">
                      </i>
                    </span>
                    @endif
                  </h3>
                  <ul class="place__comments">
                    @foreach($reviews as $review)
                    <li>
                      <div class="place__author">
                        <div class="place__author__avatar">
                          <a title="" href="#">
                            <img src="{{asset('frontend/assets/images/portal_images/user.png')}}" alt="user">
                          </a>
                        </div>
                        <div class="place__author__info">
                          <h4>
                            <a title="Nitithorn" href="#">{{$review['user']['name']}}
                            </a>
                            <div class="place__author__star">
                              <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                              </svg>
                              @php
                              $width = $review->score * 20;
                              $review_width = "style='width:{$width}%'";
                              @endphp
                              <span {!! $review_width !!}>
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                  <path fill="#23D3D3" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                  <path fill="#23D3D3" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                  <path fill="#23D3D3" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                  <path fill="#23D3D3" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                  <path fill="#23D3D3" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                                </svg>
                              </span>
                            </div>
                          </h4>
                          <time>{{formatDate($review->created_at, 'd/m/Y')}}
                          </time>
                        </div>
                      </div>
                      <div class="place__comments__content">
                        <p>{{$review->comment}}
                        </p>
                      </div>
                    </li>
                    @endforeach
                  </ul>
                  @guest
                  <div class="login-for-review account logged-out">
                    <a href="#" class="btn-login open-login">{{__('Login')}}
                    </a>
                    <span>{{__('to review')}}
                    </span>
                  </div>
                  @else
                  <div class="review-form">
                    <h3>{{__('Write a review')}}
                    </h3>
                    <form id="submit_review">
                      @csrf
                      <div class="rate">
                        <span>{{__('Rate This Place')}}
                        </span>
                        <div class="stars">
                          <a href="#" class="star-item" data-value="1" title="star-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                              <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                            </svg>
                          </a>
                          <a href="#" class="star-item" data-value="2" title="star-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                              <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                            </svg>
                          </a>
                          <a href="#" class="star-item" data-value="3" title="star-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                              <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                            </svg>
                          </a>
                          <a href="#" class="star-item" data-value="4" title="star-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                              <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                            </svg>
                          </a>
                          <a href="#" class="star-item" data-value="5" title="star-5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                              <path fill="#DDD" fill-rule="evenodd" d="M6.12.455l1.487 3.519 3.807.327a.3.3 0 0 1 .17.525L8.699 7.328l.865 3.721a.3.3 0 0 1-.447.325L5.845 9.4l-3.272 1.973a.3.3 0 0 1-.447-.325l.866-3.721L.104 4.826a.3.3 0 0 1 .17-.526l3.807-.327L5.568.455a.3.3 0 0 1 .553 0z"/>
                            </svg>
                          </a>
                        </div>
                      </div>
                      <div class="field-textarea">
                        @if(!empty(\App\Profile::getUserInfo(auth()->user()->id)->photo))
                        <img src="{{asset(\App\Profile::getUserInfo(auth()->user()->id)->photo)}}"
                             alt="{{\App\Profile::getUserInfo(auth()->user()->id)->first_name}}">
                        @else
                        <img class="author-avatar"  src="{{asset('frontend/assets/images/portal_images/user.png')}}" alt="user">
                        @endif                                               
                        <textarea name="comment" placeholder="{{__('Write a review')}}">
                        </textarea>
                      </div>
                      <div class="field-submit">
                        <small class="form-text text-danger" id="review_error">{{__('error!')}}
                        </small>
                        <input type="hidden" name="score" value="">
                        <input type="hidden" name="place_id" value="{{$place->id}}">
                        <button type="submit" class="btn" id="btn_submit_review">{{__('Submit')}}
                        </button>
                      </div>
                    </form>
                  </div>
                  @endguest
                </div>
                <!-- .place__box -->
              </div>
              <!-- .place__left -->
            </div>
          </div>
       </div>
    </div>
          <div class="col-lg-6 col-md-6">
            <div class="sidebar sidebar--border">
              <div class="widget-reservation-mini">
                @if($place->booking_type === \App\Booking::TYPE_BOOKING_NOW)
                <h3>{{__('Booking online')}}
                </h3>
                <a href="#" class="open-wg btn">{{__('Book now')}}
                </a>
                @elseif($place->booking_type === \App\Booking::TYPE_BOOKING_FORM)
                <h3>{{__('Make a reservation')}}
                </h3>
                <a href="#" class="open-wg btn">{{__('Book now')}}
                </a>
                @elseif($place->booking_type === \App\Booking::TYPE_CONTACT_FORM)
                <h3>{{__('Send me a message')}}
                </h3>
                <a href="#" class="open-wg btn">{{__('Send')}}
                </a>
                @else
                <h3>{{__('Banner Ads')}}
                </h3>
                <a href="#" class="open-wg btn">{{__('View')}}
                </a>
                @endif
              </div>
              @if($place->booking_type === \App\Booking::TYPE_BOOKING_NOW)
              <aside  id="booking"  class="widget widget-shadow widget-booking">
                <h3>{{__('Booking online')}}
                </h3>
                <div class="form-underline" >
                  <form action="{{ route('add-to-cart', $place->id) }}" method="GET">
                    @csrf
                    <div class="field-select has-sub field-guest">
                      <span class="sl-icon">
                        <i class="la la-user-friends">
                        </i>
                      </span>
                      <input type="text" placeholder="{{__('Guest')}} *" readonly>
                      <i class="la la-angle-down">
                      </i>
                      <div class="field-sub">
                        <ul>
                          <li>
                            <span>{{__('Person')}}
                            </span>
                            <div class="shop-details__quantity">
                              <span class="minus">
                                <i class="la la-minus">
                                </i>
                              </span>
                              <input type="number" name="person" value="0" class="qty person">
                              <span class="plus">
                                <i class="la la-plus">
                                </i>
                              </span>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                    </div>
                  <input type="hidden" name="type" value="{{\App\Models\Booking::TYPE_BOOKING_NOW}}">
                  <input type="hidden" name="place_id" value="{{$place->id}}">
                  <button  type="submit" class="btn">{{__('Book now')}}
                  </button>
                  </form>
              </aside>
              <!-- .widget -->
              @elseif($place->booking_type === \App\Booking::TYPE_BOOKING_FORM)
              <aside  id="booking"  class="widget widget-shadow widget-reservation">
                <h3>{{__('Make a reservation')}}
                </h3>
                <form action="#" method="POST" class="form-underline" id="booking_form">
                  @csrf
                  <div class="field-select field-input">
                    <input type="text" id="name" name="name" placeholder="{{__('Enter your name')}} *" required>
                  </div>
                  <div class="field-select field-input">
                    <input type="text" id="email" name="email" placeholder="{{__('Enter your email')}} *" required>
                  </div>
                  <div class="field-select field-input">
                    <input type="text" id="phone_number" name="phone_number" placeholder="{{__('Enter your phone')}}">
                  </div>
                  <div class="field-select has-sub field-guest">
                    <input type="text" placeholder="{{__('Guest')}} *" readonly>
                    <i class="la la-angle-down">
                    </i>
                    <div class="field-sub">
                      <ul>
                        <li>
                          <span>{{__('Adults')}}
                          </span>
                          <div class="shop-details__quantity">
                            <span class="minus">
                              <i class="la la-minus">
                              </i>
                            </span>
                            <input type="number" name="numbber_of_adult" value="0" class="qty number_adults">
                            <span class="plus">
                              <i class="la la-plus">
                              </i>
                            </span>
                          </div>
                        </li>
                        <li>
                          <span>{{__('Childrens')}}
                          </span>
                          <div class="shop-details__quantity">
                            <span class="minus">
                              <i class="la la-minus">
                              </i>
                            </span>
                            <input type="number" name="numbber_of_children" value="0" class="qty number_childrens">
                            <span class="plus">
                              <i class="la la-plus">
                              </i>
                            </span>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="field-select field-date">
                    <input type="text" name="date" placeholder="Date *" class="datepicker" autocomplete="off">
                    <i class="la la-angle-down">
                    </i>
                  </div>
                  <div class="field-select field-date">
                    <input type="text" name="end_date" placeholder="End Date *" class="datepicker" autocomplete="off">
                    <i class="la la-angle-down">
                    </i>
                  </div>
                  <input type="hidden" name="type" value="{{\App\Booking::TYPE_BOOKING_FORM}}">
                  <input type="hidden" name="place_id" value="{{$place->id}}">
                  <button class="btn booking_submit_btn">{{__('Send')}}
                  </button>
                  <p class="note">{{__("You won't be charged yet")}}
                  </p>
                  <div class="alert alert-success alert_booking booking_success">
                    <p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                        <path fill="#20D706" fill-rule="nonzero" d="M9.967 0C4.462 0 0 4.463 0 9.967c0 5.505 4.462 9.967 9.967 9.967 5.505 0 9.967-4.462 9.967-9.967C19.934 4.463 15.472 0 9.967 0zm0 18.065a8.098 8.098 0 1 1 0-16.196 8.098 8.098 0 0 1 8.098 8.098 8.098 8.098 0 0 1-8.098 8.098zm3.917-12.338a.868.868 0 0 0-1.208.337l-3.342 6.003-1.862-2.266c-.337-.388-.784-.589-1.207-.336-.424.253-.6.863-.325 1.255l2.59 3.152c.194.252.415.403.646.446l.002.003.024.002c.052.008.835.152 1.172-.45l3.836-6.891a.939.939 0 0 0-.326-1.255z">
                        </path>
                      </svg>
                      {{__('You successfully created your booking.')}}
                    </p>
                  </div>
                  <div class="alert alert-error alert_booking booking_error">
                    <p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                        <path fill="#FF2D55" fill-rule="nonzero"
                              d="M11.732 9.96l1.762-1.762a.622.622 0 0 0 0-.88l-.881-.882a.623.623 0 0 0-.881 0L9.97 8.198l-1.761-1.76a.624.624 0 0 0-.883-.002l-.88.881a.622.622 0 0 0 0 .882l1.762 1.76-1.758 1.759a.622.622 0 0 0 0 .88l.88.882a.623.623 0 0 0 .882 0l1.757-1.758 1.77 1.771a.623.623 0 0 0 .883 0l.88-.88a.624.624 0 0 0 0-.882l-1.77-1.771zM9.967 0C4.462 0 0 4.462 0 9.967c0 5.505 4.462 9.967 9.967 9.967 5.505 0 9.967-4.462 9.967-9.967C19.934 4.463 15.472 0 9.967 0zm0 18.065a8.098 8.098 0 1 1 8.098-8.098 8.098 8.098 0 0 1-8.098 8.098z">
                        </path>
                      </svg>
                      {{__('Your Booking is Pending, We Will Contact You as Soon as Possible.')}}
                    </p>
                  </div>
                </form>
              </aside>
              <!-- .widget-reservation -->
              @elseif($place->booking_type === \App\Booking::TYPE_CONTACT_FORM)
              <aside  id="booking"  class="widget widget-shadow widget-booking-form">
                <h3>{{__('Send me a message')}}
                </h3>
                <form class="form-underline" id="booking_submit_form" action="" method="post">
                  @csrf
                  <div class="field-input">
                    <input type="text" id="name" name="name" placeholder="{{__('Enter your name')}} *" required>
                  </div>
                  <div class="field-input">
                    <input type="text" id="email" name="email" placeholder="{{__('Enter your email')}} *" required>
                  </div>
                  <div class="field-input">
                    <input type="text" id="phone_number" name="phone_number" placeholder="{{__('Enter your phone')}}">
                  </div>
                  <div class="field-input">
                    <textarea type="text" id="message" name="message" placeholder="{{__('Enter your message')}}">
                    </textarea>
                  </div>
                  <input type="hidden" name="type" value="{{\App\Booking::TYPE_CONTACT_FORM}}">
                  <input type="hidden" name="place_id" value="{{$place->id}}">
                  <button class="btn booking_submit_btn">{{__('Send')}}
                  </button>
                  <div class="alert alert-success alert_booking booking_success">
                    <p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                        <path fill="#20D706" fill-rule="nonzero" d="M9.967 0C4.462 0 0 4.463 0 9.967c0 5.505 4.462 9.967 9.967 9.967 5.505 0 9.967-4.462 9.967-9.967C19.934 4.463 15.472 0 9.967 0zm0 18.065a8.098 8.098 0 1 1 0-16.196 8.098 8.098 0 0 1 8.098 8.098 8.098 8.098 0 0 1-8.098 8.098zm3.917-12.338a.868.868 0 0 0-1.208.337l-3.342 6.003-1.862-2.266c-.337-.388-.784-.589-1.207-.336-.424.253-.6.863-.325 1.255l2.59 3.152c.194.252.415.403.646.446l.002.003.024.002c.052.008.835.152 1.172-.45l3.836-6.891a.939.939 0 0 0-.326-1.255z">
                        </path>
                      </svg>
                      {{__('You successfully created your booking.')}}
                    </p>
                  </div>
                  <div class="alert alert-error alert_booking booking_error">
                    <p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                        <path fill="#FF2D55" fill-rule="nonzero"
                              d="M11.732 9.96l1.762-1.762a.622.622 0 0 0 0-.88l-.881-.882a.623.623 0 0 0-.881 0L9.97 8.198l-1.761-1.76a.624.624 0 0 0-.883-.002l-.88.881a.622.622 0 0 0 0 .882l1.762 1.76-1.758 1.759a.622.622 0 0 0 0 .88l.88.882a.623.623 0 0 0 .882 0l1.757-1.758 1.77 1.771a.623.623 0 0 0 .883 0l.88-.88a.624.624 0 0 0 0-.882l-1.77-1.771zM9.967 0C4.462 0 0 4.462 0 9.967c0 5.505 4.462 9.967 9.967 9.967 5.505 0 9.967-4.462 9.967-9.967C19.934 4.463 15.472 0 9.967 0zm0 18.065a8.098 8.098 0 1 1 8.098-8.098 8.098 8.098 0 0 1-8.098 8.098z">
                        </path>
                      </svg>
                      {{__('An error occurred. Please try again.')}}
                    </p>
                  </div>
                </form>
              </aside>
              <!-- .widget-reservation -->
              @else
              <aside class="sidebar--shop__item widget widget--ads">
                @if(setting('ads_sidebar_banner_image'))
                <a title="Ads" href="{{setting('ads_sidebar_banner_link')}}" target="_blank" rel="nofollow">
                  <img src="{{asset('uploads/' . setting('ads_sidebar_banner_image'))}}" alt="banner ads golo">
                </a>
                @endif
              </aside>
              @endif
            </div>
            <!-- .sidebar -->
          </div>
        </div>
      </div>
    </div>
    <!-- .place -->
    {{--    
    <div class="similar-places">
      <div class="container">
        <h2 class="similar-places__title title">{{__('Similar places')}}
        </h2>
        <div class="similar-places__content">
          <div class="row">
            @foreach($similar_places as $place)
            <div class="col-lg-3 col-md-6">
              @include('frontend.common.place_item')
            </div>
            @endforeach
          </div>
        </div>
      </div>
    </div>
    <!-- .similar-places --> --}}
    </main>
  <!-- .site-main -->
@endsection

@push('scripts')
    <script src="{{asset('frontend/assets/js/page_place_detail.js')}}"></script>
@endpush