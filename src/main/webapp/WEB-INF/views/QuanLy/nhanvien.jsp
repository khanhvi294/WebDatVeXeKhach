<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="slidebar.jsp"%>

<main id="main" class="main">
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
		<h1> hihi
${vi }</h1>
	<div class="pagetitle">
		<h1>Nhân Viên</h1>
	</div>
	<!-- End Page Title -->
	<a href="/CNPM/quanly/nhanvien/insert.html"><button type="button"
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
								<th scope="col">Mã nhân viên</th>
								<th scope="col">Họ</th>
								<th scope="col">Tên</th>
								<th scope="col">Username</th>
								<th scope="col">Trạng Thái</th>
								<th scope="col">Thao Tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${nhanvien}">
								<tr>
									<th scope="row">${u.maNV }</th>
									<td>${u.hoNV}</td>
									<td>${u.tenNV}</td>
									<td>${u.tknv.userName}</td>
									<td><c:choose>
											<c:when test="${u.tknv.trangThai == 0}">
												<span class="badge rounded-pill bg-danger v-bg-tt">Khóa</span>
											</c:when>
											<c:when test="${u.tknv.trangThai == 1}">
												<span class="badge rounded-pill bg-success v-bg-tt">Hoạt
													động</span>
											</c:when>
										</c:choose></td>
									<td><span><a
											href="/CNPM/quanly/nhanvien/${u.maNV}.html?info"> <i
												class="bi bi-info-circle-fill v-icon-modal"></i>
										</a> <a href="/CNPM/quanly/nhanvien/${u.maNV}.html?update"><i
												class="bi bi-pencil-square v-icon-modal"
												data-bs-toggle="modal" data-bs-target="#ProfileEditModal"></i></a>
											<i class="bi bi-pencil-square v-icon-modal"
											data-bs-toggle="modal" data-bs-target="#Edittrangthai"></i> </span></td>

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
<!-- ProfileViewModal -->
<div class="modal_flag" idModal="${idModal }"></div>
<div class="modal fade" id="ProfileViewModal" tabindex="-1">
	<div class="modal-dialog v-modal-container">
		<div class="modal-content border-0">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Thông tin</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close" style="font-weight: 700">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<!-- profile -->
				<main id="modal-main" class="main">

					<section class="section profile">
						<div class="row ">

							<div class="col-xl-12">

								<div class="card mb-0">
									<div class="card-body pt-3">
										<div class="tab-content pt-2">

											<div class="tab-pane fade show active profile-overview"
												id="profile-overview">

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label ">Mã nhân
														viên</div>
													<div class="col-lg-9 col-md-8">${nv.maNV }</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Họ tên nhân viên</div>
													<div class="col-lg-9 col-md-8">${nv.hoNV} ${nv.tenNV}</div>
												</div>


												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Email</div>
													<div class="col-lg-9 col-md-8">${nv.tknv.email}</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Phái</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
															<c:when test="${nv.phai eq true}">
																<span class="badge rounded-pill bg-danger v-bg-tt">Nam</span>
															</c:when>
															<c:when test="${nv.phai eq false}">
																<span class="badge rounded-pill bg-success v-bg-tt">Nữ</span>
															</c:when>
														</c:choose>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Trạng
														thái</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
															<c:when test="${nv.tknv.trangThai == 0}">
																<span class="badge rounded-pill bg-danger v-bg-tt">Khóa</span>
															</c:when>
															<c:when test="${nv.tknv.trangThai == 1}">
																<span class="badge rounded-pill bg-success v-bg-tt">Hoạt
																	động</span>
															</c:when>
														</c:choose>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">CMND/CCCD</div>
													<div class="col-lg-9 col-md-8">${nv.cccd}</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">SĐT</div>
													<div class="col-lg-9 col-md-8">${nv.sdt}</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Ngày
														sinh</div>
													<div class="col-lg-9 col-md-8">${nv.ngaySinh}</div>
												</div>

											</div>
										</div>
										<!-- End Bordered Tabs -->

									</div>
								</div>

							</div>
						</div>
					</section>

				</main>

				<!-- end profile -->
			</div>
		</div>
	</div>
</div>

<!-- End ProfileViewModal-->
<!-- ProfileEditModal -->
<div class="modal fade" id="ProfileEditModal" tabindex="-1">
	<div class="modal-dialog v-modal-container">
		<div class="modal-content border-0">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Chỉnh sửa</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close" style="font-weight: 700">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body row">
				<!-- profile -->
				<!-- Profile Edit Form -->
				<div class="col-12 v-edit-form">
					<form:form method="post" modelAttribute="nv">
						<div class="row mb-3">
							<label for="fullName"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã nhân
								viên</label>
							<div class="col-md-8 col-lg-9">
								<input type="text" readonly="true"
									class="form-control v-form-control" id="fullName"
									value="${nv.maNV }">
							</div>
						</div>

						<div class="row mb-3">
							<label for="company" class="col-md-3 col-form-label v-label">Họ</label>
							<div class="col-md-3">
								<input name="honv" type="text"
									class="form-control v-form-control"
									id="company" value="${nv.hoNV }">
								 								<form:errors style = "color:red" path="hoNV"/> 
							</div>

							<label for="Job" class="col-md-1 col-form-label v-label">Tên</label>
							<div class="col-md-5">
								<input name="tennv" type="text"
									class="form-control  v-form-control" id="Job"
									value="${nv.tenNV }">

													<form:errors style = "color:red" path="tenNV"/> 

							</div>
						</div>


						<div class="row mb-3">
							<label for="Country"
								class="col-md-4 col-lg-3 col-form-label v-label">CMND/CCCD</label>
							<div class="col-md-8 col-lg-9">
								<input name="cccd" type="text"
									class="form-control v-form-control"
									id="Country" value="${nv.cccd }">

								<form:errors style = "color:red" path="cccd"/>
							</div>
						</div>

						<div class="row mb-3">
							<label for="Address"
								class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label>
							<div class="col-md-8 col-lg-9">
								<input name="sdt" type="text"
									class="form-control v-form-control" id="Address"
									value="${nv.sdt }">
							<form:errors style = "color:red" path="sdt"/> 
							</div>
						</div>

						<div class="row mb-3">
							<label for="Phone"
								class="col-md-4 col-lg-3 col-form-label v-label">Ngày
								sinh</label>
							<div class="col-md-8 col-lg-9">
								<input type="date" class="form-control v-form-control"
									 name="ngSinh" value="${nv.ngaySinh }" />

							</div>
						</div>

						<div class="row mb-3">
							<label for="Email"
								class="col-md-4 col-lg-3 col-form-label v-label">Phái</label>
							<div class="col-md-8 col-lg-9">

								<select class="form-select v-form-control"
									aria-label=" select example" name="gridRadios">
									<c:if test="${nv.phai eq false}">
										<option selected value="false">Nữ</option>
										<option value="true">Nam</option>
									</c:if>
									<c:if test="${nv.phai eq true}">
										<option value="false">Nữ</option>
										<option selected value="true">Nam</option>
									</c:if>
								</select>

							</div>
						</div>
						<div class="row mb-3">
							<label for="Twitter"
								class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								thái</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name="trangthai">
									<c:if test="${nv.tknv.trangThai eq 0}">
										<option selected value="0">Khóa</option>
										<option value="1">Đang Hoạt Động</option>
									</c:if>
									<c:if test="${nv.tknv.trangThai eq 1}">
										<option value="0">Khóa</option>
										<option selected value="1">Đang Hoạt Động</option>
									</c:if>
								</select>
							</div>
						</div>

						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0 shadow-none"
								style="padding: 8px 20px">Lưu</button>
						</div>
					</form:form>
					<!-- End Profile Edit Form -->
				</div>
				<!-- end profile -->
			</div>
		</div>
	</div>
</div>

<!-- End ProfileEditModal-->


<!-- model sửa trạng thái -->
<div class="modal fade" id="Edittrangthai" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog v-modal-container">
		<div class="modal-content border-0">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Thay đổi trạng thái</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close" style="font-weight: 700">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body row">
				<!-- profile -->
				<!-- Profile Edit Form -->
				<div class="col-12 v-edit-form">
					<form>


						<div class="row mb-3">
							<label for="Email"
								class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								thái</label>
							<div class="col-md-8">
								<div class="form-check form-check-inline ">
									<input class="form-check-input v-check-input shadow-none"
										type="radio" name="gridRadios" id="gtnam" value="option1"
										checked> <label class="form-check-label"
										for="gridRadios1"> Đang hoạt động </label>
								</div>
								<div class="form-check form-check-inline ">
									<input class="form-check-input v-check-input shadow-none"
										type="radio" name="gridRadios" id="gtnu" value="option2">
									<label class="form-check-label" for="gridRadios2"> Khóa
									</label>
								</div>
							</div>
						</div>


						<div class="text-center">
							<button id="modal-change-state"
								class="btn btn-primary btn-main-color border-0 shadow-none"
								style="padding: 8px 20px">Lưu</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
				</div>
				<!-- end profile -->
			</div>
		</div>
	</div>
</div>


<!-- Vertically centered Modal -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered v-modal-add">
		<div class="modal-content border-0">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Thêm</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close" style="font-weight: 700">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body modal-add">
				<!-- Profile Edit Form -->
				<form:form method="post" modelAttribute="nv">
					<div class="row mb-3">
						<label for="fullName"
							class="col-md-4 col-lg-3 col-form-label v-label">Mã nhân
							viên</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="maNV" type="text" readonly="true"
								class="form-control v-form-control" id="fullName"
								value="${nv.maNV }" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="company" class="col-md-3 col-form-label v-label">Họ</label>
						<div class="col-md-3">
							<form:input path="hoNV" type="text"
								class="form-control v-form-control" id="company" value="" />
							<form:errors style="color:red" path="hoNV" />
						</div>

						<label for="Job" class="col-md-1 col-form-label v-label">Tên</label>
						<div class="col-md-5">
							<form:input path="tenNV" type="text"
								class="form-control  v-form-control" id="Job" value="" />
							<form:errors style="color:red" path="tenNV" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="Twitter"
							class="col-md-4 col-lg-3 col-form-label v-label">Username</label>
						<div class="col-md-8 col-lg-9">
							<input name="username" type="text"
								class="form-control v-form-control" id="Twitter" readonly="true"
								value="${nv.maNV }" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="Twitter"
							class="col-md-4 col-lg-3 col-form-label v-label">Email</label>
						<div class="col-md-8 col-lg-9">
							<input name="email" type="email"
								class="form-control v-form-control">
							<form:errors style="color:red" path="phai" />
						</div>
					</div>


					<div class="row mb-3">
						<label for="Country"
							class="col-md-4 col-lg-3 col-form-label v-label">CMND/CCCD</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="cccd" type="text"
								class="form-control v-form-control" id="Country" value="" />
							<form:errors style="color:red" path="cccd" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="Address"
							class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="sdt" type="text"
								class="form-control v-form-control" id="Address" value="" />
							<form:errors style="color:red" path="sdt" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="Phone"
							class="col-md-4 col-lg-3 col-form-label v-label">Ngày
							sinh</label>
						<div class="col-md-8 col-lg-9">
							<input type="date" class="form-control v-form-control"
								name="ngaysinh" value="" />
							<form:errors style="color:red" path="ngaySinh" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="Email"
							class="col-md-4 col-lg-3 col-form-label v-label">Phái</label>
						<div class="col-md-8">
							<div class="form-check form-check-inline ">
								<form:radiobutton
									class="form-check-input v-check-input shadow-none" value="1"
									path="phai" />
								<label class="form-check-label">Nam</label>
							</div>
							<div class="form-check form-check-inline ">
								<form:radiobutton
									class="form-check-input v-check-input shadow-none" value="0"
									path="phai" />
								<label class="form-check-label" for="gridRadios2"> Nữ </label>
							</div>
						</div>
					</div>


					<div class="text-center">
						<button type="submit"
							class="btn btn-primary btn-main-color border-0 shadow-none"
							style="padding: 8px 20px">Lưu</button>
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
<script
	src="<c:url value='/resources/KhachHang/assets/js/alertify.min.js'/>"></script>	
<script
	src="<c:url value='/resources/KhachHang/assets/js/showMessage.js'/>"></script>	
	
<!-- Alertify -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/alertify.min.js"
	integrity="sha512-JnjG+Wt53GspUQXQhc+c4j8SBERsgJAoHeehagKHlxQN+MtCCmFDghX9/AcbkkNRZptyZU4zC8utK59M5L45Iw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
<script src="<c:url value='/resources/assets/js/my-main.js'/>"></script>

<script>
	$(document).ready(
			function() {
				
				// sua trang thai nhan vien
				showModalConfirm("#modal-change-state",
						"Bạn có chắn chắn muốn thực hiện?", "Ok con dê", "Hủy");

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
