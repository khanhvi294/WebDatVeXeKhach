<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>
<body class=" wheel-bg2 ">
	<!-- MAIN -->
	<div class="load-wrap">
		<div class="wheel-load">
			<img src="images/loader.gif" alt="" class="image">
		</div>
	</div>
	<%@include file="navbar.jsp"%>
	<!-- ////////////////////////////////////////////////////////////// -->

	<!-- //////////////////////////////// -->
	<div class="wheel-start3">
		<img src="images/bg7.jpg" alt="" class="wheel-img">
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
						<li class="title-wrap ">
							<div class="title">
								<span>1.</span>Chọn tuyến
							</div>
						</li>
						<li class="title-wrap active ">
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
	<!-- /////////////////////////////// -->
	<form action="dienthongtin.html" method="post">
		<div class="reservation">
			<div class="container">
				<div class="car-containers">
					<label> Chọn loại xe:</label> <select id="car">
						<option value="220">Ghế</option>
						<option value="320">Giường</option>
						<option value="250">Limousine</option>
					</select>
				</div>

				<ul class="showcase">
					<li>
						<div class="seats"></div> <small>Trống</small>
					</li>
					<li>
						<div class="seats selected"></div> <small>Đang chọn</small>
					</li>
					<li>
						<div class="seats sold"></div> <small>Đã đặt</small>
					</li>
				</ul>

				<div class="containers">
					<div class="screen">
						<div class="screens">
							<li><small>Tầng dưới </small></li>
							<li><small>Tầng trên </small></li>

						</div>

						
						<div class="rows">
                            <input id="A11" value="A11" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A11">A11</label>                           
                            <input id="B11" value="B11" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B11">B11</label>                
                            <input id="C11" value="C11" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C11">C11</label>
                            <input id="A12" value="A12" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A12">A12</label>
                            <input id="B12" value="B12" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B12">B12</label>
                            <input id="C12" value="C12" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C12">C12</label>             
                        </div>
                        <div class="rows">
                            <input id="A21" value="A21" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A21">A21</label>                           
                            <input id="B21" value="B21" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B21">B21</label>                
                            <input id="C21" value="C21" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C21">C21</label>
                            <input id="A22" value="A22" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A22">A22</label>
                            <input id="B22" value="B22" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B22">B22</label>
                            <input id="C22" value="C22" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C22">C22</label>             
                        </div>
                        <div class="rows">
                            <input id="A31" value="A31" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A31">A31</label>                           
                            <input id="B31" value="B31" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B31">B31</label>                
                            <input id="C31" value="C31" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C31">C31</label>
                            <input id="A32" value="A32" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A32">A32</label>
                            <input id="B32" value="B32" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B32">B32</label>
                            <input id="C32" value="C32" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C32">C32</label>             
                        </div>
                        <div class="rows">
                            <input id="A41" value="A41" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A41">A41</label>                           
                            <input id="B41" value="B41" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B41">B41</label>                
                            <input id="C41" value="C41" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C41">C41</label>
                            <input id="A42" value="A42" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A42">A42</label>
                            <input id="B42" value="B42" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B42">B42</label>
                            <input id="C42" value="C42" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C42">C42</label>             
                        </div>
                        <div class="rows">
                            <input id="A51" value="A51" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A51">A51</label>                           
                            <input id="B51" value="B51" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B51">B51</label>                
                            <input id="C51" value="C51" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C51">C51</label>
                            <input id="A52" value="A52" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A52">A52</label>
                            <input id="B52" value="B52" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B52">B52</label>
                            <input id="C52" value="C52" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C52">C52</label>             
                        </div>
                        <div class="rows">
                            <input id="A61" value="A61" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A61">A61</label>                           
                            <input id="B61" value="B61" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B61">B61</label>                
                            <input id="C61" value="C61" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C61">C61</label>
                            <input id="A62" value="A62" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A62">A62</label>
                            <input id="B62" value="B62" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B62">B62</label>
                            <input id="C62" value="C62" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C62">C62</label>             
                        </div>

						<div class="ends">
							<li>
								<p class="text">
									Bạn đã chọn <span id="count">0</span> ghế với giá tiền <span
										id="total">0</span> vnđ
								</p>
							</li>

						</div>
						
						<label for="input-val27" class="promo promo2">
							<button class="wheel-btn" id="Re2">Tiếp theo</button>
						</label>
						
						


					</div>
				</div>
			</div>
		</div>
		</div>
	</form>
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