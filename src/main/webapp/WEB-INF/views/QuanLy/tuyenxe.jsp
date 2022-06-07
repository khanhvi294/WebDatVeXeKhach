<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Tuyến Xe</h1>
		</div>
		<!-- End Page Title -->
		<a href="/CNPM/quanly/tuyenxe/insert.html"><button type="button"
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
									<th scope="col">Điểm Đi</th>
									<th scope="col">Điểm Đến</th>
									<th scope="col">Thời Gian Di Chuyển</th>
									<th scope="col">Trạng Thái</th>
									<th scope="col" class="text-center">Thao Tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${list}">
									<tr>
										<th scope="row">${u.maTuyen }</th>
										<td>${u.diemDi.diaDiem}</td>
										<td>${u.diemDen.diaDiem}</td>
										<td>${u.tgchay}</td>
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
										<td class="text-center"><span><a
												href="/CNPM/quanly/tuyenxe/${u.maTuyen}.html?update"> <i
													class="bi bi-pencil-square v-icon-modal"
													data-bs-toggle="modal" data-bs-target="#ProfileEditModal"></i></a>
												<a href="/CNPM/quanly/tuyenxe/${u.maTuyen}.html?trangthai"><i
													class="bi bi-pencil-square v-icon-modal"
													data-bs-toggle="modal" data-bs-target="#Edittrangthai"></i></a>
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
					<form method="post">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã
								tuyến</label>
							<div class="col-md-8 col-lg-9">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen"
									readonly="true" value="${tuyen.maTuyen }" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Điểm
								đi </label>
							<div class="col-md-3">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen"
									readonly="true" value="${tuyen.diemDi.diaDiem }" />
							</div>
							<label for="inputDate"
								class="col-md-3 col-lg-3 col-form-label v-label">Điểm
								đến</label>
							<div class="col-md-3">
								<input name="matuyen" type="text"
									class="form-control v-form-control" id="matuyen"
									readonly="true" value="${tuyen.diemDen.diaDiem }" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Thời
								gian di chuyển</label>
							<div class="col-md-8 col-lg-9">
								<input name="tgchay" type="text"
									class="form-control v-form-control" id="matuyen"
									value="${tuyen.tgchay }" />
								<span style="color:red">${messagetgchay }</span>
							</div>
						</div>
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Giá tuyến</label>
							<div class="col-md-8 col-lg-9">
								<input type="text" class="form-control v-form-control"
									name="giatuyen" value = "${tuyen.giatuyen }"/>
								<span style="color:red">${messagegia }</span>
							</div>
						</div>
						
						
						<!-- 						<div class="row mb-3"> -->
						<!-- 							<label class="col-md-4 col-lg-3 col-form-label v-label">Trạng -->
						<!-- 								thái</label> -->
						<!-- 							<div class="col-md-8 col-lg-9"> -->
						<!-- 								<select class="form-select v-form-control" -->
						<!-- 									aria-label=" select example" name= "trangthai"> -->
						<!-- 									<option selected value="true">Hoạt Động</option> -->
						<!-- 									<option value="false">Không Hoạt Động</option> -->
						<!-- 								</select> -->
						<!-- 							</div> -->
						<!-- 						</div> -->

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
					<form:form method="post" modelAttribute="tuyen">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã
								tuyến</label>
							<div class="col-md-8 col-lg-9">
								<form:input path="maTuyen" type="text"
									class="form-control v-form-control" id="matuyen" />
								<form:errors style="color:red" path="maTuyen" />
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Điểm
								đi </label>
							<div class="col-md-3">
								<form:select class="form-select v-form-control"
									aria-label=" select example" path="diemDi.maDD">
									<form:options items="${listdd}" itemValue="maDD"
										itemLabel="diaDiem" />
								</form:select>
								<form:errors style="color:red" path="diemDen" />
							</div>
							<label for="inputDate"
								class="col-md-3 col-lg-3 col-form-label v-label">Điểm
								đến</label>
							<div class="col-md-3">
								<form:select class="form-select v-form-control"
									aria-label=" select example" path="diemDen.maDD">
									<form:options items="${listdd}" itemValue="maDD"
										itemLabel="diaDiem" />
								</form:select>
							</div>
							
						</div>
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Thời
								gian di chuyển</label>
							<div class="col-md-8 col-lg-9">
								<form:input type="text" class="form-control v-form-control"
									path="tgchay" />
								<form:errors style="color:red" path="tgchay" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Giá tuyến</label>
							<div class="col-md-8 col-lg-9">
								<form:input type="text" class="form-control v-form-control"
									path="giatuyen" />
								<form:errors style="color:red" path="giatuyen" />
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								thái</label>
							<div class="col-md-8 col-lg-9">
								<form:select class="form-select v-form-control"
									aria-label=" select example" path="trangThai">
									<form:option value="true">Hoạt Động</form:option>
									<form:option value="false">Ngừng Hoạt Động</form:option>
								</form:select>
							</div>
						</div>
						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
						</div>
					</form:form>
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="Edittrangthai" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog v-modal-container">
			<div class="modal-content border-0">
			<form:form method="post" modelAttribute="tuyen">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Thay đổi trạng thái cho tuyến xe ${tuyen.maTuyen }</h5>
					<button type="button" class="btn shadow-none"
						data-bs-dismiss="modal" aria-label="Close"
						style="font-weight: 700">
						<i class="bi bi-x v-icon-close"></i>
					</button>
				</div>
				<div class="modal-body row">
					<!-- profile -->
					<!-- Profile Edit Form -->
					<div class="col-12 v-edit-form">
						

							<div class="row mb-3">
								<label for="Email"
									class="col-md-4 col-lg-3 col-form-label v-label">Trạng
									thái</label>
								<div class="col-md-8">
									<div class="col-md-8">
									<div class="form-check form-check-inline ">
										<form:radiobutton
											class="form-check-input v-check-input shadow-none" value="1"
											path="trangThai" />
										<label class="form-check-label"> Đang Hoạt Động </label>
									</div>
									<div class="form-check form-check-inline ">
										<form:radiobutton
											class="form-check-input v-check-input shadow-none" value="0"
											path="trangThai" />
										<label class="form-check-label"> Ngừng Hoạt Động </label>
									</div>
								</div>
								</div>
							</div>


							<div class="text-center">

								<button type="submit" id="btn-change-state"
									class="btn btn-primary btn-main-color border-0 shadow-none"
									style="padding: 8px 20px">Lưu</button>
							</div>
						
						<!-- End Profile Edit Form -->
					</div>
					<!-- end profile -->
				</div>
			</div>
			</form:form>
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
	<script
		src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<script
		src="<c:url value='/resources/KhachHang/assets/js/showMessage.js'/>"></script>


	<!-- Template Main JS File -->
	<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
	<script src="<c:url value='/resources/assets/js/my-main.js'/>"></script>
	<script>
		$(document)
				.ready(
						function() {
							showModalConfirm("#btn-change-state",
									"Bạn có chắc chắn muốn thực hiện?",
									"Xác nhận", "Hủy");
							console.log($(".modal_flag").attr("idModal"));
							if ($(".modal_flag").attr("idModal") === "modalCreate") {
								$("#verticalycentered").modal("show");
							} else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
								$("#ProfileEditModal").modal("show");
							} else if ($(".modal_flag").attr("idModal") === "modalTT") {
								$("#Edittrangthai").modal("show");
							}
						})
	</script>
	<!-- Template Main JS File -->
</body>
</html>


