$(document).on("page:change", function(){
	$('#customers').dataTable({
		"processing": true,
		"retrieve": true,
		"serverSide": true,
		"ajax": $('#customers').data('source'),
		//"sPaginationType": "full_numbers"
		"pagingType": "full",
		//"paging": false
	})

});

$(document).ready(function(){
    $("#form_correct").submit(function(){
    	$("#action").prop('disabled', true);
    	}
    );//end click
});//end doc

