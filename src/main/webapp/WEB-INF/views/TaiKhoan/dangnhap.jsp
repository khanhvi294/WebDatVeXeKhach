<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../KhachHang/head.jsp"%>
    <body class="">
        <!-- MAIN -->
        <div class="load-wrap">
            <div class="wheel-load">
                <img src="resources/KhachHang/images/loader.gif" alt="" class="image">
            </div>
        </div>
   <%@include file="../KhachHang/navbar.jsp"%>
        <!-- /////////////////////////////// -->
        <div class="wheel-start3">
            <img src="resources/KhachHang/images/bg7.jpg" alt="" class="wheel-img">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 padd-lr0">
                        <div class="wheel-start3-body clearfix marg-lg-t255 marg-lg-b75 marg-sm-t190 marg-xs-b30">
                            <h3>Đăng nhập</h3>
                            <ol class="breadcrumb">
                                <li><a href="index.html">Trang chủ</a></li>
                                <li class="active">Đăng nhập</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /////////////////////////////////// -->
          ${message}
        <div class="wheel-register-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 ">
                        <div class="wheel-register-log marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100">
                            <div class="wheel-header">
                                <h5>Đăng Nhập</h5>
                            </div>
                            <form:form action="dangnhap.html"  method="post" modelAttribute="taikhoan" >
                                <label for="userName" class="fa fa-user">
                                <form:input path="userName" id="userName" placeholder='Tên đăng nhập / Email'/></label>
                                <label for="userPass" class="fa fa-lock">
                                <form:input type="password" path="matKhau" id="userPass" placeholder='Mật khẩu'/></label>
                                <button type="submit" class="wheel-btn">Đăng nhập ngay</button>
                                <label class="password-sing clearfix" for="input-val2">
                                    <input type='checkbox' id='input-val2'> <span>Nhớ mật khẩu</span>
                                    <a href="forgot.html">Quên mật khẩu</a>
                                </label>
                            </form:form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
                    
        <!-- /////////////////////////////// -->
        <div class="wheel-subscribe wheel-bg2">
            <div class="container ">
                <div class="row">
                    <div class="col-md-6 padd-lr0">
                        <div class="wheel-header">
                            <h5>Đăng kí để nhận tin</h5>
                            <h3>Đăng kí ngay và bạn sẽ được nhận mã giảm giá<span> 20% </span></h3>
                        </div>
                    </div>
                    <div class="col-md-6 padd-lr0">
                        <form action="#">
                            <input type="text" placeholder="Địa chỉ gmail của bạn ">
                            <a href="register.html" class="wheel-cheader-but" target="_blank">Đăng kí ngay</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- FOOTER -->
        <!-- ///////////////// -->
        <footer class="wheel-footer">
            <img src="resources/KhachHang/images/bg4.jpg" alt="" class="wheel-img">
            <div class="container">
                <div class="row">
                    <div class="col-md-3  col-sm-6  padd-lr0">
                        <div class="wheel-address">
                            <div class="wheel-footer-logo"><a href="#"><img src="resources/KhachHang/images/logo2.png" alt=""></a></div>
                            <ul>
                                <li><span><i class="fa fa-map-marker"></i>121 King Street, Melbourne <br>
                                    VIC 3000, Australia  </span>
                                </li>
                                <li><a href="#"><span><i class="fa fa-phone"></i> +61 3 8376 6284</span></a></li>
                                <li><a href="#"><span><i class="fa fa-envelope"></i>contact@wheel-rental.com</span></a></li>
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
                            <h3>Useful Links</h3>
                            <ul>
                                <li><a href="#" class="">About us</a></li>
                                <li><a href="#" class="">Customer Service</a></li>
                                <li><a href="#" class="">Contact Us</a></li>
                                <li><a href="#" class="">Safety Recall</a></li>
                                <li><a href="#" class="">Privacy policy</a></li>
                                <li><a href="#" class="">Site Map</a></li>
                                <li><a href="#" class="">Terms & condition</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-6  padd-lr0">
                        <div class="wheel-footer-item ">
                            <h3>Vehicles</h3>
                            <ul>
                                <li><a href="#" class="">Exotic Cars</a></li>
                                <li><a href="#" class="">SUVs</a></li>
                                <li><a href="#" class="">Trucks</a></li>
                                <li><a href="#" class="">Mini Vans</a></li>
                                <li><a href="#" class="">Moving Trucks</a></li>
                                <li><a href="#" class="">Vans</a></li>
                                <li><a href="#" class="">RVs</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 padd-lr0">
                        <div class="wheel-footer-gallery">
                            <h3>Photo Gallery</h3>
                            <div class="  clearfix">
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i11.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i12.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i13.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i14.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i15.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i16.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i17.jpg" alt=""></a></div>
                                <div class="wheel-footer-galery-item"><a href="#"><img src="resources/KhachHang/images/i18.jpg" alt=""></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div class="wheel-footer-info wheel-bg6">
            <div class="container">
                <div class="row">
                   <div class="col-lg-8 col-sm-6  padd-lr0"><span>&#169; WHEEL 2016 | <a href="https://templatespoint.net/">Templates Point</a> </span></div>
                    <div class="col-lg-4 col-sm-6 padd-lr0">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#"> Pages</a></li>
                            <li><a href="#"> Listings</a></li>
                            <li><a href="#"> Reservation</a></li>
                            <li><a href="#">Location</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
     <%@include file="../KhachHang/script.jsp"%>
    </body>

</html>