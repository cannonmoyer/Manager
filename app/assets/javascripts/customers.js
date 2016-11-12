$(document).ready(function(){
    $("#form_correct").submit(function(){
    	$("#action").prop('disabled', true);
    	}
    );//end click

    $("#customer-search").keyup(
    	//search
		debounce(function(){
			customerSearch();
		}, 200)
    );//end keyup

});//end doc

$(document).ready(function(){
    $("#form_correctTwo").submit(function(){
    	$("#actionTwo").prop('disabled', true);
    	}
    );//end click
});//end doc





function customerSearch(){
	var keyword = $('#customer-search').val();  
	if(keyword == ""){
		keyword = "empty";
	}
	$.ajax({
	    type : 'get',
	    url : "/customers/"+keyword+"/search",    
	    dataType : 'script',
	    async : true,
	    success : function(data) {
	    	 
	    }//end function
	});//end ajax
}//end function

function debounce(func, wait, immediate) {
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


