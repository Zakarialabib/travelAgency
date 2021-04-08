<script src="{{asset('backend/app-assets/vendors/js/vendors.min.js')}}" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- BEGIN PAGE VENDOR JS-->
<script src="{{asset('backend/app-assets/vendors/js/charts/raphael-min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/datatable/datatables.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/buttons.flash.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/jszip.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/pdfmake.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/vfs_fonts.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/buttons.html5.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/vendors/js/tables/buttons.print.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/scripts/tables/datatables/datatable-advanced.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/scripts/extensions/toastr.min.js')}}" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert@2.1.2/dist/sweetalert.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/dropzone@5.7.6/dist/dropzone.min.js" type="text/javascript"></script>
<script src="{{asset('backend/js/switchery.min.js')}}" type="text/javascript"></script>
<!-- FastClick -->
<script src="https://cdn.jsdelivr.net/npm/fastclick@1.0.6/lib/fastclick.min.js"></script>
<!-- NProgress -->
<script src="{{asset('/admin/vendors/nprogress/nprogress.js')}}"></script>
<!-- Chart.js -->
<script src="{{asset('/admin/vendors/Chart.js/dist/Chart.min.js')}}"></script>
<!-- gauge.js -->
<script src="{{asset('/admin/vendors/gauge.js/dist/gauge.min.js')}}"></script>
<!-- bootstrap-progressbar -->
<script src="{{asset('/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js')}}"></script>
<!-- iCheck -->
<script src="{{asset('/admin/vendors/iCheck/icheck.min.js')}}"></script>
<!-- JQVMap -->
<script src="{{asset('/admin/vendors/jqvmap/dist/jquery.vmap.js')}}"></script>
<script src="{{asset('/admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js')}}"></script>
<script src="{{asset('/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js')}}"></script>
<script src="{{asset('/admin/vendors/morris.js/morris.min.js')}}"></script>

{{--dataTables--}}
<script src="{{asset('/admin/vendors/datatables.net/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('/admin/vendors/datatables.net-bs/js/dataTables.bootstrap5.min.js')}}"></script>
<script src="{{asset('/admin/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=e8cgxme8kbsc3u65sf2y8iixj1z0mzqlejahfw9hp9yoi1to"></script>
<script src="https://cdn.jsdelivr.net/npm/chosen-jquery@0.1.1/lib/chosen.jquery.min.js"></script>
<script src="{{asset('admin/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js')}}"></script>
<script src="{{asset('/admin/vendors/DateJS/build/date.js')}}"></script>
<script src="{{asset('/admin/vendors/laravel-filemanager/js/stand-alone-button.js')}}"></script>

<!-- Custom Theme Scripts -->
<script src="{{asset('/admin/build/js/custom.min.js')}}"></script>
<script src="{{asset('/admin/js/commons.js?v=1.2')}}"></script>
<!-- END PAGE VENDOR JS-->

<!-- BEGIN MODERN JS-->
<script src="{{asset('backend/app-assets/js/core/core.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/core/app-menu.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/core/app.min.js')}}" type="text/javascript"></script>
<script src="{{asset('backend/app-assets/js/scripts/customizer.min.js')}}" type="text/javascript"></script>
<!-- END MODERN JS-->

<!-- BEGIN TOOLS FROM FRONTEND-->
<script src="{{asset('frontend/assets/js/axios.min.js')}}"></script>
<script src="{{asset('frontend/assets/js/iziModal.js')}}"></script>
<script src="{{asset('frontend/assets/js/iziToast.js')}}"></script>
<script src="{{asset('frontend/assets/js/materialize.js')}}"></script>
<script src="{{asset('frontend/assets/js/bootstrap3-typeahead.js')}}"></script>
<script src="{{asset('backend/js/required.js')}}"></script>
<script src="{{asset('admin/vendors/select2/select2.full.min.js')}}"></script>

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
