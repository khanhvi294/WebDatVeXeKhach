<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="slidebar.jsp"%>

<main id="main" class="main">

	<div class="pagetitle">
		<h1>Trang cá nhân</h1>
	</div>
	<!-- End Page Title -->

	<section class="section profile">
		<div class="row">

			<div class="col-xl-10">

				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item "><a
								href="/CNPM/quanly/trangcanhan.html"></a><button data-bs-toggle="tab"
										data-bs-target="#profile-edit"
										class="nav-link v-nav-link active v-active">Chỉnh sửa
										thông tin</button></li>

							<li class="nav-item"><a
								href="/CNPM/quanly/trangcanhan/changepw.html"></a><button
										class="nav-link v-nav-link v-active" data-bs-toggle="tab"
										data-bs-target="#profile-change-password">Đổi mật
										khẩu</button></li>
						</ul>
						<div class="tab-content pt-2">
							<div class="tab-pane fade show active profile-edit pt-3"
								id="profile-edit">

								<!-- Profile Edit Form -->
								<form:form action="quanly/trangcanhan.html" method="post"
									modelAttribute="nv">
									<div class="row mb-3">
										<label for="fullName"
											class="col-md-4 col-lg-3 col-form-label v-label">Mã
											nhân viên</label>
										<div class="col-md-8 col-lg-9">
											<form:input path="maNV" type="text"
												class="form-control v-form-control" id="fullName"
												readonly="true" value="${nv.maNV }" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="company" class="col-md-3 col-form-label v-label">Họ</label>
										<div class="col-md-3">
											<form:input path="hoNV" type="text"
												class="form-control v-form-control" id="company"
												value="${nv.hoNV }" />
										</div>

										<label for="Job" class="col-md-1 col-form-label v-label">Tên</label>
										<div class="col-md-5">
											<form:input path="tenNV" type="text"
												class="form-control  v-form-control" id="Job"
												value="${nv.tenNV }" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Twitter"
											class="col-md-4 col-lg-3 col-form-label v-label">Username</label>
										<div class="col-md-8 col-lg-9">
											<form:input path="tknv.userName" type="text"
												class="form-control v-form-control" id="Twitter"
												readonly="true" value="${nv.tknv.userName }" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Twitter"
											class="col-md-4 col-lg-3 col-form-label v-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<form:input path="tknv.email" type="email"
												class="form-control v-form-control"
												value="${nv.tknv.email }" />
											<form:errors style="color:red" path="maNV" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Twitter"
											class="col-md-4 col-lg-3 col-form-label v-label">Vai
											trò</label>
										<div class="col-md-8 col-lg-9">
											<form:input path="tknv.vaiTro.tenVT" type="text"
												class="form-control v-form-control" readonly="true"
												value="${nv.tknv.vaiTro.tenVT }" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Country"
											class="col-md-4 col-lg-3 col-form-label v-label">CMND/CCCD</label>
										<div class="col-md-8 col-lg-9">
											<form:input path="cccd" type="text"
												class="form-control v-form-control" value="${nv.cccd }" />
											<form:errors style="color:red" path="cccd" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Address"
											class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label>
										<div class="col-md-8 col-lg-9">
											<form:input path="sdt" type="text"
												class="form-control v-form-control" id="Address"
												value="${nv.sdt }" />
											<form:errors style="color:red" path="sdt" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Phone"
											class="col-md-4 col-lg-3 col-form-label v-label">Ngày
											sinh</label>
										<div class="col-md-8 col-lg-9">
											<input name="ngaysinh" type="date"
												class="form-control v-form-control" id="Phone"
												value="${ngaysinh }" />
										</div>
									</div>

									<div class="row mb-3">
										<label for="Email"
											class="col-md-4 col-lg-3 col-form-label v-label">Phái</label>
										<div class="col-md-8">
											<%--                                             	<c:choose> --%>
											<%-- 												<c:when test="${nv.phai eq true}"> --%>
											<!-- 													<div class="form-check form-check-inline "> -->
											<!-- 	                                                    <input class="form-check-input v-check-input shadow-none" -->
											<!-- 	                                                        type="radio" name="gridRadios" id="gtnam" value="option1" -->
											<!-- 	                                                        checked> -->
											<!-- 	                                                    <label class="form-check-label" for="gridRadios1"> -->
											<!-- 	                                                        Nam -->
											<!-- 	                                                    </label> -->
											<!-- 	                                                </div> -->
											<!-- 	                                                <div class="form-check form-check-inline "> -->
											<!-- 	                                                    <input class="form-check-input v-check-input shadow-none" -->
											<!-- 	                                                        type="radio" name="gridRadios" id="gtnu" value="option2"> -->
											<!-- 	                                                    <label class="form-check-label" for="gridRadios2"> -->
											<!-- 	                                                        Nữ -->
											<!-- 	                                                    </label> -->
											<!-- 	                                                </div> -->
											<%-- 												</c:when> --%>
											<%-- 												<c:when test="${nv.phai eq false}"> --%>
											<!-- 														<div class="form-check form-check-inline "> -->
											<!-- 	                                                    <input class="form-check-input v-check-input shadow-none" -->
											<!-- 	                                                        type="radio" name="gridRadios" id="gtnam" value="option1" -->
											<!-- 	                                                        > -->
											<!-- 	                                                    <label class="form-check-label" for="gridRadios1"> -->
											<!-- 	                                                        Nam -->
											<!-- 	                                                    </label> -->
											<!-- 	                                                </div> -->
											<!-- 	                                                <div class="form-check form-check-inline "> -->
											<!-- 	                                                    <input class="form-check-input v-check-input shadow-none" -->
											<!-- 	                                                        type="radio" name="gridRadios" id="gtnu" value="option2" checked> -->
											<!-- 	                                                    <label class="form-check-label" for="gridRadios2"> -->
											<!-- 	                                                        Nữ -->
											<!-- 	                                                    </label> -->
											<!-- 	                                                </div> -->
											<%-- 												</c:when> --%>
											<%-- 											</c:choose> --%>
											<div class="form-check form-check-inline ">
												<form:radiobutton
													class="form-check-input v-check-input shadow-none"
													value="1" path="phai" />
												<label class="form-check-label"> Nam </label>
											</div>
											<div class="form-check form-check-inline ">
												<form:radiobutton
													class="form-check-input v-check-input shadow-none"
													value="0" path="phai" />
												<label class="form-check-label"> Nữ </label>
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
							<div class="modal_flag" idModal="${idModal }"></div>
							<div class="tab-pane fade pt-3" id="profile-change-password">
								<!-- Change Password Form -->
								<form method="post" action="trangcanhan/changepw.html">

									<div class="row mb-3">
										<label for="currentPassword"
											class="col-md-4 col-lg-3 col-form-label v-label">Mật
											khẩu hiện tại</label>
										<div class="col-md-8 col-lg-9">
											<input name="password" type="password"
												class="form-control v-form-control" id="currentPassword">
											<span style="color: red">${messpassword }</span>
										</div>
									</div>

									<div class="row mb-3">
										<label for="newPassword"
											class="col-md-4 col-lg-3 col-form-label  v-label">Mật
											khẩu mới</label>
										<div class="col-md-8 col-lg-9">
											<input name="pw" type="password"
												class="form-control v-form-control" id="newPassword">
											<span style="color: red">${messpw }</span>
										</div>
									</div>

									<div class="row mb-3">
										<label for="renewPassword"
											class="col-md-4 col-lg-3 col-form-label  v-label">Nhập
											lại mật khẩu mới</label>
										<div class="col-md-8 col-lg-9">
											<input name="rpw" type="password"
												class="form-control v-form-control" id="renewPassword">
											<span style="color: red">${messrpw }</span>
										</div>
									</div>

									<div class="text-center">
										<button type="submit"
											class="btn btn-primary btn-main-color border-0 shadow-none">Save
											Changes</button>
									</div>
								</form>
								<!-- End Change Password Form -->

							</div>

						</div>
						<!-- End Bordered Tabs -->

					</div>
				</div>

			</div>
		</div>
	</section>

</main>
<!-- End #main -->
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
<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		console.log($(".modal_flag").attr("idModal"));
		if ($(".modal_flag").attr("idModal") === "modalCreate") {
			$("#profile-change-password").modal("show");
		}
	})
</script>