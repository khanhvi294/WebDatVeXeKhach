<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../KhachHang/head.jsp"%>
<body class="">
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<!-- MAIN -->

	<%@include file="../KhachHang/navbar.jsp"%>
	<!-- /////////////////////////////// -->

	<!-- /////////////////////////////////// -->

	<div class="wheel-register-block">
		<div class="container">
			<div class="row">
				<div class="col-md-6 marg-lg-t50" style="margin-left: 300px">
					<div
						class="wheel-register-log marg-lg-b150 marg-sm-t100 marg-sm-b100">
						<div class="wheel-header">
							<h5>Đăng Nhập</h5>
							<p></p>
						</div>
						<form:form id="form-dangnhap" action="dangnhap.html" method="post"
							modelAttribute="taikhoan" style="text-align: center;" >
							<label for="username" class="fa fa-user"> <form:input
									id="username" path="userName" 
									placeholder='Tên đăng nhập' /></label>
							<form:errors class="text-er" path="userName"></form:errors>
							<p id="username-error" class="text-er"></p>
							<label for="userPass" class="fa fa-lock"> <form:input
									type="password" path="matKhau" id="password"
									placeholder='Mật khẩu' /></label>
							<form:errors class="text-er" path="matKhau"></form:errors>
							<p id="mk-error" class="text-er"></p>
							<button type="submit" id="btn-dangnhap" class="wheel-btn">Đăng nhập</button>
							<label class="password-sing clearfix" for="input-val2"> <!--  <input type='checkbox' id='input-val2'> <span>Nhớ mật khẩu</span> -->
								<a href="quenmatkhau.html">Quên mật khẩu</a>
							</label>
							<p style="margin-top: 10px;" class="text-center">Chưa có tài khoản? <a href="dangki.html" id="btn-dangnhap" style="color: #ff7043;">Đăng kí</a> </p>
							
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
		check = true;
		$("#btn-dangnhap").click(function(e) {
			e.preventDefault();

			if (check) {
				$("#form-dangnhap").submit();
			}
		})
		
 	}
 	$(document).ready(function() {
		checkInputRegister();

	})
     </script>
</body>

</html>