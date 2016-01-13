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