<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>

<body class="">
	<!-- MAIN -->
	<div class="load-wrap">
		<div class="wheel-load">
			<img src="resources/KhachHang/images/loader.gif" alt="" class="image">
		</div>
	</div>
	<%@include file="navbar.jsp"%>
	<!-- //////////////////////////////// -->
	<div class="wheel-start3">
		<img src="resources/KhachHang/images/bg7.jpg" alt="" class="wheel-img">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<div
						class="wheel-start3-body clearfix marg-lg-t255 marg-lg-b75 marg-sm-t190 marg-xs-b30">
						<h3>Đặt vé</h3>
						<ol class="breadcrumb">
							<li><a href="index.html">Trang chủ</a></li>
							<li class="active">Đặt vé</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////////// -->
	<div class="step-wrap">
		<!-- ////////////////////////////////////////// -->
		<div class="container padd-lr0">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<ul class="steps">
						<li class="title-wrap active">
							<div class="title">
								<span>1.</span>Chọn tuyến
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>2.</span>Xác nhận lộ trình
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>3.</span>Thông tin khách hàng
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>4.</span>Thanh toán
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- ////////////////////////////////////////// -->
	</div>
	<!-- ////////////////////////////////////////// -->
	<div class="reservation">
		<div
			class="container padd-lr0 marg-lg-t100 marg-lg-b100 marg-xs-t0 marg-xs-b0">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<form:form action="chonchuyen.html" modelAttribute="chuyenxe"
						method="post">
						<div class="wheel-start-form wheel-start-form2">
							<div class="clearfix">
								<div class="wheel-date">
									<span>Điểm đi</span> <label for="input-val20"
										class="fa fa-map-marker"> <form:select
											class="selectpicker" path="tuyen.diemDi.maDD"
											itemLabel="diaDiem" itemValue="maDD" id="input-val20"
											items="${dsdiadiem }"></form:select>
									</label>

								</div>
								<div class="wheel-date">
									<span>Điểm đến</span> <label for="input-val20"
										class="fa fa-map-marker"> <form:select
											class="selectpicker" path="tuyen.diemDen.maDD"
											itemLabel="diaDiem" itemValue="maDD" id="input-val21"
											items="${dsdiadiem }"></form:select>
									</label>
								</div>
								<div class="wheel-date ">
									<span>Ngày đi</span> <label class="fa fa-calendar"
										for="input-val22"> <form:input path="ngKH"
											class="" type="date" id="input-val22"
											value="29 Apr" />
									</label>
								</div>

					
								<button type="submit" class="wheel-btn" id='input-val27'>Tìm
									kiếm</button>
							</div>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>
	<!-- ////////////////////////////////////////// -->
	<div class="wheel-subscribe wheel-bg2">
		<div class="container ">
			<div class="row">
				<div class="col-md-6 padd-lr0">
					<div class="wheel-header">
						<h5>Đăng kí để nhận tin</h5>
						<h3>
							Đăng kí ngay và bạn sẽ được nhận mã giảm giá<span> 20% </span>
						</h3>
					</div>
				</div>
				<div class="col-md-6 padd-lr0">
					<form action="#">
						<input type="text" placeholder="Địa chỉ gmail của bạn "> <a
							href="register.html" class="wheel-cheader-but" target="_blank">Đăng
							kí ngay</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<!-- ///////////////// -->
	<footer class="wheel-footer">
		<img src="resources/KhachHang/images/bg4.jpg" alt="" class="wheel-img">
		<div class="container">
			<div class="row">
				<div class="col-md-3  col-sm-6  padd-lr0">
					<div class="wheel-address">
						<div class="wheel-footer-logo">
							<a href="#"><img src="resources/KhachHang/images/logo2.png"
								alt=""></a>
						</div>
						<ul>
							<li><span><i class="fa fa-map-marker"></i>121 King
									Street, Melbourne <br> VIC 3000, Australia </span></li>
							<li><a href="#"><span><i class="fa fa-phone"></i>
										+61 3 8376 6284</span></a></li>
							<li><a href="#"><span><i class="fa fa-envelope"></i>contact@wheel-rental.com</span></a>
							</li>
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
						<h3>Useful Links</h3>
						<ul>
							<li><a href="#" class="">About us</a></li>
							<li><a href="#" class="">Customer Service</a></li>
							<li><a href="#" class="">Contact Us</a></li>
							<li><a href="#" class="">Safety Recall</a></li>
							<li><a href="#" class="">Privacy policy</a></li>
							<li><a href="#" class="">Site Map</a></li>
							<li><a href="#" class="">Terms & condition</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-6  padd-lr0">
					<div class="wheel-footer-item ">
						<h3>Vehicles</h3>
						<ul>
							<li><a href="#" class="">Exotic Cars</a></li>
							<li><a href="#" class="">SUVs</a></li>
							<li><a href="#" class="">Trucks</a></li>
							<li><a href="#" class="">Mini Vans</a></li>
							<li><a href="#" class="">Moving Trucks</a></li>
							<li><a href="#" class="">Vans</a></li>
							<li><a href="#" class="">RVs</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 padd-lr0">
					<div class="wheel-footer-gallery">
						<h3>Photo Gallery</h3>
						<div class="  clearfix">
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i11.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i12.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i13.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i14.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i15.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i16.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i17.jpg"
									alt=""></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="resources/KhachHang/images/i18.jpg"
									alt=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="wheel-footer-info wheel-bg6">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-sm-6  padd-lr0">
					<span>&#169; WHEEL 2016 | <a
						href="https://templatespoint.net/">Templates Point</a>
					</span>
				</div>
				<div class="col-lg-4 col-sm-6 padd-lr0">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#"> Pages</a></li>
						<li><a href="#"> Listings</a></li>
						<li><a href="#"> Reservation</a></li>
						<li><a href="#">Location</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts project -->
	<%@include file="script.jsp"%>

	<!-- sixth block end -->
</body>

</html>