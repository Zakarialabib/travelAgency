$(document).ready(function(){
    var i = handleExistingDetails()
    calc();

    $("#delete-file").click(function(event) {
        event.preventDefault();
        handleDocumentDelete();
    });
    
    $("#add_row").click(function(){b=i-1;
      	$('#addr'+i).html($('#addr'+b).html()).find('td:first-child').html(i+1);
        
        handleAddRow(i);
      	
        $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
      	i++; 
  	});

    $("#delete_row").click(function(){
    	if(i>1){
		$("#addr"+(i-1)).html('');
		i--;
		}
		calc();
	});
	
	$('#tab_logic tbody').on('keyup change',function(){
		calc();
	});

	$('#tax').on('keyup change',function(){
		calc_total();
	});

    $('#paid_amount').on('keyup change', function(){
        calc_total();
    });
	

});

function handleExistingDetails() {
    var itemsNumber = $('#tab_logic').data('items-number');
    for(var i = 0; i < itemsNumber; i++) {
        setElementInputsId($('#addr'+i), i);
        setNameInputReadOnly(i);
        setInputMenuDisplay(i);
    }
    
    return itemsNumber;
}

function setInputMenuDisplay(inputNumber) {
    $('#name-'+inputNumber).on('keyup', function(){
        $(this).parent().children('.place-suggestion').css("display", "block");
        setPlacesList($(this), extractId($(this).attr("id")));
    });
}

function handleAddRow(number) {
    setElementInputsId($('#addr'+number), number);
    setNameInputReadOnly(number);
    clearElementInputsValue($('#addr'+number));
    $('#name-'+number).on('keyup', function(){
        $(this).parent().children('.place-suggestion').css("display", "block");
        setPlacesList($(this), extractId($(this).attr("id")));
    });
}

function extractId(id) {
    // id need to be like this string-id
    var res = id.split('-');
    return res[1];
}

function setPlacesList(element, id) {
    $.ajax({
        url: `/ajax-search-places`,
        data: {
            'keyword': $(element).val()
        },
        beforeSend: function () {
        },
        success: function (data) {
            $('#place-suggestion-'+id).html(data);
            $('#place-suggestion-'+id).children('ul').find('li').each(function(){
                $(this).one("click", function(){
                    $('#place-suggestion-'+id).css("display", "none");
                    $('#place-'+id).attr("value", $(this).data("id"));
                    $('#name-'+id).attr("value", $(this).data("name"));
                    $('#name-'+id).val($(this).data("name"));
                    $('#qty-'+id).attr("value", "1");
                    $('#price-'+id).attr("value", $(this).data("price"));
                    calc();
                });
            });

        },
        error: function (e) {
            console.log(e);
        }
    });
}

function setElementInputsId(element, number) 
{
    var inputs = element.find(':input');
    inputs.each(function(){
        if($(this).attr("name") === 'place[]')
            $(this).attr("id", "place-"+number);

        if($(this).attr("name") === 'name[]') {
            $(this).attr("id", "name-"+number);
            $(this).attr("readonly", false); 
        }

        if($(this).attr("name") === 'qty[]')
            $(this).attr("id", "qty-"+number);
        
        if($(this).attr("name") === 'price[]')
            $(this).attr("id", "price-"+number);
    });

    var placeSuggestion = element.find('.place-suggestion');
    $(placeSuggestion[0]).attr("id", "place-suggestion-"+number);
}

function setNameInputReadOnly(number) {
    $('#name-'+number).attr("readonly", false);
}

function clearElementInputsValue(element)
{
    var inputs = element.find(':input');
    inputs.each(function() {
        $(this).attr('value', null);
    });
}

function handleDocumentDelete() {
    var returnId = $('#update-form').data('return');

    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this document",
        icon: "warning",
        buttons: true,
        dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
                $.ajax({
                    url: `/return/ajax-delete-file`,
                    data: {
                        'return': returnId
                    },
                    beforeSend: function () {
                    },
                    success: function (data) {
                        if(data.status === true) {
                            $('#document').data('document', '0');
                            $('#document-yes').css('display', 'none');
                            $('#document-no').css('display', 'block');
                            swal("Document has been deleted!", {
                                icon: "success",
                            });
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        });
}

function calc()
{
	$('#tab_logic tbody tr').each(function(i, element) {
		var html = $(this).html();
		if(html!='')
		{
			var qty = $(this).find('.qty').val();
			var prix = $(this).find('.price').val();
			$(this).find('.total').val(qty*prix);
			
			calc_total();
		}
    });
}

function calc_total()
{
	total=0;
	$('.total').each(function() {
        total += parseInt($(this).val());
    });
	$('#sub_total').val(total.toFixed(2));
	tax_sum=total/100*$('#tax').val();
	$('#tax_amount').val(tax_sum.toFixed(2));
	$('#total_amount').val((tax_sum+total).toFixed(2));
	$('#amount_topay').val((tax_sum+total).toFixed(2));
    if(parseInt($('#paid_amount').val()) > 0)
	    $('#change').val((tax_sum+total) - parseInt($('#paid_amount').val()).toFixed(2));
}