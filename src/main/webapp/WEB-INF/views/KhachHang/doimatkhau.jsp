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
                           <form class="row g-3" method="post">
								<div class="col-md-12">
									<label for="inputName5" class="form-label">Mật khẩu cũ</label>
									<input name="cpassword" type="password" 
										id="inputName5"> <span class="text-er">${message1 }</span>
								</div>

								<div class="col-md-12">
									<label for="inputName5" class="form-label">Mật khẩu mới</label>
									<input name="npassword" type="password" 
										id="inputName5"> <span class="text-er">${message2 }</span>
								</div>

								<div class="col-md-12">
									<label for="inputName5" class="form-label">Xác nhận mật
										khẩu</label> <input name="rnpassword" type="password"
										 id="inputName5"> <span
										class="text-er">${message3 }</span>
								</div>

								<div class="text-center ">
									<button type="submit" class="btn btn-primary marg-lg-t20">Lưu</button>
									
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
	<!-- sixth block end -->
</body>

</html>