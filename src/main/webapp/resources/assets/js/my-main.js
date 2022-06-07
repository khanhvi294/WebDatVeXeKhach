/**
 * 
 */

function showModalConfirm(idButton, title, ok, cancel){
	$(idButton).on("click", function(e){
		e.preventDefault();
		alertify.confirm(title, '', function(){
			$(idButton).unbind("click")
			$(idButton)[0].click()
		}

        , function(){} ).set('labels', {ok:ok, cancel: cancel});


	})
}

function activeSidebarItem(){
	$(".nav-item").each(function() {
		 if($(location).attr("pathname").includes($(this).attr("id"))){
			 $(this).find(".nav-link").removeClass("collapsed");
		 }
	 })
}

$(document).ready(function () {
	activeSidebarItem();
})