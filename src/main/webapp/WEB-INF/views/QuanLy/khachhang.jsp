<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="slidebar.jsp"%>

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Khách hàng</h1>
	</div>
	<!-- End Page Title -->
	<section class="section">
		<div class="row">

			<div class="col-lg-12">

				<div class="card-body">

					<!-- Table with stripped rows -->
					<table class="table datatable table-striped table-bordered">
						<thead>
							<tr class="v-table-tr-color">
								<th scope="col">Mã KH</th>
								<th scope="col">HọKH</th>
								<th scope="col">TênkH</th>
								<th scope="col">Username</th>
								<th scope="col">Phai</th>
								<th scope="col">SĐT</th>
								<th scope="col">Ngaysinh</th>
								<th scope="col">Trạng Thái</th>
								<th scope="col">Thao Tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dskh}">
								<tr>
									<th scope="row">${u.maKH }</th>
									<td>${u.hoKH}</td>
									<td>${u.tenKH}</td>
									<td>${u.tkkh.userName}</td>
									<td><c:choose>
											<c:when test="${u.phai eq true}">
												<span class="badge rounded-pill bg-danger v-bg-tt">Nam</span>
											</c:when>
											<c:when test="${u.phai eq false}">
												<span class="badge rounded-pill bg-success v-bg-tt">Nữ</span>
											</c:when>
										</c:choose></td>
									<td>${u.sdt}</td>
									<td>${u.ngSinh}</td>
									<td><c:choose>
											<c:when test="${u.tkkh.trangThai eq 0}">
												<span class="badge rounded-pill bg-danger v-bg-tt">Khóa</span>
											</c:when>
											<c:when test="${u.tkkh.trangThai eq 1}">
												<span class="badge rounded-pill bg-success v-bg-tt">Hoạt
													động</span>
											</c:when>
										</c:choose></td>
									<td><span><a
											href="/CNPM/quanly/khachhang/${u.maKH}.html?update"><i
												class="bi bi-pencil-square v-icon-modal"
												data-bs-toggle="modal" data-bs-target="#ProfileEditModal"></i></a>
												<i class="bi bi-pencil-square v-icon-modal"
											data-bs-toggle="modal" data-bs-target="#Edittrangthai"></i>
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

<!-- ProfileEditModal -->
<div class="modal_flag" idModal="${idModal }"></div>
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
					<form method="post">
						<div class="row mb-3">
							<label for="fullName"
								class="col-md-4 col-lg-3 col-form-label v-label">Mã KH</label>
							<div class="col-md-8 col-lg-9">
								<input name="fullName" type="text" readonly="true"
									class="form-control v-form-control" id="fullName"
									value="${kh.maKH}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="company" class="col-md-3 col-form-label v-label">HoKH</label>
							<div class="col-md-3">
								<input name="hoKH" type="text"
									class="form-control v-form-control" id="company" readonly="true"

									value="${kh.hoKH }">
								<form:errors style="color:red" path="hoKH" />
							</div>

							<label for="Job" class="col-md-1 col-form-label v-label">TênKH</label>
							<div class="col-md-5">
								<input name="tenKH" type="text"
									class="form-control  v-form-control" id="Job" readonly="true"

									value="${kh.tenKH }">
								<form:errors style="color:red" path="tenKH" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="Address"
								class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label>
							<div class="col-md-8 col-lg-9">
								<input name="sdt" type="text"

									class="form-control v-form-control" id="Address" readonly="true"

									value="${kh.sdt }">
								<form:errors style="color:red" path="sdt" />
							</div>
						</div>

						<div class="row mb-3">
							<label for="Phone"
								class="col-md-4 col-lg-3 col-form-label v-label">Ngày
								sinh</label>
							<div class="col-md-8 col-lg-9">

								<input type="date" class="form-control v-form-control" readonly="true"

									name="ngSinh" value="${kh.ngSinh }" />
							</div>
						</div>

						<div class="row mb-3">
							<label for="Email"
								class="col-md-4 col-lg-3 col-form-label v-label">Phái</label>
							<div class="col-md-8 col-lg-9">
									<c:if test="${kh.phai eq false}">
										<input type="text" class="form-control v-form-control" readonly="true" value="Nữ" />
									</c:if>
									<c:if test="${kh.phai eq true}">
										<input type="text" class="form-control v-form-control" readonly="true" value="Nam" />
									</c:if>
							</div>
						</div>


						<div class="row mb-3">
							<label for="Twitter"
								class="col-md-4 col-lg-3 col-form-label v-label">Trạng
								thái</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name="trangthai">
									<c:if test="${kh.tkkh.trangThai eq 0}">
										<option selected value="0">Khóa</option>
										<option value="1">Đang Hoạt Động</option>
									</c:if>
									<c:if test="${kh.tkkh.trangThai eq 1}">
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
					</form>
					<!-- End Profile Edit Form -->
				</div>
				<!-- end profile -->
			</div>
		</div>
	</div>
</div>

<!--model sửa trạng thái  -->
<!-- model sửa trạng thái -->
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
											Đang hoạt động
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline ">
                                        <input class="form-check-input v-check-input shadow-none" type="radio"
                                            name="gridRadios" id="gtnu" value="option2">
                                        <label class="form-check-label" for="gridRadios2">
                                            Khóa
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

<!-- End ProfileEditModal-->




<!-- <!-- Vertically centered Modal -->
-->
<!-- <div class="modal fade" id="verticalycentered" tabindex="-1"> -->
<!-- 	<div class="modal-dialog modal-dialog-centered v-modal-add"> -->
<!-- 		<div class="modal-content border-0"> -->
<!-- 			<div class="modal-header v-modal-header"> -->
<!-- 				<h5 class="modal-title v-modal-title">Thêm</h5> -->
<!-- 				<button type="button" class="btn shadow-none" -->
<!-- 					data-bs-dismiss="modal" aria-label="Close" style="font-weight: 700"> -->
<!-- 					<i class="bi bi-x v-icon-close"></i> -->
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body modal-add"> -->
<!-- 				Profile Edit Form -->
<!-- 				<form> -->
<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="fullName" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Mã KH</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input name="fullName" type="text" -->
<!-- 								class="form-control v-form-control" id="fullName" -->
<!-- 								value="Kevin Anderson"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="company" class="col-md-3 col-form-label v-label">HọKH</label> -->
<!-- 						<div class="col-md-3"> -->
<!-- 							<input name="company" type="text" -->
<!-- 								class="form-control v-form-control" id="company" -->
<!-- 								value="Lueilwitz, Wisoky and Leuschke"> -->
<!-- 						</div> -->

<!-- 						<label for="Job" class="col-md-1 col-form-label v-label">TênKH</label> -->
<!-- 						<div class="col-md-5"> -->
<!-- 							<input name="job" type="text" -->
<!-- 								class="form-control  v-form-control" id="Job" -->
<!-- 								value="Web Designer"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Address" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input name="address" type="text" -->
<!-- 								class="form-control v-form-control" id="Address" -->
<!-- 								value="A108 Adam Street, New York, NY 535022"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Phone" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Ngày -->
<!-- 							sinh</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input name="phone" type="text" -->
<!-- 								class="form-control v-form-control" id="Phone" -->
<!-- 								value="(436) 486-3538 x29071"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Email" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Phái</label> -->
<!-- 						<div class="col-md-8"> -->
<!-- 							<div class="form-check form-check-inline "> -->
<!-- 								<input class="form-check-input v-check-input shadow-none" -->
<!-- 									type="radio" name="gridRadios" id="gtnam" value="option1" -->
<!-- 									checked> <label class="form-check-label" -->
<!-- 									for="gridRadios1"> Nam </label> -->
<!-- 							</div> -->
<!-- 							<div class="form-check form-check-inline "> -->
<!-- 								<input class="form-check-input v-check-input shadow-none" -->
<!-- 									type="radio" name="gridRadios" id="gtnu" value="option2"> -->
<!-- 								<label class="form-check-label" for="gridRadios2"> Nữ </label> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Twitter" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Username</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input name="twitter" type="text" -->
<!-- 								class="form-control v-form-control" id="Twitter" -->
<!-- 								value="https://twitter.com/#"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Twitter" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Email</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input type="email" class="form-control v-form-control"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Twitter" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Mật Khẩu</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input type="password" class="form-control v-form-control"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="row mb-3"> -->
<!-- 						<label for="Twitter" -->
<!-- 							class="col-md-4 col-lg-3 col-form-label v-label">Nhập lại -->
<!-- 							mật Khẩu</label> -->
<!-- 						<div class="col-md-8 col-lg-9"> -->
<!-- 							<input type="password" class="form-control v-form-control"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="text-center"> -->
<!-- 						<button type="submit" -->
<!-- 							class="btn btn-primary btn-main-color border-0 shadow-none" -->
<!-- 							style="padding: 8px 20px">Lưu</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 				End Profile Edit Form -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
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
		if ($(".modal_flag").attr("idModal") === "modalUpdate") {
			$("#ProfileEditModal").modal("show");
		}
	})
</script>
<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>