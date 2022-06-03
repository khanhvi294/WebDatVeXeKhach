<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Jewel Theme">
<meta name="description"
	content="Wheel - Responsive and Modern Car Rental Website Template">
<meta name="keywords" content="">
<title>Wheel - Responsive and Modern Car Rental Website Template</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<!-- reset css -->
<link rel="stylesheet" type="text/css"
	href="resources/KhachHang/assets/css/css_reset.css">
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/KhachHang/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/KhachHang/assets/css/jquery.datetimepicker.min.css">
<link
	href="resources/KhachHang/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="resources/KhachHang/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="resources/KhachHang/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link href="resources/KhachHang/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="resources/KhachHang/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="resources/KhachHang/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="resources/KhachHang/assets/css/bootstrap-select.min.css">
<!-- preload -->
<link rel="stylesheet" type="text/css"
	href="resources/KhachHang/assets/css/loaders.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/KhachHang/assets/css/index.css">

<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">



<link href="resources/KhachHang/assets/css/style1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/KhachHang/assets/css/alertify.min.css">
</head>
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
				<div
					class="col-lg-12 marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100 ">
					<div class="card">
						<div class="card-body">
							<form class="row g-3" method="post">
								<div class="col-md-12" style="margin-top: 40px">
									<label for="inputName5" class="form-label">Mật khẩu cũ</label>
									<input name="cpassword" type="password" class="form-control"
										id="inputName5"> <span class="text-er">${message1 }</span>
								</div>

								<div class="col-md-12">
									<label for="inputName5" class="form-label">Mật khẩu mới</label>
									<input name="npassword" type="password" class="form-control"
										id="inputName5"> <span class="text-er">${message2 }</span>
								</div>

								<div class="col-md-12">
									<label for="inputName5" class="form-label">Xác nhận mật
										khẩu</label> <input name="rnpassword" type="password"
										class="form-control" id="inputName5"> <span
										class="text-er">${message3 }</span>
								</div>

								<div class="text-center ">
									<button type="submit" class="btn btn-primary marg-lg-t20">Lưu</button>
									<button type="reset" class="btn btn-secondary marg-lg-t20">Reset</button>
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
 <%@include file="footer.jsp"%>
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