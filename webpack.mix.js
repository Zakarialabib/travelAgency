let mix = require('laravel-mix');
/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.styles([
   'public/frontend/assets/css/bootstrap.min.css',
   'public/frontend/assets/css/style.css',
   'public/frontend/assets/css/styler.css',
   'public/frontend/assets/css/materialize.css',
   'public/frontend/assets/css/responsive.css',
   'public/frontend/assets/css/animate.min.css',
   'public/frontend/assets/css/owl.carousel.css',
   'public/frontend/assets/css/owl-carousel-theme.css',
   'public/frontend/assets/css/flexslider.css',
   'public/frontend/assets/css/toastr.min.css',
   'public/frontend/assets/css/bootstrap-select.min.css',
], 'public/frontend/assets/css/all.css');
 

mix.scripts([  
   'public/frontend/assets/js/bootstrap.min.js',
   'public/frontend/assets/js/jquery-ui.min.js',
   'public/frontend/assets/js/bootstrap-select.min.js',
   'public/frontend/assets/js/loadingoverlay.js',
   'public/frontend/assets/plugins/wow.min.js',
   'public/frontend/assets/js/jquery-ui.min.js',
   'public/frontend/assets/js/respond.js',
   'public/frontend/assets/js/alertify.js',
   'public/frontend/assets/js/axios.min.js',
   'public/frontend/assets/js/custom.js',
   'public/frontend/assets/js/main.js', 
   'public/frontend/assets/js/materialize.js',
   'public/frontend/assets/js/toastr.min.js',
   'public/frontend/assets/js/bootbox.min.js',
   'public/frontend/assets/js/owl.carousel.min.js',
   'public/backend/app-assets/vendors/js/extensions/sweetalert.min.js', 
], 'public/frontend/assets/js/all.js');

mix.js('resources/assets/js/app.js', 'public/js')
   .sass('resources/assets/sass/app.scss', 'public/css');


