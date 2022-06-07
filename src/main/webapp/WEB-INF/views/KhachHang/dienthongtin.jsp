<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>
<body class="">
<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
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
								<div class="col-md-12">
									<div class="col-6 " style="display: flex; flex-direction: column;">
										<form:input path="email" placeholder="Email "
											class="wheel-half-width pull-left" style="width: 90%; margin-bottom: 0px;" />
										<p
											style="line-height: 30px; word-wrap: break-word; font-size: 13px; font-weight: 500;"
											class="text-er">${eremail }</p>
									</div>
									<div class="col-6"
										style="display: flex; flex-direction: column;">
										<form:input path="sdt" placeholder="Số điện thoại"
											class="wheel-half-width pull-right marg-r0"
											style="width: 90%; margin-bottom: 0px;" />
										<p
											style="line-height: 30px; word-wrap: break-word; font-size: 13px; font-weight: 500;"
											class="text-er">${ersdt }</p>
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
									không nhận vé hoặc huỷ/ đổi vé</span> </label> <input type="radio" id='r3'
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
	<%@include file="footer.jsp" %>
	<!-- Scripts project -->
	<%@include file="script.jsp"%>
</body>

</html>