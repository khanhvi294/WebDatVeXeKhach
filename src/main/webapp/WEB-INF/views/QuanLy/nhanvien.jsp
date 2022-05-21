<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="head.jsp"%>
 <%@ include file="header.jsp"%>
    <%@ include file="slidebar.jsp" %>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Nhân Viên</h1>
        </div><!-- End Page Title -->
        <button type="button" class="btn add-new btn-outline-danger shadow-none" data-bs-toggle="modal"
            data-bs-target="#verticalycentered">
            Thêm mới <i class="bi bi-person-plus"></i>
        </button>
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
                                    <th scope="col">Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">NV001</th>
                                    <td>Nguyễn</td>
                                    <td>Thị Khánh Vi</td>
                                    <td>nv001</td>
                                    <td>
                                        <span class="badge rounded-pill bg-success v-bg-tt">Hoạt động</span>
                                    </td>
                                    <td>

                                        <span>
                                            <i class="bi bi-info-circle-fill v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileViewModal"></i>
                                            <i class="bi bi-pencil-square v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileEditModal"></i>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Bridie Kessler</td>
                                    <td>Developer</td>
                                    <td>35</td>
                                    <td>
                                        <span class="badge rounded-pill bg-success v-bg-tt">Hoạt động</span>
                                    </td>
                                    <td>

                                        <span>
                                            <i class="bi bi-info-circle-fill v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileViewModal"></i>
                                            <i class="bi bi-pencil-square v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileEditModal"></i>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope=" row">3</th>
                                    <td>Ashleigh Langosh</td>
                                    <td>Finance</td>
                                    <td>45</td>
                                    <td>
                                        <span class="badge rounded-pill bg-success v-bg-tt">Hoạt động</span>
                                    </td>

                                    <td>
                                        <span>
                                            <i class="bi bi-info-circle-fill v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileViewModal"></i>
                                            <i class="bi bi-pencil-square v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileEditModal"></i>
                                        </span>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>Angus Grady</td>
                                    <td>HR</td>
                                    <td>34</td>
                                    <td>
                                        <span type="button" class="badge rounded-pill bg-danger v-bg-tt">Khóa</span>
                                    </td>
                                    <td>
                                        <span>
                                            <i class="bi bi-info-circle-fill v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileViewModal"></i>
                                            <i class="bi bi-pencil-square v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileEditModal"></i>
                                        </span>

                                    </td>

                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>Raheem Lehner</td>
                                    <td>Dynamic Division Officer</td>
                                    <td>47</td>
                                    <td>
                                        <span type="button" class="badge rounded-pill bg-danger v-bg-tt">Khóa</span>
                                    </td>
                                    <td>
                                        <span>
                                            <i class="bi bi-info-circle-fill v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileViewModal"></i>
                                            <i class="bi bi-pencil-square v-icon-modal" data-bs-toggle="modal"
                                                data-bs-target="#ProfileEditModal"></i>
                                        </span>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- End Table with stripped rows -->

                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->
    <!-- ProfileViewModal -->
    <div class="modal fade" id="ProfileViewModal" tabindex="-1">
        <div class="modal-dialog v-modal-container">
            <div class="modal-content border-0">
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Thông tin</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight:700"><i class="bi bi-x v-icon-close"></i></button>
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
                                                        <div class="col-lg-3 col-md-4 label v-label ">Mã nhân viên</div>
                                                        <div class="col-lg-9 col-md-8">NV01</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Họ</div>
                                                        <div class="col-lg-9 col-md-8">Lueilwitz
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Tên</div>
                                                        <div class="col-lg-9 col-md-8">Web Designer</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Vai trò</div>
                                                        <div class="col-lg-9 col-md-8">Web Designer</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Email</div>
                                                        <div class="col-lg-9 col-md-8">Web Designer</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Phái</div>
                                                        <div class="col-lg-9 col-md-8">k.anderson@example.com</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Trạng thái</div>
                                                        <div class="col-lg-9 col-md-8">k.anderson@example.com</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">CMND/CCCD</div>
                                                        <div class="col-lg-9 col-md-8">USA</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">SĐT</div>
                                                        <div class="col-lg-9 col-md-8">A108 Adam Street, New York, NY
                                                            535022</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 label v-label">Ngày sinh</div>
                                                        <div class="col-lg-9 col-md-8">(436) 486-3538 x29071</div>
                                                    </div>

                                                </div>
                                            </div><!-- End Bordered Tabs -->

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
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight:700"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body row">
                    <!-- profile -->
                    <!-- Profile Edit Form -->
                    <div class="col-12 v-edit-form">
                        <form>
                            <div class="row mb-3">
                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label v-label">Mã nhân
                                    viên</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="fullName" type="text" class="form-control v-form-control" id="fullName"
                                        value="Kevin Anderson">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="company" class="col-md-3 col-form-label v-label">Họ</label>
                                <div class="col-md-3">
                                    <input name="company" type="text" class="form-control v-form-control" id="company"
                                        value="Lueilwitz, Wisoky and Leuschke">
                                </div>

                                <label for="Job" class="col-md-1 col-form-label v-label">Tên</label>
                                <div class="col-md-5">
                                    <input name="job" type="text" class="form-control  v-form-control" id="Job"
                                        value="Web Designer">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Username</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="twitter" type="text" class="form-control v-form-control" id="Twitter"
                                        value="https://twitter.com/#">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Email</label>
                                <div class="col-md-8 col-lg-9">
                                    <input type="email" class="form-control v-form-control">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Mật Khẩu</label>
                                <div class="col-md-8 col-lg-9">
                                    <input type="password" class="form-control v-form-control">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Nhập lại mật
                                    Khẩu</label>
                                <div class="col-md-8 col-lg-9">
                                    <input type="password" class="form-control v-form-control">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Vai trò</label>
                                <div class="col-md-8 col-lg-9">
                                    <select class="form-select v-form-control" aria-label=" select example">
                                        <option selected value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Country" class="col-md-4 col-lg-3 col-form-label v-label">CMND/CCCD</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="country" type="text" class="form-control v-form-control" id="Country"
                                        value="USA">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Address" class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="address" type="text" class="form-control v-form-control" id="Address"
                                        value="A108 Adam Street, New York, NY 535022">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Phone" class="col-md-4 col-lg-3 col-form-label v-label">Ngày sinh</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="phone" type="text" class="form-control v-form-control" id="Phone"
                                        value="(436) 486-3538 x29071">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="Email" class="col-md-4 col-lg-3 col-form-label v-label">Phái</label>
                                <div class="col-md-8">
                                    <div class="form-check form-check-inline ">
                                        <input class="form-check-input v-check-input shadow-none" type="radio"
                                            name="gridRadios" id="gtnam" value="option1" checked>
                                        <label class="form-check-label" for="gridRadios1">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline ">
                                        <input class="form-check-input v-check-input shadow-none" type="radio"
                                            name="gridRadios" id="gtnu" value="option2">
                                        <label class="form-check-label" for="gridRadios2">
                                            Nữ
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Trạng thái</label>
                                <div class="col-md-8 col-lg-9">
                                    <select class="form-select v-form-control" aria-label=" select example">
                                        <option selected value="1">One</option>
                                        <option value="2">Two</option>
                                    </select>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-main-color border-0 shadow-none"
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




    <!-- Vertically centered Modal -->
    <div class="modal fade" id="verticalycentered" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered v-modal-add">
            <div class="modal-content border-0">
                <div class="modal-header v-modal-header">
                    <h5 class="modal-title v-modal-title">Thêm</h5>
                    <button type="button" class="btn shadow-none" data-bs-dismiss="modal" aria-label="Close"
                        style="font-weight:700"><i class="bi bi-x v-icon-close"></i></button>
                </div>
                <div class="modal-body modal-add">
                    <!-- Profile Edit Form -->
                    <form>
                        <div class="row mb-3">
                            <label for="fullName" class="col-md-4 col-lg-3 col-form-label v-label">Mã nhân viên</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="fullName" type="text" class="form-control v-form-control" id="fullName"
                                    value="Kevin Anderson">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="company" class="col-md-3 col-form-label v-label">Họ</label>
                            <div class="col-md-3">
                                <input name="company" type="text" class="form-control v-form-control" id="company"
                                    value="Lueilwitz, Wisoky and Leuschke">
                            </div>

                            <label for="Job" class="col-md-1 col-form-label v-label">Tên</label>
                            <div class="col-md-5">
                                <input name="job" type="text" class="form-control  v-form-control" id="Job"
                                    value="Web Designer">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Username</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="twitter" type="text" class="form-control v-form-control" id="Twitter"
                                    value="https://twitter.com/#">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Email</label>
                            <div class="col-md-8 col-lg-9">
                                <input type="email" class="form-control v-form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Mật Khẩu</label>
                            <div class="col-md-8 col-lg-9">
                                <input type="password" class="form-control v-form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Nhập lại mật
                                Khẩu</label>
                            <div class="col-md-8 col-lg-9">
                                <input type="password" class="form-control v-form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Twitter" class="col-md-4 col-lg-3 col-form-label v-label">Vai trò</label>
                            <div class="col-md-8 col-lg-9">
                                <select class="form-select v-form-control" aria-label=" select example">
                                    <option selected value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Country" class="col-md-4 col-lg-3 col-form-label v-label">CMND/CCCD</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="country" type="text" class="form-control v-form-control" id="Country"
                                    value="USA">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Address" class="col-md-4 col-lg-3 col-form-label v-label">SĐT</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="address" type="text" class="form-control v-form-control" id="Address"
                                    value="A108 Adam Street, New York, NY 535022">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Phone" class="col-md-4 col-lg-3 col-form-label v-label">Ngày sinh</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="phone" type="text" class="form-control v-form-control" id="Phone"
                                    value="(436) 486-3538 x29071">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Email" class="col-md-4 col-lg-3 col-form-label v-label">Phái</label>
                            <div class="col-md-8">
                                <div class="form-check form-check-inline ">
                                    <input class="form-check-input v-check-input shadow-none" type="radio"
                                        name="gridRadios" id="gtnam" value="option1" checked>
                                    <label class="form-check-label" for="gridRadios1">
                                        Nam
                                    </label>
                                </div>
                                <div class="form-check form-check-inline ">
                                    <input class="form-check-input v-check-input shadow-none" type="radio"
                                        name="gridRadios" id="gtnu" value="option2">
                                    <label class="form-check-label" for="gridRadios2">
                                        Nữ
                                    </label>
                                </div>
                            </div>
                        </div>


                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-main-color border-0 shadow-none"
                                style="padding: 8px 20px">Lưu
                            </button>
                        </div>
                    </form><!-- End Profile Edit Form -->
                </div>
            </div>
        </div>
    </div><!-- End Vertically centered Modal-->
    <!-- Vendor JS Files -->
    <script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/chart.js/chart.min.js"></script>
    <script src="../assets/vendor/echarts/echarts.min.js"></script>
    <script src="../assets/vendor/quill/quill.min.js"></script>
    <script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="../assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="../assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../assets/js/main.js"></script>
