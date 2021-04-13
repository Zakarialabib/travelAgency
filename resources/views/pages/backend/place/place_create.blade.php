@extends('layouts.backend')
@section('css')
    <link rel="stylesheet" href="{{asset('backend/app-assets/css/multi-step-form.css')}}">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
@endsection
@section('content')
<h2 style="text-align: center; color:black;">{{__('Add place')}}</h2>
<div class="row">
        <div class="card col-md-12 col-sm-12 col-xs-12 bg-white">
            <form id='msform' action=" {{route('place_store')}} " enctype="multipart/form-data" method="post" novalidate>
            @method('post')
            @csrf

                    <!-- progressbar -->
                    <ul id="progressbar">
                        <li class="active" id="account"><strong>Générale</strong></li>
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
                                <a class="nav-link {{$index !== 0 ?: "active"}}" id="home-tab" data-toggle="tab" href="#language_{{$language->code}}" role="tab">{{$language->name}}</a>
                            </li>
                        @endforeach
                    </ul>
                            <div id="general" style='padding:10px;'>
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

                                                            <input type="text" class="form-control" name="{{$language->code}}[name]" placeholder="{{__('What the name of place')}}" value="{{$trans ? $trans['name'] : ''}}" autocomplete="off" {{$index !== 0 ?: "required"}}>
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
                                </div>
                                    <div id="supplements" class="form-group row">
                                        <div class="col-md-6">
                                            <label for="price_range">{{__('Price range')}}: *</label>
                                            <select class="form-control" id="price_range" name="price_range" required>
                                                <option value="">Free</option>
                                                <option value="0">Chambre</option>
                                                <option value="1">Nuit</option>
                                                <option value="2">Pack</option>
                                                <option value="3">Personne</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                        {!!Form::label('email', __('Price'));!!}

                                        <label for="price"></label>
                                        <input type="text" class="form-control" id="price" name="price" placeholder="{{__('Price')}}" autocomplete="off" required>
                                        </div>
                                        <div class="col-md-12">
                                        <label for="date">{{__('Offre Date')}}:</label>
                                        <input type="date" class="form-control date-picker" id="date" name="date" placeholder="01/12/2020" autocomplete="off">
                                        </div>
                                    </div>
                        
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="place_category">{{__('Category')}}: *</label>
                                            <select class="form-control myselect" id="place_category" name="category[]" multiple data-live-search="true" required>
                                                @foreach($categories as $cat)
                                                    <option value="{{$cat->id}}">{{$cat->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                        
                                        <div class="col-md-6">
                                        <div class="form-group col-md-4">
                                            <label for="place_type">{{__('Place type')}}: *</label>
                                            <select class="form-control myselect" id="place_type" name="place_type[]" multiple data-live-search="true" required>
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
                        
                                <div id="services" style='padding:10px;'>
                                    <p class="lead">{{__('Amenities')}}</p>
                                    <div class="checkbox row">
                                        @foreach($amenities as $item)
                                            <div class="col-md-2 mb-12">
                                                <label class="p-0"><input type="checkbox" class="flat" name="amenities[]" value="{{$item->id}}"> {{$item->name}}</label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>

                                <div id="Location" style='padding:10px;'>
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
                                            <select class="form-control myselect" id="select_city" name="city_id" required>
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
                                    {{--<input type="text" id="pac-input" class="form-control" placeholder="{{__('Search address...')}}" autocomplete="off"> --}}
                                    <div id="map-wrapper">
                                         <div id="map"></div>
                                    </div>
                                </div>    
                             <div id="booking-type" >
                                <p class="lead">{{__('Booking type')}}</p>
                                    <select class="form-control" name="booking_type" required>
                                            <option value="">{{__('Booking type')}}</option>
                                            <option  value="{{\App\Booking::TYPE_BOOKING_FORM}}">{{__('Booking form')}}</option>
                                            <option  value="{{\App\Booking::TYPE_CONTACT_FORM}}">{{__('Contact form')}}</option>
                                            <option  value="{{\App\Booking::TYPE_BANNER}}">{{__('Banner Ads')}}</option>
                                     </select>
                             </div>
                             <div class="ln_solid"></div>
                             
                    <input type='button' name="next" class="next action-button" value="Suivant" style='margin-right:10px;'/>
                    
                    </fieldset>
                    <fieldset>
                    <div id="" style='padding:10px;'>
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
                        
                                <div id="social_network" style="padding: 10px;">
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
                         <input type='button' name="next" class="next action-button" value="Suivant" /> <input type='button' name="precedent" class="previous action-button-previous" value="précédent" />
                    </fieldset>
                    <fieldset>
                    <div id="" style="padding:5px;">
                                    <p class="lead">{{__('Opening hours')}}</p>
                                    <div id="openinghour_list">
                                        @foreach(DAYS as $key => $day)
                                            <div class="row form-group openinghour_item">
                                                <div class="col-md-6">
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
                        
                               <div id="" style='padding:10px'>
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
                         <input type='button' name="next" class="next action-button" value="Suivant" /> <input type='button' name="previous" class="previous action-button-previous" value="Précedent" />
                    </fieldset>
                    <fieldset>
                    <div id="" style='padding:10px;'>
                                    <p class="lead">{{__('Media')}}</p>
                                    <div class="row">
                                        <div class="col-md-12">
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
                                        <div class="col-md-12">
                                            <input type="file" class="form-control" id="gallery" accept="image/*">
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
                                <input type='button' name="previous" class="previous action-button-previous" value="Précedent" />
                                <input type="submit" class="btn btn-danger mt-20" style='color:white; background-color:tomato;'>
                    </fieldset>

                </form>
            </div>
        </div>
@endsection


@push('scripts')
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="{{asset('admin/js/page_place_create.js')}}"  type="text/javascript"></script>
    <script src="{{asset('admin/js/page_post.js')}}"  type="text/javascript"></script>
    <script src="{{asset('js/multi-step-form.js')}}" type="text/javascript"></script>
@endpush