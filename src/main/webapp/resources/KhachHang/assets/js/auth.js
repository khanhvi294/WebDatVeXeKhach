
function checkInputRegister() {
	let check = true;

	$("#username").bind("change", function() {
		console.log($(this).val())
		let username = $(this).val();
		let regexUsername = new RegExp(/^[\s0-9a-zA-Z_]+$/);
		
		if (!regexUsername.test(username) || username.length < 3 || username.length > 17) {
			check = false;
			$("#username-error").text("Username giới hạn trong khoảng 3-17 ký tự, và không được có ký tự đặc biệt.");
			
			return false;
		} else {
			$("#username-error").text("");
		}


	});

	$("#btn-dangki").click(function(e) {
		e.preventDefault();

		if (check) {
			$("#form-dangki").submit();
		}
	})
}

$(document).ready(function() {
	

})