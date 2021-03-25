<div class="modal fade" id="modal_add_city" tabindex="-1" role="dialog" aria-labelledby="modal_add_city" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="padding: 60px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{{__('Add city')}}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>

              <form action="{{Request::fullUrl()}}" method="post" enctype="multipart/form-data" data-parsley-validate>
                <input type="hidden" id="add_city_method" name="_method" value="POST">
                @csrf

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 city_create">

                            <ul class="nav nav-tabs bar_tabs" role="tablist">
                                @foreach($languages as $index => $language)
                                    <li class="nav-item">
                                        <a class="nav-link {{$index !== 0 ?: "active"}}" id="home-tab" data-toggle="tab" href="#language_{{$language->code}}" role="tab" aria-controls="" aria-selected="">{{$language->name}}</a>
                                    </li>
                                @endforeach
                            </ul>

                            <div class="form-group">
                                <label for="password">{{__('Country')}}: *</label>
                                <select class="form-control" id="country_id" name="country_id" required>
                                    @foreach($countries as $country)
                                        <option value="{{$country->id}}">{{$country->name}}</option>
                                    @endforeach
                                </select>
                            </div>

                        <div class="tab-content">
                                @foreach($languages as $index => $language)
                                    <div class="tab-pane fade show {{$index !== 0 ?: "active"}}" id="language_{{$language->code}}" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="form-group">
                                            <label for="city_name">{{__('City name')}}
                                                <small>({{$language->code}})</small>
                                                : *</label>
                                            <input type="text" class="form-control" name="{{$language->code}}[name]" {{$index !== 0 ?: "required"}}>
                                        </div>
                                        <div class="form-group">
                                            <label for="city_intro">{{__('Intro')}}
                                                <small>({{$language->code}})</small>
                                                :</label>
                                            <input type="text" class="form-control" name="{{$language->code}}[intro]">
                                        </div>
                                        <div class="form-group">
                                            <label for="city_description">{{__('Description')}}
                                                <small>({{$language->code}})</small>
                                                :</label>
                                            <textarea class="form-control" name="{{$language->code}}[description]" rows="5"></textarea>
                                        </div>
                                    </div>
                                @endforeach
                            </div>

                            {{--<div class="form-group">--}}
                            {{--<label for="city_name">{{__('City Name')}}: *</label>--}}
                            {{--<input type="text" class="form-control" id="city_name" name="name" required>--}}
                            {{--</div>--}}

                            {{--<div class="form-group">--}}
                            {{--<label for="city_slug">Slug: *</label>--}}
                            {{--<input type="text" class="form-control" id="city_slug" name="slug" required>--}}
                            {{--</div>--}}

                            <div class="row city_image">
                                <div class="col-md-4">
                                    <p><strong>{{__('Thumbnail image')}}:</strong></p>
                                    <img id="preview_thumb" src="https://via.placeholder.com/120x150?text=thumbnail" alt="city thumb">
                                    <input type="file" class="form-control" id="city_thumb" name="thumb" accept="image/*">
                                </div>
                                <div class="col-md-8">
                                    <p><strong>{{__('Banner image')}}:</strong></p>
                                    <img id="preview_banner" src="https://via.placeholder.com/300x150?text=banner" alt="city banner">
                                    <input type="file" class="form-control" id="city_banner" name="banner" accept="image/*">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="city_time_to_visit">{{__('Time to visit')}}:</label>
                                <input type="text" class="form-control" id="city_time_to_visit" name="best_time_to_visit">
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="city_currency">{{__('Currency')}}:</label>
                                    <input type="text" class="form-control" id="city_currency" name="currency">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="city_language">{{__('Language')}}:</label>
                                    <input type="text" class="form-control" id="city_language" name="language">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label for="city_currency">{{__('Location')}}:</label>
                                    <input type="hidden" class="form-control" id="city_lat" name="lat">
                                    <input type="hidden" class="form-control" id="city_lng" name="lng">
                                    <input type="text" id="pac-input" class="form-control" name="address" placeholder="{{__('Search city location...')}}" required>
                                    <div id="map"></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="seo_title">{{__('SEO title')}} - <small>{{__('60 characters or less')}}</small> :</label>
                                        <input type="text" class="form-control" id="seo_title" name="seo_title">
                                    <div id="count">
                                          <span id="current_count">0</span>
                                           <span id="maximum_count">/ 60</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="seo_description">{{__('Meta Description')}} - <small>{{__('160 characters or less')}}</small> :</label>
                                        <textarea class="form-control" id="seo_description" name="seo_description"></textarea>
                                     <div id="counter">
                                          <span id="count_current">0</span>
                                           <span id="count_maximum">/ 160</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                <div class="modal-footer">
                    <input type="hidden" id="city_id" name="city_id" value="">
                    <button class="btn btn-primary" id="submit_add_city">{{__('Add')}}</button>
                    <button class="btn btn-primary" id="submit_edit_city">{{__('Save')}}</button>
                    <button class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
                </div>

            </form>

        </div>
    </div>
</div>