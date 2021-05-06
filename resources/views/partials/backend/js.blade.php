<!-- BEGIN VENDOR JS-->
<script src="{{asset('admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js')}}"  type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/vendors.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/core/libraries/jquery_ui/jquery-ui.min.js')}}" type="text/javascript"></script>
<script src="{{asset('admin/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js')}}" type="text/javascript"></script>
<script src="{{asset('/admin/vendors/DateJS/build/date.js')}}" type="text/javascript"></script>
<script src="{{asset('/admin/vendors/laravel-filemanager/js/stand-alone-button.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/charts/raphael-min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/scripts/extensions/toastr.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/js/switchery.min.js')}}" type="text/javascript"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chosen-jquery@0.1.1/lib/chosen.jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/dropzone@5.7.6/dist/dropzone.min.js"></script>
<!--dataTables-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/r-2.2.7/sl-1.3.3/datatables.min.js" async></script>
<!-- FastClick 
<script src="https://cdn.jsdelivr.net/npm/fastclick@1.0.6/lib/fastclick.min.js"></script>-->
<!-- NProgress -->
<script src="{{asset('/admin/vendors/nprogress/nprogress.js')}}"  type="text/javascript"></script>
<!-- Chart.js -->
<script src="{{asset('/admin/vendors/Chart.js/dist/Chart.min.js')}}"  type="text/javascript" defer></script>
<!-- gauge.js -->
<script src="{{asset('/admin/vendors/gauge.js/dist/gauge.min.js')}}" type="text/javascript" defer></script>
<!-- bootstrap-progressbar -->
<script src="{{asset('/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js')}}" type="text/javascript" defer></script>
<!-- iCheck -->
<script src="{{asset('/admin/vendors/iCheck/icheck.min.js')}}" type="text/javascript" defer></script>
<!-- JQVMap -->
<script src="{{asset('/admin/vendors/jqvmap/dist/jquery.vmap.js')}}" type="text/javascript" defer></script>
<script src="{{asset('/admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js')}}" type="text/javascript" defer></script>
<script src="{{asset('/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js')}}" type="text/javascript" defer></script>
<script src="{{asset('/admin/vendors/morris.js/morris.min.js')}}" type="text/javascript" defer></script>
<!-- Custom Theme Scripts -->
<script src="{{asset('/admin/build/js/custom.min.js')}}" type="text/javascript"></script>
<script src="{{asset('/admin/js/commons.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/core/core.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/core/app-menu.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/core/app.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/scripts/customizer.min.js')}}" type="text/javascript"></script>

<!-- BEGIN TOOLS FROM FRONTEND-->
<script src="{{asset('frontend/assets/js/axios.min.js')}}" type="text/javascript"></script>
<script src="{{asset('frontend/assets/js/iziModal.js')}}" type="text/javascript"></script>
<script src="{{asset('frontend/assets/js/iziToast.js')}}" type="text/javascript"></script>
<script src="{{asset('frontend/assets/js/materialize.js')}}" type="text/javascript"></script>
<script src="{{asset('frontend/assets/js/bootstrap3-typeahead.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/js/required.js')}}" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js" type="text/javascript"></script>
<!-- END TOOLS FROM FRONTEND-->
@stack('scripts')

@if (session('error'))
    <script>
        notify("{{ session('error') }}", "error");
    </script>
@endif
@if (session('success'))
    <script>
        notify("{{ session('success') }}");
    </script>
@endif

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-2mhVoLX7oIOgRQ-6bxlJt4TF5k0xhWc&libraries=places&callback=placeMap"></script>
