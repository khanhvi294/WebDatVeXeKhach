<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
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
	<a href = "/CNPM/QuanLy/QL_ChuyenXe/insert.html"><button type="button"
		class="btn add-new btn-outline-danger shadow-none">Thêm mới
		 <i class="bi bi-plus-circle"></i></button></a>
	
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
								<th scope="col" class="text-center">Option</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "u" items = "${list}">
								<tr>
									<th scope="row">${u.maChuyen }</th>
									<td>${u.ngKH}</td>
									<td>${u.tgKh}</td>
									<td>${u.xekhach.bienXe}</td>
									<td>
										<c:choose>
											<c:when test="${u.trangthai eq false}"><span class="badge rounded-pill bg-danger v-bg-tt">Không hoạt động</span></c:when>
											<c:when test="${u.trangthai eq true}"><span class="badge rounded-pill bg-success v-bg-tt">Hoạt động</span></c:when>
										</c:choose>
									</td>
									<td><span><a href = "/CNPM/QuanLy/QL_ChuyenXe/${u.maChuyen}.html?info"> <i
											class="bi bi-info-circle-fill v-icon-modal"
											></i></a>
											<a href = "/CNPM/QuanLy/QL_ChuyenXe/${u.maChuyen}.html?update"><i class="bi bi-pencil-square v-icon-modal"
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
<!-- ProfileViewModal -->
<div class = "modal_flag" idModal = "${idModal }"></div>
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
													<div class="col-lg-8 col-md-5">${chuyen.tuyen.diemDi.diaDiem} - ${chuyen.tuyen.diemDen.diaDiem}</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Nhân
														viên</div>
													<div class="col-lg-8 col-md-5">${chuyen.nv.tenNV}-${chuyen.nv.maNV}</div>
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
													<div class="col-lg-3 col-md-4 label v-label">Xe khách</div>
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
						<div class="col-md-8 col-lg-9">
							${chuyen.maChuyen }
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Tuyến</label>
						<div class="col-md-8 col-lg-9">
							<select class="form-select v-form-control"
								aria-label=" select example" name="tuyenxe">
								<option selected value="${chuyen.tuyen.maTuyen }">${chuyen.tuyen.diemDi.diaDiem} - ${chuyen.tuyen.diemDen.diaDiem}</option>
								<c:forEach var= "tx" items="${listtx}">
										<option value="${tx.maTuyen}">${tx.diemDi.diaDiem} - ${tx.diemDen.diaDiem}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Nhân
							viên</label>
						<div class="col-md-8 col-lg-9">
							<select class="form-select v-form-control"
								aria-label=" select example" name = "nhanvien">
								
								<option selected value="${chuyen.nv.maNV}">${chuyen.nv.hoNV} ${chuyen.nv.tenNV}</option>
								<c:forEach var= "nv" items="${listnv}">
										<option value="${nv.maNV}">${nv.hoNV} ${nv.tenNV}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày
							khởi hành</label>
						<div class="col-md-3">
							<input type="date" class="form-control v-form-control" name = "ngKH" value= "${chuyen.ngKH }"/>
						</div>
						<label for="inputTime" class="col-md-3 col-form-label v-label" >Thời
							gian đi</label>
						<div class="col-md-3">
							<input type="time" class="form-control v-form-control" name = "tgKH" value= "${chuyen.tgKh }"/>
						</div>
					</div>

					<div class="row mb-3">
						<label for="Country"
							class="col-md-4 col-lg-3 col-form-label v-label">Giá</label>
						<div class="col-md-8 col-lg-9">
							<input name="money" type="text"
								class="form-control v-form-control" id="Country" value="${chuyen.gia }" />
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Xe
							khách</label>
						<div class="col-md-8 col-lg-9">
							<select class="form-select v-form-control"
								aria-label=" select example" name = "xekhach">
								<option selected value="${chuyen.xekhach.bienXe}">${chuyen.xekhach.bienXe}</option>
								<c:forEach var= "xk" items="${listxk}">
										<option value="${xk.bienXe}">${xk.bienXe}</option>
								</c:forEach>
							</select>
							</select>
						</div>
					</div>

					<div class="text-center">
						<button type="submit"
							class="btn btn-primary btn-main-color border-0">Save
							Changes</button>
					</div>
				</form>
				<!-- End Profile Edit Form -->
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
				 <form:form action="QuanLy/QL_ChuyenXe/insert.html" method="post" modelAttribute="chuyenxe">
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
							<%-- <form:select class="form-select v-form-control"
								aria-label=" select example" path="tuyen">
								<option selected value="">none</option>
								<c:forEach var= "tx" items="${listtx}">
										<option value="${tx}">${tx.diemDi.diaDiem} - ${tx.diemDen.diaDiem}</option>
								</c:forEach>
							</form:select>--%>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Nhân
							viên</label>
						<div class="col-md-8 col-lg-9">
							<%-- <form:select class="form-select v-form-control"
								aria-label=" select example" path = "nv">
								<option selected value="">none</option>
								<c:forEach var= "nhanvien" items="${listnv}">
										<option value="${nhanvien}">${nhanvien.hoNV} ${nhanvien.tenNV}</option>
								</c:forEach>
							</form:select> --%>
						</div>
					</div>

					<%-- <div class="row mb-3">
						<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày
							khởi hành</label>
						<div class="col-md-3">
							<form:input type="date" class="form-control v-form-control" path = "ngKH"/>
						</div>
						<label for="inputTime" class="col-md-3 col-form-label v-label">Thời
							gian đi</label>
						<div class="col-md-3">
							<form:input type="time" class="form-control v-form-control" path = "tgKh" />
						</div>
					</div> --%>

					<div class="row mb-3">
						<label for="Country"
							class="col-md-4 col-lg-3 col-form-label v-label">Giá</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="gia" type="text"
								class="form-control v-form-control" id="Country" />
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Xe
							khách</label>
						<div class="col-md-8 col-lg-9">
							<%-- <form:select class="form-select v-form-control"
								aria-label=" select example" path = "xekhach">
								<option selected value="">none</option>
								<c:forEach var= "xk" items="${listxk}">
										<option value="${xk}">${xk.bienXe}</option>
								</c:forEach>
							</form:select> --%>
						</div>
					</div>

					<div class="text-center">
						<button type="submit"
							class="btn  btn-primary btn-main-color border-0">
							Lưu</button>
					</div>
				</form:form>
				<form action="QuanLy/QL_ChuyenXe/insert.html" method="post"><button type="submit"
							class="btn  btn-primary btn-main-color border-0">
							Lưu</button> </form>
				<!-- End Profile Edit Form -->
			</div>
		</div>
	</div>
</div>
<!-- End Vertically centered Modal-->
<!-- Vendor JS Files -->
<script src="<c:url value='/resources/assets/vendor/apexcharts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/chart.js/chart.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/echarts/echarts.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/quill/quill.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/simple-datatables/simple-datatables.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/tinymce/tinymce.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/php-email-form/validate.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function () {
console.log($(".modal_flag").attr("idModal"));
	if($(".modal_flag").attr("idModal") === "modalCreate"){
		$("#verticalycentered").modal("show");
	}else if($(".modal_flag").attr("idModal") === "modalShow"){
		$("#ProfileViewModal").modal("show");
		
	}else if($(".modal_flag").attr("idModal") === "modalUpdate"){
		$("#ProfileEditModal").modal("show");
	}
})
</script>

<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
</body>
</html>