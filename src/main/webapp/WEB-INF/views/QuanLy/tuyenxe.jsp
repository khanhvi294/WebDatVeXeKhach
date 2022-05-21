<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="head.jsp"%>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- End Header -->
	<%@ include file="slidebar.jsp"%>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Tuyến Xe</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item">Pages</li>
					<li class="breadcrumb-item active">Blank</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<a href = "/CNPM/QuanLy/QL_TuyenXe/insert.html"><button type="button"
			class="btn add-new btn-outline-danger shadow-none"
			data-bs-toggle="modal" data-bs-target="#verticalycentered">
			Thêm mới <i class="bi bi-plus-circle"></i>
		</button></a>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card-body">
						<!-- Table with stripped rows -->
						<table class="table datatable table-striped table-bordered">
							<thead>
								<tr class="v-table-tr-color">
									<th scope="col">Mã Tuyến</th>
									<th scope="col">Điểm đi</th>
									<th scope="col">Điểm đến</th>
									<th scope="col">Trạng Thái</th>
									<th scope="col" class="text-center">Option</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${list}">
									<tr>
										<th scope="row">${u.maTuyen }</th>
										<td>${u.diemDi.diaDiem}</td>
										<td>${u.diemDen.diaDiem}</td>
										<td><c:choose>
												<c:when test="${u.trangThai eq false}">
													<span class="badge rounded-pill bg-danger v-bg-tt">Không
														hoạt động</span>
												</c:when>
												<c:when test="${u.trangThai eq true}">
													<span class="badge rounded-pill bg-success v-bg-tt">Hoạt
														động</span>
												</c:when>
											</c:choose></td>
										<td class="text-center"><span><a href = "/CNPM/QuanLy/QL_TuyenXe/${u.maTuyen}.html?update"> <i
												class="bi bi-pencil-square v-icon-modal"
												data-bs-toggle="modal" data-bs-target="#ProfileEditModal"></i></a>
										</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- End Table with stripped rows -->
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	<div class="modal_flag" idModal="${idModal }"></div>
	<!-- ProfileEditModal -->
	<div class="modal fade" id="ProfileEditModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered v-modal-add">
			<div class="modal-content border-0">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Chỉnh sửa</h5>
					<button type="button" class="btn shadow-none"
						data-bs-dismiss="modal" aria-label="Close"
						style="font-weight: 700;">
						<i class="bi bi-x v-icon-close"></i>
					</button>
				</div>
				<div class="modal-body modal-add">
					<!-- Profile Edit Form -->
					<form method = "post">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã
								tuyến</label>
							<div class="col-md-8 col-lg-9">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen" readonly="true" value = "${tuyen.maTuyen }"/>
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Điểm
								đi </label>
							<div class="col-md-3">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen" readonly="true" value = "${tuyen.diemDi.diaDiem }"/>
							</div>
							<label for="inputDate"
								class="col-md-3 col-lg-3 col-form-label v-label">Điểm
								đến</label>
							<div class="col-md-3">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen" readonly="true" value = "${tuyen.diemDen.diaDiem }"/>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								thái</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name= "trangthai">
									<option selected value="true">Hoạt Động</option>
									<option value="false">Không Hoạt Động</option>
								</select>
							</div>
						</div>

						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	<div class="modal fade" id="verticalycentered" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered v-modal-add">
			<div class="modal-content border-0">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Thêm</h5>
					<button type="button" class="btn shadow-none"
						data-bs-dismiss="modal" aria-label="Close"
						style="font-weight: 700;">
						<i class="bi bi-x v-icon-close"></i>
					</button>
				</div>
				<div class="modal-body modal-add">
					<!-- Profile Edit Form -->
					<form method = "post">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã
								tuyến</label>
							<div class="col-md-8 col-lg-9">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen" />
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Điểm
								đi </label>
							<div class="col-md-3">
								<select class="form-select v-form-control"
									aria-label=" select example" name = "ddi">
									<c:forEach var= "dd" items="${listdd}">
										<option value="${dd.maDD}">${dd.diaDiem}</option>
									</c:forEach>
								</select>
							</div>
							<label for="inputDate"
								class="col-md-3 col-lg-3 col-form-label v-label">Điểm
								đến</label>
							<div class="col-md-3">
								<select class="form-select v-form-control"
									aria-label=" select example" name = "dden">
									<c:forEach var= "dd" items="${listdd}">
										<option value="${dd.maDD}">${dd.diaDiem}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								thái</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name = "tramgtjao">
									<option selected value="true">Hoạt Động</option>
									<option value="false">Không Hoạt Động</option>
								</select>
							</div>
						</div>

						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Vertically centered Modal-->
	<!-- Vendor JS Files -->
	<script
		src="<c:url value='/resources/assets/vendor/apexcharts/apexcharts.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/chart.js/chart.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/echarts/echarts.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/quill/quill.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/simple-datatables/simple-datatables.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/tinymce/tinymce.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendor/php-email-form/validate.js'/>"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log($(".modal_flag").attr("idModal"));
			if ($(".modal_flag").attr("idModal") === "modalCreate") {
				$("#verticalycentered").modal("show");
			} else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
				$("#ProfileEditModal").modal("show");
			}
		})
	</script>
	<!-- Template Main JS File -->
	<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
</body>
</html>