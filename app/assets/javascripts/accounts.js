$(document).ready(function(){
	
    
    $("#account-search").keyup(
    	//search
		
		debounceTwo(function(){
			searchTwo();
		}, 200)
    );//end keyup
});//end doc

function searchTwo(){
	var keyword = $('#account-search').val();  
	if(keyword == ""){
		keyword = "empty";
	}
	$.ajax({
	    type : 'get',
	    url : "/accounts/"+keyword+"/search",    
	    dataType : 'script',
	    async : true,
	    success : function(data) {
	    	 
	    }//end function
	});//end ajax
}//end function

function debounceTwo(func, wait, immediate) {
	var timeout;
	return function() {
		var context = this, args = arguments;
		var later = function() {
			timeout = null;
			if (!immediate) func.apply(context, args);
		};
		var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
		if (callNow) func.apply(context, args);
	};
};


function saveAccountInformation(elem){
	
	elem.disabled = true;
	var index = $(elem).closest("tr").index();
	index = index + 1; 

	var table = document.getElementById("accounts-table");
		
		var id = table.rows[index].cells[0].innerHTML;
		var name = table.rows[index].cells[3].children[0].value; 
			
		$.ajax({
		    type : 'PUT',
		    url : "/accounts/"+id, 
		    data : {account: {name: name}},    
		    dataType : 'script',
		    async : true,
		    success : function(data) {
		    	 elem.disabled = false;
		    }//end function
		});//end ajax
}
