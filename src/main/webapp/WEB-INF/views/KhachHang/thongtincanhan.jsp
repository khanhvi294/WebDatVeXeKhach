<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Jewel Theme">
        <meta name="description" content="Wheel - Responsive and Modern Car Rental Website Template">
        <meta name="keywords" content="">
        <title>Wheel - Responsive and Modern Car Rental Website Template</title>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <!-- reset css -->
        <link rel="stylesheet" type="text/css" href="resources/KhachHang/assets/css/css_reset.css">
        <!-- bootstrap -->
        <link rel="stylesheet" type="text/css" href="resources/KhachHang/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="resources/KhachHang/assets/css/jquery.datetimepicker.min.css">
        <link href="resources/KhachHang/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="resources/KhachHang/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="resources/KhachHang/assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="resources/KhachHang/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="resources/KhachHang/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="resources/KhachHang/assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="resources/KhachHang/assets/css/bootstrap-select.min.css">
        <!-- preload -->
        <link rel="stylesheet" type="text/css" href="resources/KhachHang/assets/css/loaders.min.css">
        <link rel="stylesheet" type="text/css" href="resources/KhachHang/assets/css/index.css">

        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      
       
      
        <link href="resources/KhachHang/assets/css/style1.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
    </head>
    <body class="">
        <!-- MAIN -->
        <div class="load-wrap">
            <div class="wheel-load">
                <img src="images/loader.gif" alt="" class="image">
            </div>
        </div>
         <%@include file="navbar.jsp"%>
        <!-- /////////////////////////////// -->
        <div class="wheel-start3">
            <img src="images/bg7.jpg" alt="" class="wheel-img">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 padd-lr0">
                        <div class="wheel-start3-body clearfix marg-lg-t255 marg-lg-b75 marg-sm-t190 marg-xs-b30">
                            <h3>Thông tin cá nhân</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /////////////////////////////////// -->
        <div class="wheel-register-block">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-8 marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100 ">             
                        <div class="card">
                          <div class="card-body">
                            <form:form action="thongtincanhan.html" modelAttribute="khachhang" class="row g-3" method="post">
                              <form:hidden path="maKH" class="form-control" />
                               <form:hidden path="tkkh.userName" class="form-control" />
                              <div class="col-md-12" style="margin-top:40px">
                                <label for="inputName5" class="form-label">Họ</label>
                                <form:input path="hoKH" type="text" class="form-control" id="inputName5"/>
                              </div>
                              <div class="col-md-12" style="margin-top:40px">
                                <label for="inputName5" class="form-label"> Tên</label>
                                <form:input path="TenKH" type="text" class="form-control" id="inputName5"/>
                              </div>
                              <div class="col-md-12">
                                <label class="col-form-label">Giới tính</label>
                                <div class="row">
                                  <div class="col-sm-2"  style="margin-left:60px">
                                    <div class="form-check"  >
                                      <form:radiobutton path="phai" class="form-check-input" id="gridRadios1" value="0"/>
                                      <label class="form-check-label" for="gridRadios1">
                                        Nam
                                      </label>
                                    </div>
                                  </div>
                                  <div class="col-sm-2">
                                    <div class="form-check">
                                      <form:radiobutton path="phai" class="form-check-input" id="gridRadios2" value="1"/>
                                      <label class="form-check-label" for="gridRadios2">
                                        Nữ
                                      </label>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            
                              <div class="col-md-12">
                                <label for="inputDate" class="form-label">Ngày sinh</label>
                                <div class="col-md-12">
                                  <form:input path="ngSinh" type="date" class="form-control"/>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <label for="inputName5" class="form-label">Email</label>
                                <form:input path="tkkh.email" type="text" class="form-control" id="inputName5"/>
                              </div>
                              <div class="col-md-12">
                                <label for="inputName5" class="form-label">SĐT</label>
                                <form:input path="sdt" type="text" class="form-control" id="inputName5"/>
                              </div>
                      
                              <div class="text-center">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                              </div>
                            </form:form>
              
                          </div>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
                    
        <!-- FOOTER -->
        <!-- ///////////////// -->
        <footer class="wheel-footer">
            <img src="images/bg4.jpg" alt="" class="wheel-img">
            <div class="container">
                <div class="row">
                    <div class="col-md-3  col-sm-6  padd-lr0">
                        <div class="wheel-address">
                            <div class="wheel-footer-logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
                            <ul>
                                <li><span><i class="fa fa-map-marker"></i>97 Man Thiện, Phường Hiệp Phú <br>
                                    TP Thủ Đức, TP Hồ Chí Minh 
                                </li>
                                <li><a href="#"><span><i class="fa fa-phone"></i> 0912345678</span></a></li>
                                <li><a href="#"><span><i class="fa fa-envelope"></i>p.h.n.phuong1812@gmail.com</span></a></li>
                            </ul>
                            <div class="wheel-soc">
                                <a href="#" class="fa fa-twitter"></a>
                                <a href="#" class="fa fa-facebook"></a>
                                <a href="#" class="fa fa-linkedin"></a>
                                <a href="#" class="fa fa-instagram"></a>
                                <a href="#" class="fa fa-share-alt"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6  padd-lr0">
                        <div class="wheel-footer-item">
                            <h3>Whell</h3>
                            <ul>
                                <li><a href="about.html" class="">Về chúng tôi</a></li>
                                <li><a href="news.html" class="">Tin tức</a></li>
                                <li><a href="about.html" class="">Giới thiệu</a></li>
                                <li><a href="contact.html" class="">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-6  padd-lr0">
                        <div class="wheel-footer-item ">
                            <h3><span>Chăm sóc khách hàng</span> 1900 6886 </h3>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div class="wheel-footer-info wheel-bg6">
            <div class="container">
                <div class="row">
                   <div class="col-lg-8 col-sm-6  padd-lr0"><span>&#169; WHEEL 2021</span></div>
                    <div class="col-lg-4 col-sm-6 padd-lr0">
                        <ul>
                            <li><a href="index.html">Trang chủ</a></li>
                            <li><a href="reservation.html"> Đặt vé</a></li>
                            <li><a href="contact.html"> Liên hệ</a></li>
                            <li><a href="about.html"> Giới thiệu</a></li>
                            <li><a href="news.html">Tin tức</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scripts project -->
        <script type="text/javascript" src="resources/KhachHang/assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="resources/KhachHang/assets/js/bootstrap.min.js"></script>
        <!-- count -->
        <script type="text/javascript" src='resources/KhachHang/assets/js/jquery.countTo.js'></script>
        <!-- google maps -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBt5tJTim4lOO3ojbGARhPd1Z3O3CnE-C8" type="text/javascript"></script>
        <!-- swiper -->
        <script type="text/javascript" src="resources/KhachHang/assets/js/idangerous.swiper.min.js"></script>
        <script type="text/javascript" src="resources/KhachHang/assets/js/equalHeightsPlugin.js"></script>
        <script type="text/javascript" src="resources/KhachHang/assets/js/jquery.datetimepicker.full.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script type="text/javascript" src="resources/KhachHang/assets/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="resources/KhachHang/assets/js/index.js"></script>
        <!-- sixth block end -->
    </body>

</html>