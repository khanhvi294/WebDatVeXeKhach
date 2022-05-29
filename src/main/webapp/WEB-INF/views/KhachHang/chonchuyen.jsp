<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="head.jsp"%>

<body class="wheel-bg2">
	<!-- MAIN -->
	<%@include file="navbar.jsp"%>
	<!-- ////////////////////////////////////////////////////////////// -->

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
						<li class="title-wrap active ">
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
	<!-- ////////////////////////////////////////// -->
	<div class="prosuct-wrap">
		<div class="container padd-lr0 xs-padd">
			<div class="row">
				<div class="col-sm-8">
					<header class="wheel-header marg-lg-t25 marg-lg-b65">
						<h3>
							Danh sách chuyến xe từ <span>${diemdi.diaDiem } </span> đến <span>
								${diemden.diaDiem } </span>
						</h3>
					</header>
				</div>
			</div>

		</div>
		<div class="container padd-lr0 xs-padd">
			<form action="chonghe.html" method="post">
				<div class="product-list product-list2 wheel-bgt clearfix">
					<c:forEach var="cx" items="${dschuyenxe}">
						<div class="row">
							<div class="col-xs-11" style="
    margin-left: 50px;
">
								<div
									class="product-elem-style1 product-elem-style wheel-bg1 clearfix"
									style="border-radius: 10px;">
									<div class="product-table3">
										<div class="text-wrap text-wrap2 product-cell">
											<div class="title">${cx.tgKh }
												<i class="fa fa-long-arrow-right"></i> 08:00
											</div>
											<div class="price-wrap step-progress product-cell "
												style="display: flex; gap: 0 10px;">
												<p>
													<i class="fa fa-circle"></i> ${cx.gia }
												</p>
												<p>
													<i class="fa fa-circle" aria-hidden="true"></i>
													${cx.xekhach.lx.tenLX }
												</p>
												<p>
													<i class="fa fa-circle"></i> Còn ${cx.sochotrong } chỗ
												</p>
											</div>
										</div>
										<div class="route-line-container">
											<div class="route-line-list">
												<div class="route-line bold">
													<img alt="pickup-bold"
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAn1BMVEUAAAAAAAAAgAAAVVUAbUkAYEAAYkUAYkMAYjwAYD4AYTwAYD0AYT4AYTwAYT0AYT0AYT0AYT0AYT0AYT0AYDwAYT0AYT0AYT0AYD0AYT3////+/v79/f39/fzv8/HV4dzL29WTr6I0d1orakwfZUQWY0IPY0APYT4HYj8MXzwGYT4DYT0AYjwAYT0AYTwAYD0AYDwAXTYAXDAAWS0ASwCRAZr+AAAAGnRSTlMAAQIDBxgaIi9Se5eZwsja4Orx9/r7/P39/ifZSUoAAAFmSURBVHjahVMJjoMwDHS37fY+odBAuQrlTmKO/79tTUBVVWmVERLKzCSxHRtGzOYAy83+eDGMy3G/WQLMZ/CBH4DV7iRwgjjtVgP5xhwW2yvi3WKMc8asO+J1uyD6vf/3wPFmC8klgUth35AffkmY9q/P0mTIJcoJHJkpz2uSxv1nNDnpH6CliWd1xgwWBznq3w55WJA8hy0nfSKrsqwmMxK9JRlWV2QDxTnmSdY0WZIjH9ZEXylb2OFt0tOib+O47Yt0dJCwA1ie0Obq/FdXR6Hvh1HdvVBRNp6WsBF3ofS0ewaOQvDsUuUgaQN7tIb8MS/qwPEervvwnKAuchW2hXs4IlPHJX3keK7j0uc5UZ8okuERLsgkocra0Hk4LoF+YZtVRCLDCxhj1mUT+0pWFj9uyrEyhtagv4KCFP8FKShIbZraQmlLrX0s7XNrG0bbcrqm1bX99+AIsqD4GBz96OmHVzv+f2mSel1r7cqaAAAAAElFTkSuQmCC"
														width="16" height="16" data-v-7026b95e="" />
													${cx.tuyen.diemDi.diaDiem }
													<div>Xe tuyến: 305km - 8 tiếng</div>
												</div>
												<div class="route-line bold">
													<img alt="destination-bold"
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAmCAMAAACS/WnbAAAA51BMVEUAAAD/AAD/ZjPmTRrvUCDwWh7yTSbzUSP2VSbwUiXwUCT4VSPxUyLyUSLwVSPxVSbyVSTtUSTzUiHuVCPvVSPxUyPxVCPxUyPvUyPwUyLwUyPxUyPwUyPwUiLxUiLvUyPwUiLwVCLvVCLwUyLvUyLvUiLwUyPwUiLvUyPvUyLwUiPwUyLvUiLvUiLwUiLvUyLwUiLvUiPxUyLwUiLwUyLvUiLwUiLvUyLvUyLwUyLvUiLwUiPvUiPvUiL////++ff83tX71sv1knTxZjzwXC70VCPyUyLxUyLwUiLvUiLvUSHvTx/vTh3N/rktAAAAPnRSTlMAAQUKEBEUFhsiIyQlJjM2OTk+SWBsbW5ueHuEhIiPk56rrra8xcfJ1dXW2Nna3OHi5efo6u3v9Pb5+vv7/K+Q08cAAAFUSURBVHjafdPllsIwEAXgu8YKrOHu7u5umQHe/3kWerophabfz9w5k2RyAunxwxPPlobDUjbu+XjEne9shwQRM5GgTvYbZp+pHZvsUp+44m0JviFaXki+CVuY+KDzT9nS1A+Ne8AKAzcuKsQKVMFZWLCSCAOOKhsOx9PpeGBD1YHfsRFv16vFYrXeGiXjX0SFzDfLuWa5kRUiijyxbqvlWsWWdZRHWzZYz6W1bNHGiHXH1VxaHVk3Qp91p8VcWpxY10eF7AqogjTZbUFpBPd2h9wH8TO2u+b4B46a3aBqDiBJ6lFTEoBrpn6smQtnCcEKIoGL9y4rdN+hiQlFgxh0RWILVMS/rx5b6H1BCrCFAAwPkfufFXnAlZccsQnlXmDyWiZTXn7FDVedWKK6C3ecDZJ5wwkLzqpgjag6YemtILS88AaF54wgEplnKD2Fms3Qk2npDzuS7aPkEDnLAAAAAElFTkSuQmCC"
														width="16" height="19" data-v-7026b95e="" />
													${cx.tuyen.diemDen.diaDiem }
												</div>
											</div>
											<label for="ip-cx">Chọn</label>
											<input type="radio" name="machuyen" id="ip-cx" value="${cx.maChuyen }" class="choose-cx" />
										</div>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>

					<div class="promo promo2">
						<button class="wheel-btn" id="Re3">Tiếp theo</button>
					</div>
				</div>

			</form>
		</div>
	</div>


	<!-- FOOTER -->
	<!-- ///////////////// -->
	<footer class="wheel-footer">
		<img src="images/bg4.jpg" alt="" class="wheel-img" />
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6 padd-lr0">
					<div class="wheel-address">
						<div class="wheel-footer-logo">
							<a href="#"><img src="images/logo2.png" alt="" /></a>
						</div>
						<ul>
							<li><span> <i class="fa fa-map-marker"></i>121 King
									Street, Melbourne <br /> VIC 3000, Australia
							</span></li>
							<li><a href="#"> <span><i class="fa fa-phone"></i>
										+61 3 8376 6284</span>
							</a></li>
							<li><a href="#"> <span><i class="fa fa-envelope"></i>contact@wheel-rental.com</span>
							</a></li>
						</ul>
						<div class="wheel-soc">
							<a href="#" class="fa fa-twitter"></a> <a href="#"
								class="fa fa-facebook"></a> <a href="#" class="fa fa-linkedin"></a>
							<a href="#" class="fa fa-instagram"></a> <a href="#"
								class="fa fa-share-alt"></a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 padd-lr0">
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
				<div class="col-md-2 col-sm-6 padd-lr0">
					<div class="wheel-footer-item">
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
						<div class="clearfix">
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i11.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i12.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i13.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i14.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i15.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i16.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i17.jpg" alt="" /></a>
							</div>
							<div class="wheel-footer-galery-item">
								<a href="#"><img src="images/i18.jpg" alt="" /></a>
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
				<div class="col-lg-8 col-sm-6 padd-lr0">
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
