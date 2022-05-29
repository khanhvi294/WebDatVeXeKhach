<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="slidebar.jsp"%>

<main id="main" class="main">
        <div class="pagetitle">
            <h1>Phiếu Đặt</h1>
        </div>
        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-body">
                        <!-- Table with stripped rows -->
                        <table class="table datatable table-striped table-bordered">
                            <thead>
                                <tr class="v-table-tr-color">
                                    <th scope="col">Mã phiếu đặt</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Tuyến</th>
                                    <th scope="col">Thời gian đi</th>
                                    <th scope="col">Trạng Thái</th>
                                    <th scope="col" class="text-center">Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${dspd}">
								<tr>
									<th scope="row">${u.maPD }</th>
									<th scope="row">${u.KH.maKH }</th>
									<td>${u.chuyen.tuyen.diemDi.diaDiem} - ${u.chuyen.tuyen.diemDen.diaDiem}</td>
									<td>${u.chuyen.ngKH} - ${u.chuyen.tgKh}</td>
									<td><c:choose>
												<c:when test="${u.trangThai eq 0}">
													<span class="badge rounded-pill bg-danger v-bg-tt">Chờ Thanh Toán</span>
												</c:when>
												<c:when test="${u.trangThai eq 1}">
													<span class="badge rounded-pill bg-success v-bg-tt">Đã Thanh Toán</span>
												</c:when>
												<c:when test="${u.trangThai eq 2}">
													<span class="badge rounded-pill bg-danger v-bg-tt">Đã Hủy</span>
												</c:when>
											</c:choose></td>
									<td><span><a
												href="/CNPM/quanly/phieudat/${u.maPD}.html?info">
													<i class="bi bi-info-circle-fill v-icon-modal"></i>
											</a> <a href="/CNPM/quanly/phieudat/${u.maPD}.html?update"><i
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
    <!-- ProfileViewModal -->
         <div class="modal_flag" idModal="${idModal }"></div>
    <div class="modal fade" id="ProfileViewModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content border-0" style="width: 660px;">
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Thông tin</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight: 700;"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body">
                    <!-- profile -->
                    <div id="modal-main" class="main">
                        <section class="section profile">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="card v-modal-de">
                                        <div class="card-body pt-3">
                                            <!-- Bordered Tabs -->
                                            <div class="tab-content pt-2">
                                                <div class="tab-pane fade show active profile-overview"
                                                    id="profile-overview">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Mã phiếu đặt</div>
                                                        <div class="col-lg-8 col-md-5">${pd.maPD }</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Khách hàng</div>
                                                        <div class="col-lg-8 col-md-5">${pd.KH.hoKH} ${pd.KH.tenKH}</div>
                                                    </div>

                                                    <div class="row mt-3">
                                                        <h5 class="col-lg-6 col-md-6 label v-label">Thông tin chuyến xe
                                                        </h5>
                                                    </div>
                                                    <div class="row container-ticket">
                                                        <div class="col-12">
                                                            <div class="row"
                                                                style="border-bottom: solid 1px #b1afaf;padding: 8px 0;">
                                                                <div class="col-lg-3 col-md-4 label v-label">Tuyến</div>
                                                                <div class="col-lg-8 col-md-5">
                                                                   ${pd.chuyen.tuyen.diemDi.diaDiem} - ${pd.chuyen.tuyen.diemDen.diaDiem}
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 label v-label">Chuyến
                                                                </div>
                                                                <div class="col-lg-8 col-md-5">${pd.chuyen.maChuyen }</div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 label v-label">Xe khách
                                                                </div>
                                                                <div class="col-lg-8 col-md-5">${pd.chuyen.xekhach.bienXe }</div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 label v-label">Thời gian
                                                                </div>

                                                                <div class="col-lg-4 col-md-5">${pd.chuyen.ngKH }</div>

                                                                <div class="col-lg-4 col-md-5">${pd.chuyen.tgKh }</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <h5 class="col-lg-6 col-md-6 label v-label">Thông tin vé</h5>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6" style="border: solid 1px #000">

                                                            <div class="row" style="border-bottom: solid 1px #000" ;>
                                                                <div class="col-lg-6 col-md-6 label v-label">STT
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 label v-label">Số ghế
                                                                </div>
                                                            </div>
															<c:forEach var="u" items="${vx}">
																<div class="row">
																	 <div class="col-lg-6 col-md-6">${u.key}
                                                                	</div>
                                                                	<div class="col-lg-6 col-md-6">${u.value}</div>
                                                                </div>
															</c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Tổng tiền</div>
                                                        <div class="col-lg-8 col-md-5">
                                                            <h5>${pd.tongtien }</h5>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Trạng thái</div>
                                                        <div class="col-lg-8 col-md-5">${pd.trangThai }</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Nhân viên</div>
                                                        <div class="col-lg-8 col-md-5">${pd.NV.hoNV } ${pd.NV.tenNV }</div>
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
                    <h5 class="modal-title v-modal-title">Trạng thái vé</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight: 700;"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body modal-add">
                    <!-- Profile Edit Form -->
                    <form method = "post">
                        <div class="row mb-3">
                            <div class="col-md-8 col-lg-9 mx-auto">
                                <select class="form-select v-form-control" aria-label=" select example" name = "trangthai">
                                    <option selected value="0">Chờ Thanh Toán</option>
                                    <option value="1">Đã Thanh Toán</option>
                                    <option value="2">Đã Hủy</option>
                                </select>
                            </div>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-main-color border-0">Save Changes</button>
                        </div>
                    </form>
                    <!-- End Profile Edit Form -->
                </div>
            </div>
        </div>
    </div>

<!--     <div class="modal fade" id="verticalycentered" tabindex="-1"> -->
<!--         <div class="modal-dialog modal-dialog-centered v-modal-add"> -->
<!--             <div class="modal-content border-0"> -->
<!--                 <div class="modal-header v-modal-header"> -->
<!--                     <h5 class="modal-title v-modal-title">Thêm</h5> -->
<!--                     <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close" -->
<!--                         style="font-weight: 700;"><i class="bi bi-x v-icon-close"></i></button> -->
<!--                 </div> -->
<!--                 <div class="modal-body modal-add"> -->
<!--                     Profile Edit Form -->
<%--                     <form:form modelAttribute="pd" method = "post"> --%>
                    	
<!--                         <div class="row mb-3"> -->
<!--                             <label for="machuyen" class="col-md-4 col-lg-3 col-form-label v-label">Mã chuyến</label> -->
<!--                             <div class="col-md-8 col-lg-9"> -->
<!--                                 <input name="fullName" type="text" class="form-control v-form-control" id="machuyen" -->
<!--                                     value="" /> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="row mb-3"> -->
<!--                             <label class="col-md-4 col-lg-3 col-form-label v-label">Tuyến</label> -->
<!--                             <div class="col-md-8 col-lg-9"> -->
<!--                                 <select class="form-select v-form-control" aria-label=" select example"> -->
<!--                                     <option selected value="1">One</option> -->
<!--                                     <option value="2">Two</option> -->
<!--                                     <option value="3">Three</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="row mb-3"> -->
<!--                             <label class="col-md-4 col-lg-3 col-form-label v-label">Nhân viên</label> -->
<!--                             <div class="col-md-8 col-lg-9"> -->
<!--                                 <select class="form-select v-form-control" aria-label=" select example"> -->
<!--                                     <option selected value="1">One</option> -->
<!--                                     <option value="2">Two</option> -->
<!--                                     <option value="3">Three</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="row mb-3"> -->
<!--                             <label for="inputDate" class="col-md-3 col-form-label v-label">Ngày khởi hành</label> -->
<!--                             <div class="col-md-3"> -->
<!--                                 <input type="date" class="form-control v-form-control" /> -->
<!--                             </div> -->
<!--                             <label for="inputTime" class="col-md-3 col-form-label v-label">Thời gian đi</label> -->
<!--                             <div class="col-md-3"> -->
<!--                                 <input type="time" class="form-control v-form-control" /> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="row mb-3"> -->
<!--                             <label for="Country" class="col-md-4 col-lg-3 col-form-label v-label">Giá</label> -->
<!--                             <div class="col-md-8 col-lg-9"> -->
<!--                                 <input name="country" type="text" class="form-control v-form-control" id="Country" -->
<!--                                     value="USA" /> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="row mb-3"> -->
<!--                             <label class="col-md-4 col-lg-3 col-form-label v-label">Xe khách</label> -->
<!--                             <div class="col-md-8 col-lg-9"> -->
<!--                                 <select class="form-select v-form-control" aria-label=" select example"> -->
<!--                                     <option selected value="1">One</option> -->
<!--                                     <option value="2">Two</option> -->
<!--                                     <option value="3">Three</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="text-center"> -->
<!--                             <button type="submit" class="btn btn-primary btn-main-color border-0">Save Changes</button> -->
<!--                         </div> -->
<%--                     </form:form> --%>
<!--                     End Profile Edit Form -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
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
	if ($(".modal_flag").attr("idModal") === "modalShow") {
		$("#ProfileViewModal").modal("show");

	} else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
		$("#ProfileEditModal").modal("show");
	}
})
</script>
<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>