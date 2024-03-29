var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');


(function ($) {
    'use strict';

       // $(".lfm").filemanager('image');

       $(document).on('click', function () {
        $(".lfm").filemanager('image')
    })

    $(document).ready(function() {
        $('.myselect').select2({
            theme: 'bootstrap4',
        });
    });
    
    $(function() {
        $('[data-toggle="popover"]').popover();
    });
    
    
    $('.colorpicker').colorpicker({});
    

    $(document).ready(function () {

        $('.col-5-datatable').DataTable({
            language: {
                url: '/admin/vendors/datatables.net/js/french.json'
            },
            dom: 'Bfrtip',
            responsive: true,
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            order: [0, "desc"],
            buttons: [
                {
                    extend: 'pdf',
                    text: '<i class="la la-file-export" data-toggle="popover" data-content="Enregistrer la liste en PDF." data-trigger="hover" data-original-title="PDF" />',
                    footer:true,
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    },
                },
                {
                    extend: 'excel',
                    text: '<i class="la la-file-excel" data-toggle="popover" data-content="Enregistrer la liste sur Excel." data-trigger="hover" data-original-title="Excel" />',
                    footer:true,
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    },
                },
                {
                    extend: 'print',
                    text: '<i class="la la-print" data-toggle="popover" data-content="Imprimer la liste sur papier." data-trigger="hover" data-original-title="Print" />',
                    footer:true,
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    },
                },
            ],

        });

        $('.col-4-datatable').DataTable({
            language: {
                url: '/admin/vendors/datatables.net/js/french.json'
            },
            dom: 'Bfrtip',
            responsive: true,
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            order: [0, "desc"],
            buttons: [
                {
                    extend: 'pdf',
                    text: '<i class="la la-file-export" data-toggle="popover" data-content="Enregistrer la liste en PDF." data-trigger="hover" data-original-title="PDF" />',
                    footer:true,
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4]
                    },
                },
                {
                    extend: 'excel',
                    text: '<i class="la la-file-excel" data-toggle="popover" data-content="Enregistrer la liste sur Excel." data-trigger="hover" data-original-title="Excel" />',
                    footer:true,
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4]
                    },
                },
                {
                    extend: 'print',
                    text: '<i class="la la-print" data-toggle="popover" data-content="Imprimer la liste sur papier." data-trigger="hover" data-original-title="Print" />',
                    footer:true,
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4]
                    },
                },
            ],

        });

        $('.right_col').css('min-height', 'auto');

      
    });

 

})(jQuery);


function getUrlAPI(slug, type = "api") {
    const base_url = window.location.origin;
    if (type === "full")
        return slug;
    else
        return base_url + "/" + type + slug;
}

function callAPI(data) {
    try {
        let method = data.method || "GET";
        let header = data.header || {'Accept': 'application/json', 'Content-Type': 'application/json'};
        let body = JSON.stringify(data.body);

        return fetch(data.url, {
            'method': method,
            'headers': header,
            'body': body
        }).then(res => {
            return res.json();
        }).then(response => {
            return response;
        })

    } catch (e) {
        console.log(e);
    }
}

function toSlug(text) {
    var slug;

    //Đổi chữ hoa thành chữ thường
    slug = text.toLowerCase();

    //Đổi ký tự có dấu thành không dấu
    slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
    slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
    slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
    slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
    slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
    slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
    slug = slug.replace(/đ/gi, 'd');
    //Xóa các ký tự đặt biệt
    slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
    //Đổi khoảng trắng thành ký tự gạch ngang
    slug = slug.replace(/ /gi, "-");
    //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
    //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
    slug = slug.replace(/\-\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-/gi, '-');
    slug = slug.replace(/\-\-/gi, '-');
    //Xóa các ký tự gạch ngang ở đầu và cuối
    slug = '@' + slug + '@';
    slug = slug.replace(/\@\-|\-\@|\@/gi, '');

    //In slug ra textbox có id “slug”
    // document.getElementById('slug').value = slug;

    return slug;
}

function previewUploadImage(input, element_id) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $(`#${element_id}`).attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
// $('#ckeditor').each(function () {
//     //CKEDITOR.replace( 'ckeditor');
//     CKEDITOR.replace( 'ckeditor',{
//         filebrowserUploadUrl: "{{route('uploadImages', ['_token' => csrf_token() ])}}",
//         filebrowserUploadMethod: 'form'
//     });
// });

    $( 'textarea').each( function() {

    CKEDITOR.replace( $(this).attr('id') ,{
        filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
        filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token={{csrf_token()}}',
        filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
        filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token={{csrf_token()}}'
    });
        

    });

$('#seo_title').keyup(function() {    
    var characterCount = $(this).val().length,
        current_count = $('#current_count'),
        maximum_count = $('#maximum_count'),
        count = $('#count');    
        current_count.text(characterCount);        
});

$('#seo_description').keyup(function() {    
    var characterCount = $(this).val().length,
        count_current = $('#count_current'),
        count_maximum = $('#count_maximum'),
        counter = $('#counter');    
        count_current.text(characterCount);        
});





function notify(noti_content, noti_type = 'success',) {
    /**
     * Type: success, info, danger
     */
    new PNotify({
        title: 'Notify!',
        text: noti_content,
        type: noti_type,
        styling: 'bootstrap3',
        delay: 3000
    });
}
