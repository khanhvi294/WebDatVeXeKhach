<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="head.jsp"%>

<body class="">
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<!-- MAIN -->
	<div class="load-wrap">
		<div class="wheel-load">
			<img src="images/loader.gif" alt="" class="image">
		</div>
	</div>
	<%@include file="navbar.jsp"%>
	<!-- /////////////////////////////// -->
	
	<!-- /////////////////////////////////// -->
	<div class="wheel-register-block">
		<div class="container">
			<div class="row">
			
			 <div class="col-md-6 " style="margin-left: 300px">
                        <div class="wheel-register-log marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100">
                            <div class="wheel-header">
                                <h5>Đổi Mật Khẩu</h5>
                         
                            </div>
                           <form id="form-doimk" class="row g-3" method="post">
								<div class="col-md-12">
									<label for="inputName5" class="form-label">Mật khẩu cũ</label>
									<input name="cpassword" id="cpassword" type="password" 
										> <span class="text-er">${message1 }</span>
									 <p id="cmk-error" class="text-er"> </p>
								</div>

								<div class="col-md-12">
									<label for="inputName5" class="form-label">Mật khẩu mới</label>
									<input name="npassword" id="password" type="password" 
										> <span class="text-er">${message2 }</span>
										<p id="mk-error" class="text-er"> </p>
								</div>

								<div class="col-md-12">
									<label for="inputName5" class="form-label">Xác nhận mật
										khẩu</label> <input id="confirmPassword" name="rnpassword" type="password"
										 > <span
										class="text-er">${message3 }</span>
										<p id="remk-error" class="text-er"> </p>
								</div>

								<div class="text-center ">
									<button type="submit" id="btn-doimk" class="btn btn-primary marg-lg-t20">Lưu</button>
									
								</div>
							</form>
                        </div>
                    </div>
                   
				

				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<!-- ///////////////// -->
	<%@include file="footer.jsp" %>
	<!-- Scripts project -->
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/bootstrap.min.js"></script>
	<!-- count -->
	<script type="text/javascript"
		src='resources/KhachHang/assets/js/jquery.countTo.js'></script>
	<!-- google maps -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBt5tJTim4lOO3ojbGARhPd1Z3O3CnE-C8"
		type="text/javascript"></script>
	<!-- swiper -->
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/idangerous.swiper.min.js"></script>
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/equalHeightsPlugin.js"></script>
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/jquery.datetimepicker.full.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/index.js"></script>
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/alertify.min.js"></script>
	<script type="text/javascript"
		src="resources/KhachHang/assets/js/showMessage.js"></script>
	<script>
	let check = true;
	let dataCheck = "";
	function checkInputRegister() {
		check = true;
		
		
		$("#cpassword").bind("change",function() {
			let pw = $("#cpassword").val();
			if(pw){
				$("#cmk-error").text("")
			}else{
				check = false;
				$("#cmk-error").text("Mật khẩu không được bỏ trống");
				return false;

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
		
		
	}
	
	function checkPasswordSubmit() {
		let check = true;
		$("#btn-doimk").click(function (e) {
			
			check = true;
			e.preventDefault();
			
			let cpassword = $("#cpassword").val();
			if(cpassword){
				$("#cmk-error").text("")
			}else{
				check = false;
				$("#cmk-error").text("Mật khẩu không được bỏ trống");
				

			}
			
			let password = $("#password").val();
			if(password && password.length >= 6){
				$("#mk-error").text("")
			}else{
				check = false;
				$("#mk-error").text("Mật khẩu không được bỏ trống và tổi thiểu 6 kí tự");
				

			}
			
			let confirmPassword = $("#confirmPassword").val();
			let repw = $("#confirmPassword").val();
			let pw = $("#password").val();
			if(pw && pw != repw){
				check = false;
				

				$("#remk-error").text("Mật khẩu nhập lại không trùng");
			}else {
				$("#remk-error").text("");
			}
			
			if(check){
				$("#form-doimk").submit();
			}
			
		})
	}

	$(document).ready(function() {
		checkInputRegister();
		checkPasswordSubmit();
	})
	
	</script>
	<!-- sixth block end -->
</body>

</html>