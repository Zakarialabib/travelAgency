(function ($) {
    'use strict';

    $(document).on("click", ".offer_delete", function () {
        swal({
            title: "Êtes-vous sûr?",
            text: "La destination supprimé ne peut pas restaurer!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) {
              $(this).parent().submit();
            } 
          });
    });
  
    // itinerary event
    $('#itinerary_addmore').click(function () {
        let itinerary_list = $('#itinerary_list');
        let itinerary_item = $('.itinerary_item').length;
        itinerary_list.append(`
            <div class="row form-group itinerary_item" id="itinerary_item_${itinerary_item}">
                <div class="col-md-11">
                    <div class="form-group">
                        <input type="text" class="form-control" name="itinerary[${itinerary_item}][title]" value="" placeholder="Titre">
                    </div>
                    <div class="form-group">
                        <textarea type="text" class="form-control tinymce_editor" name="itinerary[${itinerary_item}][description]" placeholder="Description"></textarea>
                    </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-danger itinerary_item_remove" id="${itinerary_item}">X</button>
                </div>
            </div>
        `);
    });


    $(document).on("click", ".itinerary_item_remove", function (event) {
        let id = event.currentTarget.getAttribute('id');
        $(`#itinerary_item_${id}`).remove();
    });


$('#gallery').change(function () {
    var form_data = new FormData();
    form_data.append('image', this.files[0]);
    form_data.append('_token', CSRF_TOKEN);
    $.ajax({
        url: getUrlAPI('/upload-image', 'api'),
        data: form_data,
        type: 'POST',
        contentType: false,
        processData: false,
        success: function (res) {
            if (res.fail) {
                alert(res.errors['image']);
            } else {
                if (res.code === 200) {
                    let html = `
                                <div class="col-sm-2 media-thumb-wrap">
                                    <figure class="media-thumb">
                                        <img src="/uploads/${res.file_name}">
                                        <div class="media-item-actions">
                                            <a class="icon icon-delete" data-filename="${res.file_name}" href="#">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="16" viewBox="0 0 15 16">
                                                    <g fill="#5D5D5D" fill-rule="nonzero">
                                                        <path d="M14.964 2.32h-4.036V0H4.105v2.32H.07v1.387h1.37l.924 12.25H12.67l.925-12.25h1.369V2.319zm-9.471-.933H9.54v.932H5.493v-.932zm5.89 13.183H3.65L2.83 3.707h9.374l-.82 10.863z"></path>
                                                        <path d="M6.961 6.076h1.11v6.126h-1.11zM4.834 6.076h1.11v6.126h-1.11zM9.089 6.076h1.11v6.126h-1.11z"></path>
                                                    </g>
                                                </svg>
                                            </a>
                                            <input type="hidden" name="gallery[]" value="${res.file_name}">
                                            <span class="icon icon-loader" style="display: none;"><i class="fa fa-spinner fa-spin"></i></span>
                                        </div>
                                    </figure>
                                </div>
                            `;
                    $('#offer_gallery_thumbs').append(html);
                }
            }
        },
        error: function (xhr, status, error) {
            alert('An error occurred!');
            console.log(xhr.responseText);
        }
    });
});

    $(document).on("click", ".icon-delete", function (event) {
        event.preventDefault();
        let thumbnail = $(this).closest('.media-thumb-wrap');
        thumbnail.remove();
    });

    $(function () {
        $("#offer_gallery_thumbs").sortable().disableSelection();
    });

        
    $('#page_thumb').change(function () {
        previewUploadImage(this, 'preview_thumb')
    });

})(jQuery);