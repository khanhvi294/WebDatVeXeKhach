<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="../KhachHang/head.jsp"%>
    <body class="">
    <div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
    
        <!-- MAIN -->
       <%@include file="../KhachHang/navbar.jsp"%>
        
        <!-- /////////////////////////////////// -->
        <div class="wheel-register-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 " style="margin-left: 300px">
                        <div class="wheel-register-log marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100">
                            <div class="wheel-header">
                                <h5>Đặt lại mật khẩu</h5>
                            </div>
                            <form action="doimatkhau.html" method="post">
                                <label for="pw" class="fa fa-lock">
                                <input type="password" id='pw' name="pw" placeholder='Mật khẩu mới'></label>
                               <span class="text-er">${messpw }</span> 
                                <label for="rpw" class="fa fa-lock">
                                <input type="password" name="rpw" id='userPass' placeholder='Xác nhận mật khẩu mới'></label>
                               <span class="text-er"> ${messrpw }</span>
                                <button type="submit" class="wheel-btn">Lưu</button>
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
        <!-- FOOTER -->
        <!-- ///////////////// -->
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
         <%@include file="../KhachHang/script.jsp"%>
    </body>

</html>