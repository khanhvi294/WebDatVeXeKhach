<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>
<body class="">
	<!-- MAIN -->
	<div class="load-wrap">
		<div class="wheel-load">
			<img src="images/loader.gif" alt="" class="image">
		</div>
	</div>
	<%@include file="navbar.jsp"%>
	<!-- ////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////// -->
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
						<li class="title-wrap ">
							<div class="title">
								<span>3.</span>Chọn ghế
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>4.</span>Thông tin khách hàng
							</div>
						</li>
						<li class="title-wrap active">
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
	<!-- /////////////////////////////// -->
	<div class="reservation">
		<div class="container">
			<div class="py-5 text-center ">
				<h2>Vui lòng chọn hình thức thanh toán</h2>
			</div>

			<div class="row">
				<div
					class="col-md-8 order-md-2 mb-4  marg-lg-t140 marg-lg-b50 marg-sm-t100">
					<h3 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Thông tin chuyến xe</span>
					</h3>
					<ul class="list-group mb-3 marg-lg-t20">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h4 class="my-0">
									Tuyến xe: <strong>${chuyenxe.getTuyen().getDiemDi().getDiaDiem()}
										- ${chuyenxe.getTuyen().getDiemDen().getDiaDiem() } </strong>
								</h4>
								<h4 class="my-0">
									Thời gian: <strong> ${chuyenxe.getNgKH()}
										${chuyenxe.getTgKh()}</strong>
								</h4>
								<h4>ghế:</h4>
								<c:forEach var="ve" items="${dsve}">
									<h4 class="my-0">
										<strong> ${ve.getId().getSoGhe() }</strong>
									</h4>
								</c:forEach>

							</div>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<h4>
								<span>Tổng thành tiền</span>
							</h4>
							<h4>
								<strong>143520000</strong>
							</h4>
						</li>
					</ul>


					<h3 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Thông tin Khách hàng</span>
					</h3>
					<ul class="list-group mb-3 marg-lg-t20">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed ">
							<div>
								<h4 class="my-0">
									Họ và Tên: <strong>Vi Đức<strong>
								</h4>
								<h4 class="my-0">
									Điện thoại: <strong> ${PhieuDat.getSdt() }</strong>
								</h4>
								<h4 class="my-0">
									Email: <strong>${PhieuDat.getEmail() }</strong>
								</h4>
							</div>
						</li>
					</ul>
</div>

					<div
						class="col-md-4 order-md-1  marg-lg-t140 marg-lg-b50 marg-sm-t100">
						<h3 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-muted">Hình thức thanh toán</span>
						</h3>
						<ul class="list-group mb-3 marg-lg-t20">
							<li
								class="list-group-item d-flex justify-content-between lh-condensed ">
								<div class="form__radio">
									<label for="httt-1"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-currency-dollar"
											viewBox="0 0 16 16">
                                        <path
												d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                    </svg>Tiền mặt
									</label> <input id="httt-1" name="pttt" type="radio" value="0" />
								</div>
								<div class="form__radio">
									<label for="httt-2"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-credit-card"
											viewBox="0 0 16 16">
                                        <path
												d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z" />
                                        <path
												d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z" />
                                    </svg>Chuyển khoản
									</label> <input id="httt-2" name="pttt" type="radio" value="1" />
								</div>
								<hr class="mb-4">
								<form action="trangchu.html" method="post"
									style="margin-left: 250px">
									<label for="input-val27" class="promo promo2">
										<button name="btnDatVe" class="wheel-btn" id='input-val27'>Đặt
											vé</button>
									</label>
								</form>
							</li>
						</ul>

				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////// -->
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

	<%@include file="script.jsp"%>
</body>

</html>