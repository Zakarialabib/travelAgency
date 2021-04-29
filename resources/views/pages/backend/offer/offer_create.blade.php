@extends('layouts.backend')

@section('content')
<div class="page-title">
    <div class="title_left">
        <h3>{{ __('Add Offer') }}</h3>
    </div>
</div>
<div class="clearfix"></div>

<div class="col-12 col-lg-12 offer_create">
    <form action="{{ route('offer_store') }}" enctype="multipart/form-data" method="post">
        @csrf
        <div class="">
            <ul class="nav nav-tabs bar_tabs" role="tablist">
                @foreach($languages as $index => $language)
                    <li class="nav-item">
                        <a class="nav-link {{ $index !== 0 ?: "active" }}"
                            id="home-tab" data-toggle="tab" href="#language_{{ $language->code }}" role="tab"
                            aria-controls="" aria-selected="">{{ $language->name }}</a>
                    </li>
                @endforeach
            </ul>

            <div class="form-group row">
                <div class="col-md-12">
                    <div class="tab-content">
                        @foreach($languages as $index => $language)
                            <div class="tab-pane fade show {{ $index !== 0 ?: "active" }}"
                                id="language_{{ $language->code }}" role="tabpanel" aria-labelledby="home-tab">
                                <div class="form-group">
                                    <label for="offer_name">{{ __('Offer name') }}
                                        <small>({{ $language->code }})</small> : *</label>
                                    <input type="text" class="form-control" name="{{ $language->code }}[name]"
                                        required
                                        placeholder="{{ __('What the name of offer') }}"
                                        autocomplete="off"
                                        {{ $index !== 0 ?: "required" }}>
                                </div>

                                <div class="form-group">
                                    <label for="offer_description">Description
                                        <small>({{ $language->code }})</small>
                                        : *</label>
                                    <textarea type="text" class="form-control tinymce_editor" id="offer_description"
                                        required name="{{ $language->code }}[description]" rows="6"
                                        {{ $index !== 0 ?: "required" }}></textarea>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="form-group">
                {{ Form::label('price', 'Price') }}
                {{ Form::text('price', null, array('class' => 'form-control')) }}
            </div>
            <div class="form-group">
                <p class="lead">{{ __('itinerary') }}</p>
                <div id="itinerary_list">
                    <div class="row form-group itinerary_item" id="itinerary_item_0">
                        <div class="col-md-11">
                            <div class="form-group">
                                <input type="text" class="form-control" name="itinerary[0][question]"
                                    placeholder="{{ __('Enter Day') }}">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control tinymce_editor" name="itinerary[0][answer]"
                                    rows="3" placeholder="Enter Description">
                            </div>
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="btn btn-danger itinerary_item_remove" id="0">X</button>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-round btn-primary"
                    id="itinerary_addmore">+{{ __('Add more') }}</button>
            </div>

            <div class="form-group">
                <p class="lead">{{ __('Media') }}</p>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>{{ __('Thumbnail image') }}:</strong></p>
                        <img id="preview_thumb" src="https://via.placeholder.com/120x150?text=thumbnail">
                        <input type="file" class="form-control" id="thumb" name="thumb" accept="image/*">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 gallery">
                        <p><strong>{{ __('Gallery images') }}:</strong></p>
                        <div id="offer_gallery_thumbs"></div>
                    </div>
                    <div class="col-md-6">
                        <input type="file" class="form-control" id="gallery" accept="image/*">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="offer_address">{{ __('Offer Address') }}: *</label>
                <input type="text" class="form-control" id="offer_address" name="address" value="Maroc"
                    placeholder="{{ __('Offer Address') }}" autocomplete="off">
            </div>
            <div id="map"></div>
            <div id="golo_seo">
                <p class="lead">{{ __('SEO') }}</p>
                <div class="form-group">
                    <label for="seo_title">{{ __('SEO title') }} -
                        <small>{{ __('60 characters or less') }}</small>:</label>
                    <input type="text" class="form-control" id="seo_title" name="seo_title">
                    <div id="count">
                        <span id="current_count">0</span>
                        <span id="maximum_count">/ 60</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="seo_description">{{ __('Meta Description') }} -
                        <small>{{ __('160 characters or less') }}</small>:</label>
                    <textarea class="form-control" id="seo_description" name="seo_description"></textarea>
                    <div id="counter">
                        <span id="count_current">0</span>
                        <span id="count_maximum">/ 160</span>
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-20">{{ __('Submit') }}</button>
    </form>
</div>
@endsection

@push('scripts')
    <script src="{{ asset('admin/js/page_place_create.js') }}"></script>
@endpush