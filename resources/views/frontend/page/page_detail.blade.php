@extends('layouts.app')

@section('content')
    <main id="main" class="site-main">
        <div class="page-title page-title--small align-left">
            <div class="container">
                <div class="page-title__content">
                    <h1 class="page-title__name">{{$page->title}}</h1>
                </div>
            </div>
        </div><!-- .page-title -->
        <div class="site-content">
            <div class="container page-content">

                {!! $page->content !!}

            </div>
            
        </div><!-- .site-content -->
    </main><!-- .site-main -->
@stop