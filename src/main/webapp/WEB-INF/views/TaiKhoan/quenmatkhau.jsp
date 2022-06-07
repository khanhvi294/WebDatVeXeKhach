<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

 <%@include file="../KhachHang/head.jsp"%>
    <body class="">
 
  <%@include file="../KhachHang/navbar.jsp"%>
        <!-- /////////////////////////////////// -->
        <div class="wheel-register-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 " style="margin-left: 300px">
                        <div class="wheel-register-log marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100">
                            <div class="wheel-header">
                                <h5>Quên Mật Khẩu</h5>
                       
                            </div>
                            <form action="dangnhap.html" method="post">
                                <label for="email" class="fa fa-user"><input type="text" name="email" id="email" placeholder='Nhập email'></label>
                                  <p style="color:red">${ms1 }</p>
                                <button name="btnlaymatkhau" type="submit" class="wheel-btn">Tiếp tục</button>
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
       <%@include file="../KhachHang/footer.jsp"%>
       
        <!-- Scripts project -->
        <%@include file="../KhachHang/script.jsp"%>
        <!-- sixth block end -->
    </body>

</html>