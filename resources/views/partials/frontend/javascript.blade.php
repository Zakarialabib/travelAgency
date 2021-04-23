<script src="{{asset('frontend/assets/js/jquery.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
<script src="{{asset('frontend/assets/plugins/wow.min.js')}}"></script>
<script type="text/javascript" src="{{asset('frontend/assets/plugins/supersized.3.1.3.min.js')}}"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/ion-rangeslider@2.3.1/js/ion.rangeSlider.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-zoom@1.7.21/jquery.zoom.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photoswipe@4.1.3/dist/photoswipe.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photoswipe@4.1.3/dist/photoswipe-ui-default.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key={{setting('goolge_map_api_key', 'AIzaSyD-2mhVoLX7oIOgRQ-6bxlJt4TF5k0xhWc')}}&libraries=places&language={{\Illuminate\Support\Facades\App::getLocale()}}"></script>
<script src="https://cdn.jsdelivr.net/npm/chosen-jquery@0.1.1/lib/chosen.jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript"  src="{{asset('frontend/assets/js/all.js')}}"></script>
<script type="text/javascript"  src="{{asset('admin/vendors/select2/select2.full.min.js')}}"></script>
<script>
  window.watsonAssistantChatOptions = {
      integrationID: "a7f1d074-995a-4687-9781-ed9cc54b966a", 
      region: "us-south", 
      serviceInstanceID: "d6e1e8ba-1e36-4ae7-b73f-4e9c34c4f666", 
      onLoad: function(instance) { instance.render(); }
    };
  setTimeout(function(){
    const t=document.createElement('script');
    t.src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js";
    document.head.appendChild(t);
  });
  </script>
@stack('scripts')
