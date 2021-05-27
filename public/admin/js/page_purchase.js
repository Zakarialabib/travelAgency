$(function() {

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
                text: "Changement de status reussie!",
                icon: "warning",
                buttons: false,
                dangerMode: true,
              })
         }
    });
  });

  
});
