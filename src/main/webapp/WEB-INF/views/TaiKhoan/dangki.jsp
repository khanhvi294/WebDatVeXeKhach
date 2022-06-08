<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="../KhachHang/head.jsp"%>
<body class="">
	<!-- MAIN -->

	<%@include file="../KhachHang/navbar.jsp"%>
	<!-- /////////////////////////////////// -->
	<div class="wheel-register-block">
		<div class="container">
			<div class="row">
				<div class="col-md-7 padd-r0" style="margin-left: 300px">
					<div
						class="wheel-register-log marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100">
						<div class="wheel-header">
							<h5>Đăng kí</h5>
						</div>

						<form:form action="dangki.html" modelAttribute="khachhang"
							method="post" id="form-dangki">
							<label for="inputName5" class="form-label">Họ</label>
							<form:input path="hoKH" placeholder="Họ" />
							<form:errors class="text-er" path="hoKH"></form:errors>
							<label for="inputName5" class="form-label">Tên</label>
							<form:input path="tenKH" placeholder="Tên" />
							<form:errors class="text-er" path="tenKH"></form:errors>
							<label for="inputName5" class="form-label">Ngày sinh</label>
							<form:input path="ngSinh" type="date" placeholder="Ngày sinh" />
							<form:errors class="text-er" path="ngSinh"></form:errors>
							<label for="inputName5" class="form-label">Giới tính</label>
							<div  style="display: flex; gap: 30px;">
								<div  >
									<label>Nam</label>
									<form:radiobutton path="phai" value="false" />
								</div>
								<div >
									<label>Nữ</label>
								<form:radiobutton path="phai" value="true" />
								</div>
							</div>
							<label for="inputName5" class="form-label">Email</label>
							<form:input path="tkkh.email" placeholder="Email" />
							<form:errors class="text-er" path="tkkh.email"></form:errors>
							<label for="inputName5" class="form-label">Số điện thoại</label>
							<form:input id="sdt" path="sdt" placeholder="Số điện thoại" />
							<form:errors class="text-er" path="sdt"></form:errors>
							<p id="sdt-error" class="text-er"> </p>
							<label for="inputName5" class="form-label">Username</label>
							<form:input id="username" path="tkkh.userName" placeholder="Username" />
							<form:errors  class="text-er" path="tkkh.userName"></form:errors>
							<p id="username-error" class="text-er"> </p>
							<label for="inputName5" class="form-label">Mật khẩu</label>
							<input name="pw" id="password" type="password" placeholder="Mật khẩu" />
							<form:errors class="text-er" path="tkkh.matKhau"></form:errors>
							<p id="mk-error" class="text-er"> </p>
							<label for="inputName5" class="form-label">Xác Nhận mật khẩu</label>
							<input name="rpw" type="password" placeholder="Xác Nhận mật khẩu" />
							<span class="text-er"> ${messageer}</span>

							<button id="btn-dangki" type="submit" class="wheel-btn">Đăng kí</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<!-- ///////////////// -->
	<footer class="wheel-footer">
		<img src="images/bg4.jpg" alt="" class="wheel-img">
		<div class="container">
			<div class="row">
				<div class="col-md-3  col-sm-6  padd-lr0">
					<div class="wheel-address">
						<div class="wheel-footer-logo">
							<a href="#"><img src="images/logo.png" alt=""></a>
						</div>
						<ul>
							<li><span><i class="fa fa-map-marker"></i>97 Man
									Thiện, Phường Hiệp Phú <br> TP Thủ Đức, TP Hồ Chí Minh </li>
							<li><a href="#"><span><i class="fa fa-phone"></i>
										0912345678</span></a></li>
							<li><a href="#"><span><i class="fa fa-envelope"></i>p.h.n.phuong1812@gmail.com</span></a></li>
						</ul>
						<div class="wheel-soc">
							<a href="#" class="fa fa-twitter"></a> <a href="#"
								class="fa fa-facebook"></a> <a href="#" class="fa fa-linkedin"></a>
							<a href="#" class="fa fa-instagram"></a> <a href="#"
								class="fa fa-share-alt"></a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6  padd-lr0">
					<div class="wheel-footer-item">
						<h3>Whell</h3>
						<ul>
							<li><a href="about.html" class="">Về chúng tôi</a></li>
							<li><a href="news.html" class="">Tin tức</a></li>
							<li><a href="about.html" class="">Giới thiệu</a></li>
							<li><a href="contact.html" class="">Liên hệ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-6  padd-lr0">
					<div class="wheel-footer-item ">
						<h3>
							<span>Chăm sóc khách hàng</span> 1900 6886
						</h3>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="wheel-footer-info wheel-bg6">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-sm-6  padd-lr0">
					<span>&#169; WHEEL 2021</span>
				</div>
				<div class="col-lg-4 col-sm-6 padd-lr0">
					<ul>
						<li><a href="index.html">Trang chủ</a></li>
						<li><a href="reservation.html"> Đặt vé</a></li>
						<li><a href="contact.html"> Liên hệ</a></li>
						<li><a href="about.html"> Giới thiệu</a></li>
						<li><a href="news.html">Tin tức</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
			}else {
				$("#sdt-error").text("");
			}
		});
		
		$("password").bind("change",function() {
			let pw = $("#password").val();
			if(pw && pw.length >= 6){
				$("#mk-error").text("")
			}else{
				check = false;
				$("#mk-error").text("Mật khẩu không được bỏ trống và tổi thiểu 6 kí tự");
			}
		});
		
		
		
		check = true;
		$("#btn-dangki").click(function(e) {
			e.preventDefault();

			if (check) {
				$("#form-dangki").submit();
			}
		})
	}
	

	$(document).ready(function() {
		checkInputRegister();

	})
	
	</script>
	<!-- sixth block end -->
</body>

</html>