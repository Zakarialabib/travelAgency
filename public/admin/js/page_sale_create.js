$('#js-validate-btn').click(function(event){
    event.preventDefault();
    $('input[name="is_locked"]').val(1);
    swal({
        title: "Accompli",
        text: "Vente Validée avec Succes",
        icon: "success",
    });
});

$( "#js-save" ).click(function(event) {
    event.preventDefault();
    if($('input[name="is_locked"]').val() == 0) {
        swal({
            title: "Alert",
            text: "Valider la vente pour enregistrer",
            icon: "error",
        });
    } else {
        $( "#form" ).submit();
    }
});

    $(document).ready(function(){
      $('#add_sale_details').click(function(){
        duplicateTableRow('sale_details');
      });
    
    
      $(document).on('click', '.delete-row', function(event){
        removeTableRow(event.target);
      });
    
 
    
    function duplicateTableRow(target) {
      let tr = $(`#${target}`).find('tr:last').clone();
      tr.find('input').val(' ');
      $(`#${target}`).append(tr);
    }
    
    function removeTableRow(element) {
      $(element).closest("tr").remove();;
    }
    $("#delete-row").click(function(){
    	if(i>1){
		$("#sale_details"+(i-1)).html('');
		i--;
		}
		calc();
	});

	$('#sale_details tbody').on('keyup change',function(){
		calc();
	});

    $('#tax').on('keyup change',function(){
		calc_total();
	});

    $('#paid_amount').on('keyup change', function(){
        calc_total();
    });

});

    function calc(){
        
	$('#sale_details tbody tr').each(function(i, element) {
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



