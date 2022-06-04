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
        , function(){} ).set('labels', {ok:ok, cancel:cancel});

	})
}

