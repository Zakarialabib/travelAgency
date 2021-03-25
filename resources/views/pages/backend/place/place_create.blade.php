@extends('layouts.backend')

@section('content')
    <div class="page-title">
        <div class="title_left">
            <h3>{{__('Add place')}}</h3>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 bg-white">
            <div class="x_panel">
                <div class="x_content row">
                    <div class="col-lg-3 col-xs-3 col-sm-3">
                        <ul class="nav nav-tabs tabs-left place_create_menu">
                            <li class=""><a href="#genaral">{{__('Genaral')}}</a></li>
                            <li class=""><a href="#hightlight">{{__('Hightlight')}}</a></li>
                            <li class=""><a href="#location">{{__('Location')}}</a></li>
                            <li class=""><a href="#contact_info">{{__('Contact info')}}</a></li>
                            <li class=""><a href="#social_network">{{__('Social network')}}</a></li>
                            <li class=""><a href="#opening_hours">{{__('Open hourses')}}</a></li>
                            <li class=""><a href="#media">{{__('Media')}}</a></li>
                            <li class=""><a href="#link_affiliate">{{__('Booking type')}}</a></li>
                            <li class=""><a href="#golo_seo">{{__('SEO')}}</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-8 col-sm-8 col-xs-8 place_create">
                        <form action="{{route('place_store')}}" enctype="multipart/form-data" method="post">
                            @csrf
                            <div class="tab-content">
                                <ul class="nav nav-tabs bar_tabs" role="tablist">
                                    @foreach($languages as $index => $language)
                                        <li class="nav-item">
                                            <a class="nav-link {{$index !== 0 ?: "active"}}" id="home-tab" data-toggle="tab" href="#language_{{$language->code}}" role="tab" aria-controls="" aria-selected="">{{$language->name}}</a>
                                        </li>
                                    @endforeach
                                </ul>
                        
                                <div id="genaral">
                                    <p class="lead">{{__('Genaral')}}</p>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <div class="tab-content">
                                                @foreach($languages as $index => $language)
                                                    <div class="tab-pane fade show {{$index !== 0 ?: "active"}}" id="language_{{$language->code}}" role="tabpanel" aria-labelledby="home-tab">
                                                        <div class="form-group">
                                                            <label for="place_name">{{__('Place name')}}
                                                                <small>({{$language->code}})</small>  : *</label>
                                                            <input type="text" class="form-control" name="{{$language->code}}[name]" placeholder="{{__('What the name of place')}}" autocomplete="off" {{$index !== 0 ?: "required"}}>
                                                        </div>
                        
                                                        <div class="form-group">
                                                            <label for="place_description">Description
                                                                <small>({{$language->code}})</small>
                                                                : *</label>
                                                            <textarea type="text" class="form-control tinymce_editor" id="place_description" name="{{$language->code}}[description]" rows="6" {{$index !== 0 ?: "required"}}></textarea>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="price_range">{{__('Price range')}}: *</label>
                                            <select class="form-control" id="price_range" name="price_range">
                                                <option value="">Free</option>
                                                <option value="0">Chambre</option>
                                                <option value="1">Nuit</option>
                                                <option value="2">Pack</option>
                                                <option value="3">Personne</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                        <label for="price">{{__('Price')}}: *</label>
                                        <input type="text" class="form-control" id="price" name="price" placeholder="{{__('Price')}}" autocomplete="off" required>
                                        </div>
                                        <div class="col-md-12">
                                        <label for="date">{{__('Offre Date')}}:</label>
                                        <input type="date" class="form-control date-picker" id="date" name="date" placeholder="01/12/2020" autocomplete="off">
                                        </div>
                                    </div>
                        
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="place_category">{{__('Category')}}: *</label>
                                            <select class="form-control chosen-select" id="place_category" name="category[]" multiple data-live-search="true" required>
                                                @foreach($categories as $cat)
                                                    <option value="{{$cat->id}}">{{$cat->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                        
                                        <div class="col-md-6">
                                            <label for="place_type">{{__('Place type')}}: *</label>
                                            <select class="form-control chosen-select" id="place_type" name="place_type[]" multiple data-live-search="true" required>
                                                @foreach($place_types as $cat)
                                                    <optgroup label="{{$cat->name}}">
                                                        @foreach($cat['place_type'] as $type)
                                                            <option value="{{$type->id}}">{{$type->name}}</option>
                                                        @endforeach
                                                    </optgroup>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                        
                                </div>
                        
                                <div id="hightlight">
                                    <p class="lead">{{__('Amenities')}}</p>
                                    <div class="checkbox row">
                                        @foreach($amenities as $item)
                                            <div class="col-md-3 mb-10">
                                                <label class="p-0"><input type="checkbox" class="flat" name="amenities[]" value="{{$item->id}}"> {{$item->name}}</label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                        
                                <div id="location">
                                    <p class="lead">{{__('Location')}}</p>
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="select_country">{{__('Country')}}: *</label>
                                            <select class="form-control" id="select_country" name="country_id" required>
                                                <option value="">{{__('Select Country')}}</option>
                                                @foreach($countries as $country)
                                                    <option value="{{$country->id}}">{{$country->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="select_city">{{__('City')}}: *</label>
                                            <select class="form-control" id="select_city" name="city_id" required>
                                                <option value="">{{__('Please select country first')}}</option>
                                            </select>
                                        </div>
                                    </div>
                        
                                    <div class="form-group">
                                        <label for="place_address">{{__('Place Address')}}: *</label>
                                        <input type="text" class="form-control" id="place_address" name="address" value="Maroc" placeholder="{{__('Place Address')}}" autocomplete="off">
                                        <input type="hidden" id="place_lat" name="lat">
                                        <input type="hidden" id="place_lng" name="lng">
                                    </div>
                                    {{--<input type="text" id="pac-input" class="form-control" placeholder="{{__('Search address...')}}" autocomplete="off">--}}
                                    <div id="map"></div>
                        
                                </div>
                        
                                <div id="contact_info">
                                    <p class="lead">{{__('Contact info')}}</p>
                                   <div class="form-group row">
                                    <div class="col-md-4">
                                        <label for="place_email">{{__('Email')}}:</label>
                                        <input type="text" class="form-control" id="place_email" value="info@rentacstours.com" name="email">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="place_phone_number">{{__('Phone number')}}:</label>
                                        <input type="text" class="form-control" id="place_phone_number" name="phone_number">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="place_website">{{__('Website')}}:</label>
                                        <input type="text" class="form-control" id="place_website" value="www.rentacstours.com" name="website">
                                       </div>
                                    </div>
                                </div>
                        
                                <div id="social_network">
                                    <p class="lead">{{__('Social Networks')}}</p>
                                    <div id="social_list">
                                        <div class="row form-group social_item">
                                            <div class="col-md-5">
                                                <select class="form-control" name="social[0][name]">
                                                    @foreach(SOCIAL_LIST as $value)
                                                        <option value="{{$value['name']}}">{{$value['name']}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="" name="social[0][url]" placeholder="{{__('Enter URL include http or www')}}">
                                            </div>
                                            <div class="col-md-1">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-round btn-primary" id="social_addmore">+{{__('Add more')}}</button>
                                </div>
                        
                                <div id="opening_hours">
                                    <p class="lead">{{__('Opening hours')}}</p>
                                    <div id="openinghour_list">
                                        @foreach(DAYS as $key => $day)
                                            <div class="row form-group openinghour_item">
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" name="opening_hour[{{$key}}][title]" value="{{$day}}">
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="opening_hour[{{$key}}][value]" placeholder="enter value. Exp: 9:00 - 21:00">
                                                </div>
                                                <div class="col-md-1">
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    <button type="button" class="btn btn-round btn-primary" id="openinghour_addmore">+{{__('Add more')}}</button>
                                </div>
                        
                               <div id="itinerary">
                                <p class="lead">{{__('itinerary')}}</p>
                                    <div id="itinerary_list">
                                                <div class="row form-group itinerary_item" id="itinerary_item_{{$key}}">
                                                    <div class="col-md-11">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="itinerary[{{$key}}][question]" placeholder="{{__('Enter Day')}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control tinymce_editor" name="itinerary[{{$key}}][answer]" rows="3" placeholder="Enter Description">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <button type="button" class="btn btn-danger itinerary_item_remove" id="{{$key}}">X</button>
                                                    </div>
                                                </div>
                                    </div>
                                    <button type="button" class="btn btn-round btn-primary" id="itinerary_addmore">+{{__('Add more')}}</button>
                                </div>
                        
                                <div id="media">
                                    <p class="lead">{{__('Media')}}</p>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>{{__('Thumbnail image')}}:</strong></p>
                                            <img id="preview_thumb" src="https://via.placeholder.com/120x150?text=thumbnail">
                                            <input type="file" class="form-control" id="thumb" name="thumb" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 gallery">
                                            <p><strong>{{__('Gallery images')}}:</strong></p>
                                            <div id="place_gallery_thumbs"></div>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="file" class="form-control" id="gallery" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="form-group video">
                                        <label for="place_video">{{__('Video')}}:</label>
                                        <input type="text" class="form-control" id="place_video" name="video" placeholder="Youtube, Vimeo video url">
                                    </div>
                                </div>
                        
                                <div id="link_affiliate">
                                    <p class="lead">{{__('Booking type')}}</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-secondary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-primary">
                                            <input type="radio" name="booking_type" value="{{\App\Booking::TYPE_BOOKING_FORM}}" class="join-btn">{{__('Booking form')}}
                                        </label>
                                        {{-- <label class="btn btn-secondary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-primary">
                                            <input type="radio" name="booking_type" value="{{\App\Booking::TYPE_CONTACT_FORM}}" class="join-btn">{{__('Contact form')}}
                                        </label>
                                      <label class="btn btn-secondary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-primary">
                                            <input type="radio" name="booking_type" value="{{\App\Booking::TYPE_BOOKING_NOW}}" class="join-btn">{{__('Booking Now')}}
                                        </label>
                                        <label class="btn btn-secondary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-primary">
                                            <input type="radio" name="booking_type" value="{{\App\Booking::TYPE_BANNER}}" class="join-btn">{{__('Banner Ads')}}
                                        </label>--}}
                                    </div>
                                </div>
                        
                                <div class="ln_solid"></div>
                        
                                <div id="golo_seo">
                                    <p class="lead">{{__('SEO')}}</p>
                        
                                    <div class="form-group">
                                        <label for="seo_title">{{__('SEO title')}} - <small>{{__('60 characters or less')}}</small>:</label>
                                        <input type="text" class="form-control" id="seo_title" name="seo_title">
                                       <div id="count">
                                          <span id="current_count">0</span>
                                           <span id="maximum_count">/ 60</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="seo_description">{{__('Meta Description')}} - <small>{{__('160 characters or less')}}</small>:</label>
                                        <textarea class="form-control" id="seo_description" name="seo_description"></textarea>
                                        <div id="counter">
                                          <span id="count_current">0</span>
                                           <span id="count_maximum">/ 160</span>
                                        </div>
                                    </div>
                                </div>
                             </div>                       
                            <button type="submit" class="btn btn-primary mt-20">{{__('Submit')}}</button>
                        </form>
                        
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
        </div>
    </div>
@endsection


@push('scripts')
    <script src="{{asset('admin/js/page_place_create.js')}}"></script>
    <script src="{{asset('admin/js/page_post.js')}}"></script>
    @endpush