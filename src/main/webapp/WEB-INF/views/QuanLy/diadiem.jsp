<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="slidebar.jsp"%>

<main id="main" class="main">
        <div class="pagetitle">
            <h1>Địa Điểm</h1>
        </div>
        <!-- End Page Title -->
        <a href="/CNPM/quanly/diadiem/insert.html"><button
				type="button" class="btn add-new btn-outline-danger shadow-none">
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
                                    <th scope="col">Mã địa điểm</th>
                                    <th scope="col">Địa điểm</th>
                                    <th scope="col" class="text-center">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="u" items="${dsdd}">
								<tr>
									<th scope="row">${u.maDD}</th>
									<td>${u.diaDiem }</td>
									<td><span><a href="/CNPM/quanly/diadiem/${u.maDD}.html?update"><i
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
                    <form:form method = "post" modelAttribute="dd">
                        <div class="row mb-3">
                            <label for="machuyen" class="col-md-4 col-lg-3 col-form-label v-label">Mã địa điểm</label>
                            <div class="col-md-8 col-lg-9">
                                <form:input path="maDD" type="text" readonly="true" class="form-control v-form-control" id="smadd" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputDate" class="col-md-4 col-lg-3 col-form-label v-label">Địa điểm </label>
                            <div class="col-md-8 col-lg-9">
                                <form:input path="diaDiem" type="text" class="form-control v-form-control" id="sdiadiem" />
                                <form:errors style = "color:red" path="diaDiem"/>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
                        </div>
                    </form:form>
                    <!-- End Profile Edit Form -->
                    <!-- End Profile Edit Form -->
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="verticalycentered" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered v-modal-add">
            <div class="modal-content border-0">
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Thêm</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight: 700;"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body modal-add">
                    <!-- Profile Edit Form -->
                    <form:form method = "post" modelAttribute="dd">
                        <div class="row mb-3">
                            <label for="machuyen" class="col-md-4 col-lg-3 col-form-label v-label">Mã địa điểm</label>
                            <div class="col-md-8 col-lg-9">
                                <form:input path="maDD" type="text" class="form-control v-form-control" id="madd" />
                                <form:errors style = "color:red" path="maDD"/>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputDate" class="col-md-4 col-lg-3 col-form-label v-label">Địa điểm </label>
                            <div class="col-md-8 col-lg-9">
                                <form:input path="diaDiem" type="text" class="form-control v-form-control" id="diadiem" />
                                <form:errors style = "color:red" path="diaDiem"/>
                            </div>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
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
		} else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
			$("#ProfileEditModal").modal("show");
		}
	})
</script>
<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>