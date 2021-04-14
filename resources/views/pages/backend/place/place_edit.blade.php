@extends('layouts.backend')

@section('content')
<h2 id="heading" style="text-align: center;">{{__('Edit  place')}}</h2>
<div class="row">
        <div class="card col-md-12 col-sm-12 col-xs-12 bg-white">
            <form id='msform' action="{{ route('place_update' , $place->id) }}" enctype="multipart/form-data" method="post">
                @method('put')
                @csrf
                
                    <!-- progressbar -->
                    <ul id="progressbar">
                        <li class="active" id="account"><strong>{{__('Genaral')}}</strong></li>
                        <li id="personal"><strong>Informations personnelles</strong></li>
                        <li id="details"><strong>Détails</strong></li>
                        <li id="payment"><strong>Médias et SEO</strong></li>
                    </ul>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                    </div> <br> <!-- fieldsets -->

                    <fieldset>
                         <ul class="nav nav-tabs bar_tabs" role="tablist">
                            @foreach($languages as $index => $language)
                                <li class="nav-item">
                                    <a class="nav-link {{$index !== 0 ?: "active"}}" id="home-tab" data-toggle="tab" href="#language_{{$language->code}}" role="tab" aria-controls="" aria-selected="">{{$language->name}}</a>
                                </li>
                            @endforeach
                         </ul>
                          <div style='padding:10px;'>
                                    <p class="lead">{{__('Genaral')}}</p>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <div class="tab-content">
                                                @foreach($languages as $index => $language)
                                                    @php
                                                        $trans = $place ? $place->translate($language->code) : [];
                                                    @endphp
                                                    <div class="tab-pane fade show {{$index !== 0 ?: "active"}}" id="language_{{$language->code}}" role="tabpanel" aria-labelledby="home-tab">
                                                        <div class="form-group">
                                                            <label for="place_name">{{__('Place name')}} <small>({{$language->code}})</small>: *</label>
                                                            <input type="text" class="form-control" name="{{$language->code}}[name]" value="{{$trans ? $trans['name'] : ''}}" placeholder="{{__('What the name of place')}}" autocomplete="off" {{$index !== 0 ?: "required"}}>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="name">{{__('Description')}}  <small>({{$language->code}})</small>: *</label>
                                                            <textarea type="text" class="form-control tinymce_editor" name="{{$language->code}}[description]" rows="6" {{$index !== 0 ?: "required"}}>{{$trans ? $trans['description'] : ''}}</textarea>
                                                        </div>
                        
                                                    </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="name">{{__('Price range')}}: *</label>
                                            <select class="form-control" id="price_range" name="price_range" required>
                                                @foreach(PRICE_RANGE as $key => $value)
                                                    <option value="{{$key}}" {{isSelected($key, $place->price_range)}}>{{$value}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                              <label for="price">{{__('Price')}}: *</label>
                                              <input type="text" class="form-control" id="price" name="price" value="{{$place->price}}"  autocomplete="off">
                                        </div>
                                        <div class="form-group col-md-12">
                                              <label for="date">{{__('Offre Date')}}: *</label>
                                               <input type="date" class="form-control" id="date" name="date"  value="{{$place->date}}" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label class="control-label" for="categpry">{{__('Category')}}:*
                                            <select class="form-control myselect" id="category" name="category[]" multiple data-live-search="true" required>
                                                @foreach($categories as $cat)
                                                    <option value="{{$cat->id}}" {{isSelected($cat->id, $place->category)}}>{{$cat->name}}</option>
                                                @endforeach
                                            </select>
                                            </label>
                                        </div>
                        
                                        <div class="form-group col-md-12">
                                            <label class="control-label" for="place_type">{{__('Place type')}}:*
                                            <select class="form-control myselect" id="place_type" name="place_type[]" multiple data-live-search="true" required>
                                                @foreach($place_types as $cat)
                                                    <optgroup label="{{$cat->name}}">
                                                        @foreach($cat['place_type'] as $type)
                                                            <option value="{{$type->id}}" {{isSelected($type->id, $place->place_type)}}>{{$type->name}}</option>
                                                        @endforeach
                                                    </optgroup>
                                                @endforeach
                                            </select>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                        
                                <div>
                                    <p class="lead">{{__('Amenities')}}</p>
                                    <div class="checkbox row">
                                        @foreach($amenities as $item)
                                            <div class="col-md-3 mb-10">
                                                <label class="p-0"><input type="checkbox" class="flat" name="amenities[]" value="{{$item->id}}" {{isChecked($item->id, $place->amenities)}}> {{$item->name}}</label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>

                                <div>
                                    <p class="lead">{{__('Location')}}</p>
                        
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="place_address">{{__('Country')}}: *</label>
                                            <select class="form-control" id="select_country" name="country_id" required>
                                                <option value="">{{__('Select Country')}}</option>
                                                @foreach($countries as $country)
                                                    <option value="{{$country->id}}" {{isSelected($country->id, $place->country_id)}}>{{$country->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="place_address">{{__('City')}}: *</label>
                                            <select class="form-control myselect" id="select_city" name="city_id" required>
                                                <option value="">{{__('Please select country first')}}</option>
                                                @foreach($cities as $city)
                                                    <option value="{{$city->id}}" {{isSelected($city->id, $place->city_id)}}>{{$city->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                        
                                    <div class="form-group">
                                        <label for="place_address">{{__('Place Address')}}: *</label>
                                        <input type="text" class="form-control" id="place_address" name="address" value="{{$place->address}}" placeholder="Full Address" autocomplete="off" required>
                                        <input type="hidden" id="place_lat" name="lat" value="{{$place->lat}}">
                                        <input type="hidden" id="place_lng" name="lng" value="{{$place->lng}}">
                                    </div>
                        
                                    {{--<input type="text" id="pac-input" class="form-control" value="{{$place->address}}" placeholder="Search address..." autocomplete="off">--}}
                                    <div id="map"></div>
                                </div>
                        
                                <div id="">
                                  <label class="lead">{{__('Booking type')}}</label>
                                     <select class="form-control" name="booking_type" required>
                                           <option  value="{{\App\Booking::TYPE_BOOKING_FORM}}" {{isChecked($place->booking_type, \App\Booking::TYPE_BOOKING_FORM)}}>{{__('Booking form')}}</option>
                                           <option  value="{{\App\Booking::TYPE_CONTACT_FORM}}" {{isChecked($place->booking_type, \App\Booking::TYPE_CONTACT_FORM)}}>{{__('Contact form')}}</option>
                                           <option  value="{{\App\Booking::TYPE_BANNER}}" {{isChecked($place->booking_type, \App\Booking::TYPE_BANNER)}}>{{__('Banner Ads')}}</option>
                                     </select>
                                </div>
                                                            
                    <input type="button" name="next" class="next action-button" value="Suivant" style='margin-right:10px;'/>
                    </fieldset>
                    <fieldset>
                    <div id="contact_info"  style='padding:10px;'>
                                    <p class="lead">{{__('Contact info')}}</p>
                                     <div class="form-group row">
                                    <div class="col-md-4">
                                        <label for="name">{{__('Email')}}:</label>
                                        <input type="text" class="form-control" id="place_email" name="email" value="{{$place->email}}" placeholder="Enter email address">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="name">{{__('Phone number')}}:</label>
                                        <input type="text" class="form-control" id="place_phone_number" name="phone_number" value="{{$place->phone_number}}" placeholder="Enter phone number">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="name">{{__('Website')}}:</label>
                                        <input type="text" class="form-control" id="place_website" name="website" value="{{$place->website}}" placeholder="Enter website url">
                                    </div>
                                    </div>
                                </div>
                                <div id="social_network">
                                    <p class="lead">{{__('Social Networks')}}</p>
                        
                                    <div id="social_list">
                                        @if($place->social)
                                            @foreach($place->social as $index => $social)
                                                <div class="row form-group social_item" id="social_item_{{$index}}">
                                                    <div class="col-md-5">
                                                        <select class="form-control" name="social[{{$index}}][name]">
                                                            @foreach(SOCIAL_LIST as $value)
                                                                <option value="{{$value['name']}}" {{isSelected($value['name'], $social['name'])}}>{{$value['name']}}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" name="social[{{$index}}][url]" value="{{$social['url']}}">
                                                    </div>
                                                    <div class="col-md-1">
                                                        <button type="button" class="btn btn-danger social_item_remove" id="{{$index}}">X</button>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                    <button type="button" class="btn btn-round btn-primary" id="social_addmore">+{{__('Add more')}}</button>
                                </div>
                                
                        
                                <div id="social_network" style='padding-left:20px;'>
                                    <p class="lead">{{__('Social Networks')}}</p>
                        
                                    <div id="social_list">
                                        @if($place->social)
                                            @foreach($place->social as $index => $social)
                                                <div class="row form-group social_item" id="social_item_{{$index}}">
                                                    <div class="col-md-5">
                                                        <select class="form-control" name="social[{{$index}}][name]">
                                                            @foreach(SOCIAL_LIST as $value)
                                                                <option value="{{$value['name']}}" {{isSelected($value['name'], $social['name'])}}>{{$value['name']}}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" name="social[{{$index}}][url]" value="{{$social['url']}}">
                                                    </div>
                                                    <div class="col-md-1">
                                                        <button type="button" class="btn btn-danger social_item_remove" id="{{$index}}">X</button>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                    <button type="button" class="btn btn-round btn-primary" id="social_addmore">+{{__('Add more')}}</button>
                                </div>
                                
                         <input type="button" name="next" class="next action-button" value="Suivant" /> <input type="button" name="precedent" class="previous action-button-previous" value="précédent" />
                    </fieldset>
                    <fieldset>
                    <div id="opening_hours" style='padding-left:10px;'>
                                   <p class="lead">{{__('Opening hours')}}</p>
                                    <div id="openinghour_list">
                                        @if($place->opening_hour)
                                            @foreach($place->opening_hour as $index => $opening_hour)
                                                <div class="row form-group openinghour_item">
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" id="" name="opening_hour[{{$index}}][title]" value="{{$opening_hour['title']}}">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="" name="opening_hour[{{$index}}][value]" value="{{$opening_hour['value']}}">
                                                    </div>
                                                    <div class="col-md-1">
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                    <input type="hidden" name="place_id" value="{{$place->id}}">
                                    <button type="button" class="btn btn-round btn-primary" id="openinghour_addmore">+{{__('Add more')}}</button>
                                </div>     
                                <div id="itinerary">
                                    <p class="lead">{{__('itinerary')}}</p>
                                    <div id="itinerary_list" style='padding-left:20px;'>
                                        @if($place->itinerary)
                                            @foreach($place->itinerary as $key => $menu)
                                                <div class="row form-group itinerary_item" id="itinerary_item_{{$key}}">
                                                    <div class="col-md-11">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="itinerary[{{$key}}][question]" value="{{$menu['question']}}" placeholder="Enter Day">
                                                        </div>
                                                        <div class="form-group">

                                                            <input type="text" class="form-control tinymce_editor" name="itinerary[{{$key}}][answer]" value="{{$menu['answer']}}" rows="3" placeholder="Enter Description">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <button type="button" class="btn btn-danger itinerary_item_remove" id="{{$key}}">X</button>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                    <button type="button" class="btn btn-round btn-info" id="itinerary_addmore">+{{__('Add more')}}</button>
                                </div>
                                <input type="button" name="next" class="next action-button" value="Suivant" /> <input type="button" name="previous" class="previous action-button-previous" value="Précedent" />
                    </fieldset>
                    <fieldset>
                    <div id="media">
                                    <p class="lead">{{__('Media')}}</p>
                                        <div class="col-md-12">
                                            <p><strong>{{__('Thumbnail image')}}:</strong></p>
                                            <img id="preview_thumb" src="{{getImageUrl($place->thumb)}}" alt="">
                                            <input type="file" class="form-control" id="thumb" name="thumb" accept="image/*">
                                        </div>
                                        <div class="col-md-12 gallery">
                                            <p><strong>{{__('Gallery images')}}:</strong></p>
                                            <div id="place_gallery_thumbs">
                                                @if($place->gallery)
                                                    @foreach($place->gallery as $image)
                                                        <div class="col-sm-2 media-thumb-wrap">
                                                            <figure class="media-thumb">
                                                                <img src="{{getImageUrl($image)}}">
                                                                <div class="media-item-actions">
                                                                    <a class="icon icon-delete" href="#">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="16" viewBox="0 0 15 16">
                                                                            <g fill="#5D5D5D" fill-rule="nonzero">
                                                                                <path d="M14.964 2.32h-4.036V0H4.105v2.32H.07v1.387h1.37l.924 12.25H12.67l.925-12.25h1.369V2.319zm-9.471-.933H9.54v.932H5.493v-.932zm5.89 13.183H3.65L2.83 3.707h9.374l-.82 10.863z"></path>
                                                                                <path d="M6.961 6.076h1.11v6.126h-1.11zM4.834 6.076h1.11v6.126h-1.11zM9.089 6.076h1.11v6.126h-1.11z"></path>
                                                                            </g>
                                                                        </svg>
                                                                    </a>
                                                                    <input type="hidden" name="gallery[]" value="{{$image}}">
                                                                    <span class="icon icon-loader d-none"><i class="fa fa-spinner fa-spin"></i></span>
                                                                </div>
                                                            </figure>
                                                        </div>
                                                    @endforeach
                                                @endif
                                        </div>
                                        <div class="col-md-12">
                                            <input type="file" class="form-control" id="gallery" name="banner" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="form-group video">
                                        <label for="place_video">{{__('Video')}}:</label>
                                        <input type="text" class="form-control" id="place_video" name="video" placeholder="Youtube, Vimeo video url">
                                    </div>
                                </div>
                                <div id="golo_seo" style="padding: 10px;">
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
                               <input type="button" name="previous" class="previous action-button-previous" value=" Précedent " />
                             <input type="submit" class="btn btn-primary mt-20" style='color:white; background-color:tomato;'>
                    </fieldset>
                </form>
            </div>
</div>
@endsection

@push('scripts')
    <script src="{{asset('admin/js/page_place_create.js')}}"  type="text/javascript"></script>
    <script src="{{asset('admin/js/page_post.js')}}"  type="text/javascript"></script>
    <script src="{{asset('js/multi-step-form.js')}}" type="text/javascript"></script>
@endpush

@section('css')
    <link rel="stylesheet" href="{{asset('backend/app-assets/css/multi-step-form.css')}}">

@endsection