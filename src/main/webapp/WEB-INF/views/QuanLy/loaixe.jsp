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
		<h1>Loại xe</h1>
	</div>
	<!-- End Page Title -->
	<a href="/CNPM/quanly/loaixe/insert.html"><button type="button"
			class="btn add-new btn-outline-danger shadow-none">
			Thêm mới <i class="bi bi-plus-circle"></i>
		</button></a>
	<section class="section">
		<div class="row">
			<div class="col-lg-12 card">
				<div class="card-body">
					<!-- Table with stripped rows -->
					<table id="bangloaixe" class="table table-striped table-bordered">
						<thead>
							<tr class="v-table-tr-color">
								<th scope="col">Mã loại xe</th>
								<th scope="col">Tên loại xe</th>
								<th scope="col">Số chỗ</th>
								<th scope="col" class="text-center">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dslx}">
								<tr>
									<th scope="row">${u.maLX }</th>
									<td>${u.tenLX}</td>
									<td>${u.seat}</td>
									<td><span><a
											href="/CNPM/quanly/loaixe/${u.maLX}.html?update"><i
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
			<form:form id="form-lxs" method="post" modelAttribute="lx">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Chỉnh sửa cho loại xe
						</h5>
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
							class="col-md-4 col-lg-3 col-form-label v-label">Mã loại
							xe</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="maLX" type="text"
								class="form-control v-form-control" readonly="true"  />
								
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate"
							class="col-md-4 col-lg-3 col-form-label v-label">Tên loại xe
						</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="tenLX" type="text"
								class="form-control v-form-control" id="tenloaixes" />
							<form:errors style="color:red" path="tenLX" />
							<p id="tenlxs-error" class="text-danger"></p>
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate"
							class="col-md-4 col-lg-3 col-form-label v-label">Giá loại
							xe </label>
						<div class="col-md-8 col-lg-9">
							<form:input path="giaLX" type="text"
								class="form-control v-form-control" 
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
							<form:errors style="color:red" path="giaLX" />
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Số
							chỗ  </label>
						<div class="col-md-8 col-lg-9">
							<form:input path="seat" type="text"
								class="form-control v-form-control" id="sochos" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');"  />
								<form:errors style="color:red" path="seat" />	
								<p id="sochos-error" class="text-danger"></p>
						</div>
					</div>

					<div class="text-center">
						<button type="submit" name="btn-sualx"
							class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
					</div>

					<!-- End Profile Edit Form -->
					<!-- End Profile Edit Form -->
				</div>
		</div>
		</form:form>
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
				<!-- Profile Edit Form -->
				<form:form id="form-lx" method="post" modelAttribute="lx">
					<div class="row mb-3">
						<label for="machuyen"
							class="col-md-4 col-lg-3 col-form-label v-label">Mã loại
							xe</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="maLX" type="text"
								class="form-control v-form-control" id="maloaixe" />
							<form:errors style="color:red" path="maLX" />
							<p id="malx-error" class="text-danger"></p>
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate"
							class="col-md-4 col-lg-3 col-form-label v-label">Loại xe
						</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="tenLX" type="text"
								class="form-control v-form-control" id="tenloaixe" />
							<form:errors style="color:red" path="tenLX" />
							<p id="tenlx-error" class="text-danger"></p>
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputDate"
							class="col-md-4 col-lg-3 col-form-label v-label">Giá loại
							xe </label>
						<div class="col-md-8 col-lg-9">
							<form:input path="giaLX" type="text"
								class="form-control v-form-control" id="gialx"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
							<form:errors style="color:red" path="giaLX" />
							<p id="gialx-error" class="text-danger"></p>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Số
							chỗ </label>
						<div class="col-md-8 col-lg-9">
							<form:input path="seat" type="text"
								class="form-control v-form-control" id="tsocho" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');" />
							<form:errors style="color:red" path="seat" />	
							<p id="tchotrong-error" class="text-danger"></p>					
						</div>
					</div>

					<div class="text-center">
						<button type="submit" name="btn-addlx"
							class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
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
		let regexTenDD = new RegExp(/^[\s0-9a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$/);

		if(!regexTenDD.test(tenDD)){
			check = false;
			$("#tenlx-error").text("Tên loại xe không được để trống và không được có kí tự đặc biệt!")
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
		let socho = $("#tsocho").val()
		if(!socho){
			$("#tchotrong-error").text("Số chỗ không được trống");
			check = false;
			
		}else{
			$("#tchotrong-error").text("")
			
		}
		if(check){
			$("#form-lx").submit();
		}
	})
}
function checkEdit() {
	let check = true;
	$("button[name=btn-sualx]").click(function (e){
		check = true;
		e.preventDefault();
		
		
		let tenDD = $("#tenloaixes").val();
		let regexTenDD = new RegExp(/^[\s0-9a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$/);

		if(!regexTenDD.test(tenDD)){
			check = false;
			$("#tenlxs-error").text("Tên loại xe không được để trống và không được có kí tự đặc biệt!")
		}else {
			$("#tenlxs-error").text("")
			let namearr = tenDD.split(" ")
			tenDD = "";
			namearr.forEach((item) => {
				item = item.trim().replace(/\s+/g, '')
				if(item.length > 0){
					tenDD += item + " " 
				}
			})
			tenDD = tenDD.trim()
			$("#tenloaixes").val(tenDD);
		}
		
		let socho = $("#sochos").val()
		if(!socho){
			$("#sochos-error").text("Số chỗ không được trống");
			check = false;
			
		}else{
			$("#sochos-error").text("")
			
		}
		
		if(check){
			$("#form-lxs").submit();
		}
	})
}

	$(document).ready(function() {
		const datatbl = new simpleDatatables.DataTable("#bangloaixe", {
			labels: {
			    placeholder: "Tìm kiếm...",
			    perPage: "{select} dòng mỗi trang",
			    noRows: "Không tìm thấy dữ liệu",
			    info: "{page} / {pages}",
			}})
		
		checkInput();
		checkEdit();
		console.log($(".modal_flag").attr("idModal"));
		if ($(".modal_flag").attr("idModal") === "modalCreate") {
			$("#verticalycentered").modal("show");
		}else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
			$("#ProfileEditModal").modal("show");
		}
	})
</script>


