
@extends('layouts.backend')

@section('page-title') {{__('Settings')}} @endsection

@section('content')

    @include('partials.backend.flash')
    <div class="container">
        <div class="row">
        <div class="col-md-6">
                    @include('pages.backend.settings.includes.general')
                </div>
                <div class="col-md-6">
                    @include('pages.backend.settings.includes.logo')
                </div>
                <div class="col-md-6">
                    @include('pages.backend.settings.includes.footer_seo')
                </div>
                <div class="col-md-6">
                    @include('pages.backend.settings.includes.social_links')
                </div>
                <div class="col-md-6">
                    @include('pages.backend.settings.includes.analytics')
                </div>
            </div>
        </div>
    </div>
    @endsection