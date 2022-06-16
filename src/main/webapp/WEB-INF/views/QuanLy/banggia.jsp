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
            <h1>Bảng Giá</h1>
        </div>
        <!-- End Page Title -->
        <a href="/CNPM/quanly/banggia/insert.html"><button
				type="button" class="btn add-new btn-outline-danger shadow-none">
				Thêm mới <i class="bi bi-plus-circle"></i>
			</button></a>
        <section class="section">
            <div class="row">
                <div class="col-lg-12 card">
                    <div class="card-body">
                        <!-- Table with stripped rows -->
                        <table class="table datatable table-striped table-bordered">
                            <thead>
                                <tr class="v-table-tr-color">
                                    <th scope="col">Loại xe</th>
                                     <th scope="col">Tên Loại xe</th>
                                    <th scope="col">Tuyến</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col" class="text-center">Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${dsbg}">
								<tr>
									<th scope="row">${u.loaixe.maLX }</th>
									<th scope="row">${u.loaixe.tenLX }</th>
									<td>${u.tuyen.diemDi.diaDiem} - ${u.tuyen.diemDen.diaDiem}</td>
									<td>${u.gia}</td>
									<td><span><a href="/CNPM/quanly/banggia/${u.id.tuyen}/${u.id.loaixe}.html?update"><i
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
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Chỉnh sửa</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight: 700;"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body modal-add">
                    <!-- Profile Edit Form -->
                    <form method = "post" >
                        <div class="row mb-3">
                            <label for="machuyen" class="col-md-4 col-lg-3 col-form-label v-label">Loại xe</label>
                            <div class="col-md-8 col-lg-9">
								<input type="text" class="form-control v-form-control" readonly = "true" value = "${bg.loaixe.tenLX }" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputDate" class="col-md-4 col-lg-3 col-form-label v-label">Tuyến </label>
                            <div class="col-md-8 col-lg-9">
								
								<input type="text" class="form-control v-form-control" readonly = "true" value = "${bg.tuyen.diemDi.diaDiem} - ${bg.tuyen.diemDen.diaDiem}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-md-4 col-lg-3 col-form-label v-label">Giá</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="gia" type="text" class="form-control v-form-control" value = "${bg.gia }" />
                                 <span style = "color:red">${message }</span>
                            </div>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
                        </div>
                    </form>
                    <!-- End Profile Edit Form -->
                    <!-- End Profile Edit Form -->
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="thembanggia" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered v-modal-add">
            <div class="modal-content border-0">
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Thêm</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight: 700;"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body modal-add">
                    <!-- Profile Edit Form -->
                    <form method = "post">
                        <div class="row mb-3">
                            <label for="machuyen" class="col-md-4 col-lg-3 col-form-label v-label">Loại xe</label>
                            <div class="col-md-8 col-lg-9">
                                <select class="form-select v-form-control"
									aria-label=" select example" name="loaixe" id = "tuyen">
									<c:forEach var="lx" items="${dslx}">
										<option value="${lx.maLX}">${lx.tenLX}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputDate" class="col-md-4 col-lg-3 col-form-label v-label">Tuyến </label>
                            <div class="col-md-8 col-lg-9">
                                    <select class="form-select v-form-control"
									aria-label=" select example" name="tuyenxe" id = "tuyen">
									<c:forEach var="tx" items="${dstx}">
										<option value="${tx.maTuyen}">${tx.diemDi.diaDiem}-
											${tx.diemDen.diaDiem}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-md-4 col-lg-3 col-form-label v-label">Giá</label>
                            <div class="col-md-8 col-lg-9">
                               <input name="gia" type="text" class="form-control v-form-control" id="diadiem" />
                               <span style = "color:red">${message }</span>
                            </div>
                        </div>
						
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
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
<script
		src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<script
		src="<c:url value='/resources/KhachHang/assets/js/showMessage.js'/>"></script>


	<!-- Template Main JS File -->
	<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
	<script src="<c:url value='/resources/assets/js/my-main.js'/>"></script>
<script>
	$(document).ready(function() {
		console.log($(".modal_flag").attr("idModal"));
		if ($(".modal_flag").attr("idModal") === "modalCreate") {
			$("#thembanggia").modal("show");
		}else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
			$("#ProfileEditModal").modal("show");
		}
	})
</script>
