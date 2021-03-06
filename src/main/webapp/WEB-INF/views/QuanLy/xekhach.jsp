<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="slidebar.jsp"%>
<div class="alert-flag" aType='${message.type}'
	aMessage="${message.message }"></div>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>Xe Khách</h1>
	</div>
	<!-- End Page Title -->
	<a href="/CNPM/quanly/xekhach/insert.html"><button type="button"
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
								<th scope="col">Biển xe</th>
								<th scope="col">Tên loại xe</th>
								<th scope="col">trạng thái</th>
								<th scope="col" class="text-center">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${ds}">
								<tr>
									<th scope="row">${u.bienXe }</th>
									<td>${u.lx.tenLX}</td>
									<td><c:choose>
											<c:when test="${u.trangThai == false}">
												<span class="badge rounded-pill bg-danger v-bg-tt">Khóa</span>
											</c:when>
											<c:when test="${u.trangThai == true}">
												<span class="badge rounded-pill bg-success v-bg-tt">Hoạt
													động</span>
											</c:when>
										</c:choose></td>
									<td><span><a
											href="/CNPM/quanly/xekhach/${u.bienXe}.html?update"><i
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

<!-- ProfileEditModal -->
<div class="modal_flag" idModal="${idModal }"></div>
<div class="modal fade" id="ProfileEditModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered v-modal-add">
		<div class="modal-content border-0">
			<form:form method="post" modelAttribute="xk">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Chỉnh sửa cho loại xe
						mã&nbsp;${xk.bienXe }</h5>
					<button type="button" class="btn shadow-none"
						data-bs-dismiss="modal" aria-label="Close"
						style="font-weight: 700;">
						<i class="bi bi-x v-icon-close"></i>
					</button>
				</div>
				<div class="modal-body modal-add">
					<!-- Profile Edit Form -->

					<div class="row mb-3">
						<label for="machuyen"
							class="col-md-4 col-lg-3 col-form-label v-label">Biển Xe</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="bienXe" type="text"
								class="form-control v-form-control" readonly="true" id="smadd" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate"
							class="col-md-4 col-lg-3 col-form-label v-label">Loại xe
						</label>
						<div class="col-md-8 col-lg-9">
							<select class="form-select v-form-control"
								aria-label=" select example" name="malx">
								<option selected value="${xk.lx.maLX}">${xk.lx.tenLX}</option>
								<c:forEach var="u" items="${dslx}">
									<option value="${u.maLX}">${u.tenLX}</option>
								</c:forEach>
							</select>
						</div>
					</div>


					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Trạng Thái</label>
						<div class="col-md-8 col-lg-9">
							<c:choose>
								<c:when test="${xk.trangThai == false}">
									<select class="form-select v-form-control"
										aria-label=" select example" name="trangthai">
											<option selected value="false">Khóa</option>
										<c:forEach var="u" items="${dslx}">
											<option value="true">Hoạt Động</option>
										</c:forEach>
										</select>
								</c:when>
								<c:when test="${xk.trangThai == true}">
									<select class="form-select v-form-control"
										aria-label=" select example" name="trangthai">
											<option selected value="true">Hoạt Động</option>
										<c:forEach var="u" items="${dslx}">
											<option value="false">Khóa</option>
										</c:forEach>
										</select>
								</c:when>
							</c:choose>
						</div>
					</div>

					<div class="text-center">
						<button type="submit"
							class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
					</div>

					<!-- End Profile Edit Form -->
					<!-- End Profile Edit Form -->
				</div>
			</form:form>
		</div>
	</div>
</div>



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
				<form:form id="form-lx" method="post" modelAttribute="xk">
					<div class="row mb-3">
						<label for="machuyen"
							class="col-md-4 col-lg-3 col-form-label v-label">Biển xe</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="bienXe" type="text"
								class="form-control v-form-control" id="maloaixe" value="" />
							<form:errors style="color:red" path="bienXe" />
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate"
							class="col-md-4 col-lg-3 col-form-label v-label">Loại xe
						</label>
						<div class="col-md-8 col-lg-9">
							<form:select class='fstdropdown-select' path="lx.maLX"
								items="${dslx }" itemLabel="tenLX" itemValue="maLX">
							</form:select>
						</div>
					</div>

					<!--                         <div class="row mb-3"> -->
					<!--                             <label class="col-md-4 col-lg-3 col-form-label v-label">Số chỗ</label> -->
					<!--                             <div class="col-md-8 col-lg-9"> -->
					<%--                                 <form:input path="seat" type="text" class="form-control v-form-control" readonly = "true" id="smadd"  value = "36"/> --%>

					<!--                             </div> -->
					<!--                         </div> -->

					<div class="text-center">
						<button type="submit" name="btn-addlx"
							class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>


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
function checkInput() {
	let check = true;
	$("button[name=btn-addlx]").click(function (e){
		check = true;
		e.preventDefault();
		
		let maDD = $("#maloaixe").val()
		let regexMaDD = new RegExp(/^[0-9a-zA-Z]+$/);
		console.log("maloaixe", maDD)
		if (!regexMaDD.test(maDD) || maDD.length > 8) {
			check = false;
			$("#malx-error").text("Mã địa điểm giới hạn trong khoảng 8 ký tự, và không được có ký tự đặc biệt.");
			
			
		} else {
			check = true;
			maDD = maDD.trim().replace(/\s+/g, '');
			$("#malx-error").text("");
			$("#malx-error").val(maDD.trim());
		}
		
		let tenDD = $("#tenloaixe").val();
		let regexTenDD = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$/);

		if(!regexTenDD.test(tenDD)){
			check = false;
			$("#tenlx-error").text("Tên địa điểm không được để trống và không được có kí tự đặc biệt!")
		}else {
			$("#tenlx-error").text("")
			let namearr = tenDD.split(" ")
			tenDD = "";
			namearr.forEach((item) => {
				item = item.trim().replace(/\s+/g, '')
				if(item.length > 0){
					tenDD += item + " " 
				}
			})
			tenDD = tenDD.trim()
			$("#tenloaixe").val(tenDD);
		}
		
		if(check){
			$("#form-lx").submit();
		}
	})
}

$(document).ready(function() {
	showModalConfirm("#btn-change-state",
			"Bạn có chắc chắn muốn thực hiện?",
			"Xác nhận", "Hủy");
	console.log($(".modal_flag").attr("idModal"));
	if ($(".modal_flag").attr("idModal") === "modalCreate") {
		$("#verticalycentered").modal("show");
	}else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
		$("#ProfileEditModal").modal("show");
	}else if ($(".modal_flag").attr("idModal") === "modalTT") {
		$("#Edittrangthai").modal("show");
	}
})
</script>