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
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Chuyến Xe</h1>
		</div>
		<!-- End Page Title -->
		<a href="/CNPM/quanly/chuyenxe/insert.html"><button type="button"
				class="btn add-new btn-outline-danger shadow-none">
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
									<th scope="col">Mã chuyến</th>
									<th scope="col">Ngày khỏi hành</th>
									<th scope="col">Thời gian đi</th>
									<th scope="col">Biển xe</th>
									<th scope="col">Trạng Thái</th>
									<th scope="col" class="text-center">Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${list}">
									<tr>
										<th scope="row">${u.maChuyen }</th>
										<td>${u.ngKH}</td>
										<td>${u.tgKh}</td>
										<td>${u.xekhach.bienXe}</td>
										<td><c:choose>
												<c:when test="${u.trangthai eq false}">
													<span class="badge rounded-pill bg-danger v-bg-tt">Chưa
														Khởi Hành</span>
												</c:when>
												<c:when test="${u.trangthai eq true}">
													<span class="badge rounded-pill bg-success v-bg-tt">Đã
														Khởi Hành</span>
												</c:when>
											</c:choose></td>
										<td><span><a
												href="/CNPM/quanly/chuyenxe/${u.maChuyen}.html?info"> <i
													class="bi bi-info-circle-fill v-icon-modal"></i></a> <c:if
													test="${u.trangthai eq false}">
													<a href="/CNPM/quanly/chuyenxe/${u.maChuyen}.html?update"><i
														class="bi bi-pencil-square v-icon-modal"
														data-bs-toggle="modal" data-bs-target="#ProfileEditModal"></i></a>
												</c:if> </span> 
												
												<i class="bi bi-arrow-repeat v-icon-modal"
											data-bs-toggle="modal" data-bs-target="#Edittrangthai"></i></td>
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
	<!-- ProfileViewModal -->
	<div class="modal_flag" idModal="${idModal }"></div>
	<div class="modal fade" id="ProfileViewModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content border-0" style="width: 660px;">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Thông tin</h5>
					<button type="button" class="btn shadow-none"
						data-bs-dismiss="modal" aria-label="Close"
						style="font-weight: 700;">
						<i class="bi bi-x v-icon-close"></i>
					</button>
				</div>
				<div class="modal-body">
					<!-- profile -->
					<div id="modal-main" class="main">
						<section class="section profile">
							<div class="row">
								<div class="col-xl-12">
									<div class="card v-modal-de">
										<%-- <form> --%>
										<div class="card-body pt-3">
											<!-- Bordered Tabs -->
											<div class="tab-content pt-2">
												<div class="tab-pane fade show active profile-overview"
													id="profile-overview">
													<div class="row">
														<div class="col-lg-3 col-md-4 label v-label">Mã
															chuyến</div>
														<div class="col-lg-8 col-md-5">${chuyen.maChuyen}</div>
													</div>
													<div class="row">
														<div class="col-lg-3 col-md-4 label v-label">Tuyến</div>
														<div class="col-lg-8 col-md-5">${chuyen.tuyen.diemDi.diaDiem}
															- ${chuyen.tuyen.diemDen.diaDiem}</div>
													</div>


													<div class="row">
														<div class="col-lg-3 col-md-4 label v-label">Thời
															gian</div>

														<div class="col-lg-4 col-md-5">${chuyen.ngKH}</div>

														<div class="col-lg-4 col-md-5">${chuyen.tgKh}</div>
													</div>

													<div class="row">
														<div class="col-lg-3 col-md-4 label v-label">Giá</div>
														<div class="col-lg-8 col-md-5">${chuyen.gia}</div>
													</div>

													<div class="row">
														<div class="col-lg-3 col-md-4 label v-label">Xe
															khách</div>
														<div class="col-lg-8 col-md-5">${chuyen.xekhach.bienXe }</div>
													</div>
												</div>
											</div>
											<!-- End Bordered Tabs -->
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
					<!-- end profile -->
				</div>
			</div>
		</div>
	</div>

	<!-- End ProfileViewModal-->
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
								chuyến</label>
							<div class="col-md-8 col-lg-9">${chuyenxe.maChuyen }</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Tuyến</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name="tuyenxe" id="tuyen">
									<option selected value="${chuyenxe.tuyen.maTuyen }">${chuyenxe.tuyen.diemDi.diaDiem}
										- ${chuyenxe.tuyen.diemDen.diaDiem}</option>
									<c:forEach var="tx" items="${listtx}">
										<option value="${tx.maTuyen}">${tx.diemDi.diaDiem}-
											${tx.diemDen.diaDiem}</option>
									</c:forEach>
								</select>
							</div>
						</div>


						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày
								khởi hành</label>
							<div class="col-md-3">
								<input type="date" class="form-control v-form-control"
									name="ngKH" value="${chuyenxe.ngKH }" />
							</div>
							<label for="inputTime" class="col-md-3 col-form-label v-label">Thời
								gian đi</label>
							<div class="col-md-3">
								<input type="time" class="form-control v-form-control"
									name="tgKH" value="${chuyenxe.tgKh }" />
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Xe
								khách</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name="xekhach">
									<option selected value="${chuyenxe.xekhach.bienXe}">${chuyenxe.xekhach.bienXe}</option>
									<c:forEach var="xk" items="${listxk}">
										<option value="${xk.bienXe}">${xk.bienXe}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								Thái</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name="trangthai">
									<option value="false">Chưa Khởi Hành</option>
									<option value="true">Đã Khởi Hành</option>
								</select> </select>
							</div>
						</div>
						<label class="col-md-4 col-lg-3 col-form-label v-label">${message}</label>
						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0">Lưu</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
	<!-- edit trang thai -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="Edittrangthai" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog v-modal-container">
            <div class="modal-content border-0">
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Thay đổi trạng thái</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight:700"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body row">
                    <!-- profile -->
                    <!-- Profile Edit Form -->
                    <div class="col-12 v-edit-form">
                        <form>
                           

                            <div class="row mb-3">
                                <label for="Email" class="col-md-4 col-lg-3 col-form-label v-label">Trạng thái</label>
                                <div class="col-md-8">
                                    <div class="form-check form-check-inline ">
                                        <input class="form-check-input v-check-input shadow-none" type="radio"
                                            name="gridRadios" id="gtnam" value="option1" checked>
                                        <label class="form-check-label" for="gridRadios1">
                                            Chưa khởi hành
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline ">
                                        <input class="form-check-input v-check-input shadow-none" type="radio"
                                            name="gridRadios" id="gtnu" value="option2">
                                        <label class="form-check-label" for="gridRadios2">
                                            Đã khởi hành
                                        </label>
                                    </div>
                                </div>
                            </div>
        
                         
                            <div class="text-center">
                                <button data-bs-toggle="modal" data-bs-target="#xacnhan" class="btn btn-primary btn-main-color border-0 shadow-none"
                                    style="padding: 8px 20px">Lưu
                                </button>
                            </div>
                        </form><!-- End Profile Edit Form -->
                    </div>
                    <!-- end profile -->
                </div>
            </div>
        </div>
	</div>

<!-- xác nhận -->

<!-- Modal -->
<div class="modal fade" id="xacnhan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	<!-- add model -->
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
					<form:form action="quanly/chuyenxe/insert.html" method="post"
						modelAttribute="chuyenxe">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã
								chuyến</label>
							<div class="col-md-8 col-lg-9">
								<form:input path="maChuyen" type="text"
									class="form-control v-form-control" id="machuyen" />
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Tuyến</label>
							<div class="col-md-8 col-lg-9">
								<form:select class="form-select v-form-control"
									aria-label=" select example" path="tuyen.maTuyen"
									items="${listtemp}">
									<%--  									<form:options items="${listtx}" itemValue="maTuyen" itemLabel="diemDen.diaDiem"/>  --%>
								</form:select>

							</div>
						</div>

						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày
								khởi hành</label>
							<div class="col-md-3">
								<input type="date" class="form-control v-form-control"
									name="ngKH" />
								<form:errors style="color:red" path="ngKH" />
							</div>

							<label for="inputTime" class="col-md-3 col-form-label v-label">Thời
								gian đi</label>
							<div class="col-md-3">
								<input type="time" class="form-control v-form-control"
									name="thoigian" />
								<form:errors style="color:red" path="tgKh" />
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Xe
								khách</label>
							<div class="col-md-8 col-lg-9">
								<form:select class="form-select v-form-control"
									aria-label=" select example" path="xekhach.bienXe">
									<form:options items="${listxk}" itemValue="bienXe"
										itemLabel="bienXe" />
								</form:select>
							</div>
						</div>
						<div class="text-center">
							<button type="submit"
								class="btn  btn-primary btn-main-color border-0">Lưu</button>
						</div>
					</form:form>

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
			} else if ($(".modal_flag").attr("idModal") === "modalShow") {
				$("#ProfileViewModal").modal("show");

			} else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
				$("#ProfileEditModal").modal("show");
			}
		})
	</script>

	<!-- Template Main JS File -->
	<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
</body>
</html>