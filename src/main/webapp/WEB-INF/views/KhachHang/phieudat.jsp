<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<link href="resources/KhachHang/assets/css/style1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="">
<div class="modal-flag" idModal="${idModal}"></div>
	<!-- MAIN -->
	<div class="load-wrap">
		<div class="wheel-load">
			<img src="images/loader.gif" alt="" class="image">
		</div>
	</div>
	 <%@include file="navbar.jsp"%>
	<!-- /////////////////////////////// -->
	<div class="wheel-start3">
		<img src="images/bg7.jpg" alt="" class="wheel-img">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<div
						class="wheel-start3-body clearfix marg-lg-t255 marg-lg-b75 marg-sm-t190 marg-xs-b30">
						<h3>Vé đặt</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////////// -->
	<div class="wheel-register-block">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-12 marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100 ">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Thông tin vé xe của bạn</h4>
							<table class="table datatable ">
								<thead>
									<tr>
										<th scope="col">Mã vé</th>
										<th scope="col">Ngày đặt</th>
										<th scope="col">Chuyến xe</th>
										<th scope="col">Trạng thái</th>
										<th scope="col">Tổng tiền</th>
										<th scope="col">Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pd" items="${ dsphieudat}">
										<tr>
											<th scope="row">${pd.maPD }</th>
											<td>${pd.ngaydat }</td>
											<td>${pd.getChuyen().getTuyen().getMaTuyen() }</td>
											<td>
											<c:choose>
												<c:when test="${pd.trangThai==0}">
												Chờ thanh toán
												</c:when>
												<c:when test="${pd.trangThai==1}">
												Đã thanh toán
												</c:when>
												<c:when test="${pd.trangThai==2}">
												Đã hủy
												</c:when>
											</c:choose>
											</td>
											<td>${pd.getChuyen().getGia()}</td>
											<td>
											<a href="hoadon/${pd.maPD }.html" >
											<i class="fas fa-info-circle"></i></a> 
											<a href="phieudat/huy/${pd.maPD }.html" ><i class="fas fa-ban"></i></a>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
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
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xoá vé xe</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Bạn có muốn xoá vé xe này ?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<form method= "post">
					<button type="submit" name="btnHuyPhieu" class="btn btn btn-primary">Đồng ý</button>
					</form>
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
	<script
		src="resources/KhachHang/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="resources/KhachHang/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/KhachHang/assets/vendor/chart.js/chart.min.js"></script>
	<script src="resources/KhachHang/assets/vendor/echarts/echarts.min.js"></script>
	<script src="resources/KhachHang/assets/vendor/quill/quill.min.js"></script>
	<script
		src="resources/KhachHang/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="resources/KhachHang/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="resources/KhachHang/assets/vendor/php-email-form/validate.js"></script>
	<script src="resources/KhachHang/assets/js/main.js"></script>
	<script>
	if ($(".modal-flag").attr("idModal") === "modalHuy") {
		$("#exampleModal").modal("show");}
	</script>
</body>

</html>