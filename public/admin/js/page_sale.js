(function ($) {
    'use strict';

$(document).on("change", ".toggle-class", function () {
    let is_locked = $(this).prop('checked') == true ? 1 : 0 ;
    let sale_id = $(this).data('id');

    $.ajax({
        type : "get",
        dataType : "json",
        url : 'sales/status',
        data : { 'is_locked' : is_locked, 'sale_id' : sale_id },
        success : function(data){
            swal({
                title: "ACTIVATED",
                text: "YOUR INPUT IS NOW DEATIVATED!",
                icon: "warning",
                buttons: false,
                dangerMode: true,
              })
         }
    });
})


$(document).on("change", ".toggle-class", function () {
    let is_locked = $(this).prop('checked') == true ? 1 : 0 ;
    let purchase_id = $(this).data('id');

    $.ajax({
        type : "get",
        dataType : "json",
        url : 'purchases/status',
        data : { 'is_locked' : is_locked, 'purchase_id' : purchase_id },
        success : function(data){
            swal({
                title: "ACTIVATED",
                text: "YOUR INPUT IS NOW DEATIVATED!",
                icon: "warning",
                buttons: false,
                dangerMode: true,
              })
         }
    });
})

})(jQuery);