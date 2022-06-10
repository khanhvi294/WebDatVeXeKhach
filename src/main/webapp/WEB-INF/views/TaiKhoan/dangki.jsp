<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="../KhachHang/head.jsp"%>
<style> 
		

.wheel-register-log label {
	line-height: 30px;
}
</style>
<body class="">
	<!-- MAIN -->

	<%@include file="../KhachHang/navbar.jsp"%>
	<!-- /////////////////////////////////// -->
	<div class="wheel-register-block">
		<div class="container">
			<div class="row">
				<div class="col-md-7 padd-r0" style="margin-left: 300px">
					<div
						class="wheel-register-log marg-lg-t60 marg-lg-b150 marg-sm-t100 marg-sm-b100">
						<div class="wheel-header">
							<h5 style="margin-bottom: 15px;">Đăng kí</h5>
						</div>

						<form:form action="dangki.html" modelAttribute="khachhang"
							method="post" id="form-dangki">
							<label for="inputName5" class="form-label">Họ</label>
							<form:input path="hoKH" id="lastName" placeholder="Họ" />
							<p id="ho-error" class="text-er"></p>
							<form:errors class="text-er" path="hoKH"></form:errors>
							<label for="inputName5" class="form-label">Tên</label>
							<form:input path="tenKH" id="firstName" placeholder="Tên" />
							<form:errors class="text-er" path="tenKH"></form:errors>
							<p id="ten-error" class="text-er"></p>
							<label for="inputName5" class="form-label">Ngày sinh</label>
							<form:input id="ngsinh" path="ngSinh" type="date" placeholder="Ngày sinh" />
							<p id="ngaysinh-error" class="text-er"></p>
							<form:errors class="text-er" path="ngSinh"></form:errors>
							<label for="inputName5" class="form-label" style="line-height: 0px;">Giới tính</label>
							<div class="row" style="display: flex; gap: 30px;">
								<div class="col-xs-2" style="display: flex; align-items: center;">
									<label>Nam</label>
									<form:radiobutton path="phai" value="false" style="margin-top: 15px;"/>
								</div>
								<div class="col-xs-2" style="display: flex; align-items: center;">
									<label>Nữ</label>
									<form:radiobutton path="phai" value="true"  style="margin-top: 15px;"/>
								</div>

							</div>
							<p id="phai-error" class="text-er"></p>
							<label for="inputName5" class="form-label">Email</label>
							<form:input path="tkkh.email" id="email" placeholder="Email" />
							<form:errors class="text-er" path="tkkh.email"></form:errors>
							<p id="error-email" class="text-er"></p>
							<label for="inputName5" class="form-label">Số điện thoại</label>
							<form:input id="sdt" path="sdt" placeholder="Số điện thoại" />
							<form:errors class="text-er" path="sdt"></form:errors>
							<p id="sdt-error" class="text-er"></p>
							<label for="inputName5" class="form-label">Username</label>
							<form:input id="username" path="tkkh.userName"
								placeholder="Username" />
							<form:errors class="text-er" path="tkkh.userName"></form:errors>
							<p id="username-error" class="text-er"></p>
							<label for="inputName5" class="form-label">Mật khẩu</label>
							<input name="pw" id="password" type="password"
								placeholder="Mật khẩu" />
							<form:errors class="text-er" path="tkkh.matKhau"></form:errors>
							<p id="mk-error" class="text-er"></p>
							<label for="inputName5" class="form-label">Xác Nhận mật
								khẩu</label>
							<input name="rpw" id="confirmPassword" type="password"
								placeholder="Xác Nhận mật khẩu" />
							<span class="text-er"> ${messageer}</span>
							<p id="remk-error" class="text-er"></p>
							<button id="btn-dangki" type="submit" class="wheel-btn">Đăng
								kí</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<!-- ///////////////// -->
	<%@include file="../KhachHang/footer.jsp"%>
	<%@include file="../KhachHang/script.jsp"%>
	<script src="resources/KhachHang/assets/js/auth.js"></script>
	<script>
	let check = true;
	let dataCheck = "";
	function checkInputRegister() {
		check = true;
		
		$("#username").bind("change", function() {
			
			let dataCheck = $(this).val();
			let regexUsername = new RegExp(/^[0-9a-zA-Z_]+$/);
			
			if (!regexUsername.test(dataCheck) || dataCheck.length < 3 || dataCheck.length > 17) {
				check = false;
				$("#username-error").text("Username giới hạn trong khoảng 3-17 ký tự, và không được có ký tự đặc biệt.");
				
				return false;
			} else {
				check = true;
				dataCheck = dataCheck.trim().replace(/\s+/g, '');
				$("#username-error").text("");
				console.log(dataCheck.length)
				$("#username").val(dataCheck.trim());
			}
		});
		
		$("#sdt").bind("change",function() {
			let sdt = $("#sdt").val();
			let regexSdt = new RegExp(/(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/);
			if(!regexSdt.test(sdt)){
				check = false;
				$("#sdt-error").text("Số điện thoại phải hợp lệ");
				return false;

			}else {
				$("#sdt-error").text("");
			}
		});
		
		$("#password").bind("change",function() {
			let pw = $("#password").val();
			if(pw && pw.length >= 6){
				$("#mk-error").text("")
			}else{
				check = false;
				$("#mk-error").text("Mật khẩu không được bỏ trống và tổi thiểu 6 kí tự");
				return false;

			}
		});
		
		$("#firstName").bind("change",function(){
			let firstName = $("#firstName").val();
			let regexFirstname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/);
			if(!regexFirstname.test(firstName)){
				check = false;
				$("#ten-error").text("Tên không được để trống và không được có kí tự đặc biệt!")
				return false;

			}else {
				$("#ten-error").text("")
				firstName = firstName.trim().replace(/\s+/g, '')
				$("#firstName").val(firstName)
			}
			
		});
		
		$("#lastName").bind("change",function(){
		let lastName  = $("#lastName").val();
   		let regexLastname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$/);
		if(!regexLastname.test(lastName)){
			check = false;
			
			$("#ho-error").text("Họ không được để trống và không được có kí tự đặc biệt!")
			return false;

		}else {
			$("#ho-error").text("")
			let namearr = lastName.split(" ")
			lastName = "";
			namearr.forEach((item) => {
				item = item.trim().replace(/\s+/g, '')
				if(item.length > 0){
					lastName += item + " " 
				}
			})
			lastName = lastName.trim()
			$("#lastName").val(lastName)
		}
		});
		$("#email").change(function() {
			let email = $(this).val();
			let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
			if (!regexEmail.test(email)) {
				$("#error-email").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
				return false;
			} else {
				$("#error-email").text("")
			}


			
		});
		
		$("#confirmPassword").bind("change",function(){
			let repw = $("#confirmPassword").val();
			let pw = $("#password").val();
			if(pw && pw != repw){
				check = false;
				return false;

				$("#remk-error").text("Mật khẩu nhập lại không trùng");
			}else {
				$("#remk-error").text("");
			}
		});
		
		check = true;
		/* $("#btn-dangki").click(function(e) {
			e.preventDefault();

			if (check) {
				$("#form-dangki").submit();
			}
		}) */
	}
	
	function checkRegister(){
		let check =  true;
		$("#btn-dangki").click(function(e) {
			check = true;
			e.preventDefault();

			let lastName  = $("#lastName").val();
	   		let regexLastname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$/);
			if(!regexLastname.test(lastName)){
				check = false;
				$("#ho-error").text("Họ không được để trống và không được có kí tự đặc biệt!")
			}else {
				$("#ho-error").text("")
				let namearr = lastName.split(" ")
				lastName = "";
				namearr.forEach((item) => {
					item = item.trim().replace(/\s+/g, '')
					if(item.length > 0){
						lastName += item + " " 
					}
				})
				lastName = lastName.trim()
				$("#lastName").val(lastName)
			}
			
			let firstName = $("#firstName").val();
			let regexFirstname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/);
			if(!regexFirstname.test(firstName)){
				check = false;
				$("#ten-error").text("Tên không được để trống và không được có kí tự đặc biệt!")
			}else {
				$("#ten-error").text("")
				firstName = firstName.trim().replace(/\s+/g, '')
				$("#firstName").val(firstName)
			}
			
			let username = $("#username").val();
			let regexUsername = new RegExp(/^[0-9a-zA-Z_]+$/);
			if (!regexUsername.test(username) || username.length < 3 || username.length > 17) {
				check = false;
				$("#username-error").text("Username giới hạn trong khoảng 3-17 ký tự, và không được có ký tự đặc biệt.");
				
			} else {
				username = username.trim().replace(/\s+/g, '');
				$("#username-error").text("");
				$("#username").val(username.trim());
			}
			
			
			let email = $("#email").val();
			let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
			if (!regexEmail.test(email)) {
				$("#error-email").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
				check = false;
			} else {
				$("#error-email").text("")
			}
			
			let ngaysinh = $("input[name=ngSinh]").val()
			if(!ngaysinh){
				check = false;
				$("#ngaysinh-error").text("Ngày sinh không được để trống");
			}else {
				$("#ngaysinh-error").text("");
			}
			
			let phai = $("input[name=phai]").val()
			if(phai != 'true' && phai != 'false'){
				check = false;
				$("#phai-error").text("????");
			}else {
				$("#phai-error").text("")
			}
			
			let pw = $("#password").val();
			if(pw && pw.length >= 6){
				$("#mk-error").text("")
			}else{
				check = false;
				$("#mk-error").text("Mật khẩu không được bỏ trống và tổi thiểu 6 kí tự");
			}
			
			let repw = $("#confirmPassword").val();
			if(pw && pw != repw){
				check = false;
				$("#remk-error").text("Mật khẩu nhập lại không trùng");
			}else {
				$("#remk-error").text("");
			}
			
			let sdt = $("#sdt").val();
			let regexSdt = new RegExp(/(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/);
			if(!regexSdt.test(sdt)){
				check = false;
				$("#sdt-error").text("Số điện thoại phải hợp lệ");
			}else {
				$("#sdt-error").text("");
			}
			
			
			if (check) {
				$("#form-dangki").submit();
			}
		})
	}

	$(document).ready(function() {
		checkInputRegister();
		checkRegister();

	})
	ngsinh.max = new Date().toISOString().split("T")[0];
	
	</script>
	<!-- sixth block end -->
</body>

</html>