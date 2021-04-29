<!-- STYLES -->
<link rel="apple-touch-icon" href="{{asset('images/favicon-apple.png')}}">
<link rel="shortcut icon" type="image/x-icon" href="{{asset('images/favicon.png')}}">
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/line-awesome@1.3.0/dist/line-awesome/css/line-awesome.min.css" rel="stylesheet" media="screen">
<link href="{{asset('frontend/assets/css/all.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/photoswipe@4.1.3/dist/photoswipe.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/photoswipe@4.1.3/dist/default-skin/default-skin.css"/>
<link href="https://cdn.jsdelivr.net/npm/chosen-jquery@0.1.1/lib/chosen.min.css" rel="stylesheet" type="text/css"/>
<!-- LIGHT -->
<link rel="stylesheet" type="text/css" href="{{asset('frontend/assets/plugins/ion.rangeSlider-2.2.0/css/normalize.css')}}"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/ion-rangeslider@2.3.1/css/ion.rangeSlider.min.css"/>
<link rel="stylesheet" type="text/css" href="{{asset('frontend/assets/plugins/ion.rangeSlider-2.2.0/css/ion.rangeSlider.skinHTML5.css')}}"/>
<link  rel="stylesheet" type="text/css" href="{{asset('/admin/vendors/select2/select2.min.css')}}">
<!-- FONTS -->
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap">
<meta name="csrf-token" content="{{ csrf_token() }}">
<script async>
    var app_url = window.location.origin;
</script>

<script defer>
{{setting('google_js_key')}}
</script>

<script defer>
{{setting('facebook_js_key')}}
</script>
