<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>
<body class="">
	<!-- MAIN -->
	
	<%@include file="navbar.jsp"%>
	<!-- //////////////////////////////// -->

	<div class="step-wrap">
		<!-- ////////////////////////////////////////// -->
		<div class="container padd-lr0">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<ul class="steps">
						<li class="title-wrap">
							<div class="title">
								<span>1.</span>Tìm chuyến
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>2.</span>Chọn chuyến
							</div>
						</li>
						<li class="title-wrap">
							<div class="title">
								<span>3.</span>Chọn ghế
							</div>
						</li>
						<li class="title-wrap active">
							<div class="title">
								<span>4.</span>Thông tin khách hàng
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>5.</span>Thanh toán
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- ////////////////////////////////////////// -->
	</div>
	<!-- /////////////////////////////////// -->
	<div class="container">
		<form:form action="thanhtoan.html" method="post"
			modelAttribute="phieudat">
			<div class="row">
				<div
					class="col-md-6 padd-lr0 marg-lg-t100 marg-lg-b100 marg-xs-t0 marg-xs-b0">
					<div class="wheel-billing ">
						<div class="wheel-order-price clearfix">
							<div class="wheel-header">
								<h5>Thông tin khách hàng</h5>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="col-6">
										<form:input path="email" placeholder="Email "
											class="wheel-half-width pull-left" style=" margin-bottom: 0px;" />
										<span
											style="line-height: 30px; word-wrap: break-word; font-size: 13px; font-weight: 500;"
											class="text-er">${eremail }</span>
									</div>
									<div class="col-6"
										style="display: flex; flex-direction: column;">
										<form:input path="sdt" placeholder="Số điện thoại"
											class="wheel-half-width pull-right marg-r0"
											style="width: 100%; margin-bottom: 0px;" />
										<span
											style="line-height: 30px; word-wrap: break-word; font-size: 13px; font-weight: 500;"
											class="text-er">${ersdt }</span>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
				<div class="col-md-6 padd-lr0">
					<div class="wheel-order ">
						<div class="wheel-payment marg-lg-t60 marg-lg-b30">
							<div class="wheel-header ">
								<h5>Điều khoản và lưu ý</h5>
							</div>

							<input type="radio" id='r1' name='payment'> <label
								for="r1"><i></i> <span>* Quý khách vui lòng mang
									email có chứa mã vé đến văn phòng để đổi vé xe trước giờ xuất
									bến ít nhất 60 phút để chúng tôi trung chuyển</span> </label> <input
								type="radio" id='r2' name='payment'> <label for="r2"><i></i>
								<span>* Thông tin hành khách phải chính xác, nếu không sẽ
									không thể lên xe hoặc huỷ/ đổi vé</span> </label> <input type="radio" id='r3'
								name='payment'> <label for="r3"><i></i> <span>*
									Quý khách không được đổi/ trả vé vào các ngày lễ tết (ngày
									thường quý khách được quyền chuyển đổi hoặc huỷ vé một lần duy
									nhất trước giờ xe chạy 24h với mức phí 10%)</span> </label> <label
								for="input-val10" class="wheel-agree"></label> <input
								type="checkbox" name="dongy" value="dongy" id='input-val10'> <span>Tôi đồng
								ý với </span> <a href="#"> điều khoản sử dụng</a> <label
								for="input-val27" class="promo promo2">
								<button type="submit" class="wheel-btn" id='input-val27'>Tiếp
									theo</button>
							</label>

						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<!-- .wheel-billing -->
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
							<li><a href="#"><span><i class="fa fa-envelope"></i>contact@wheel-rental.com</span></a></li>
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
	<!-- sixth block end -->
</body>

</html>