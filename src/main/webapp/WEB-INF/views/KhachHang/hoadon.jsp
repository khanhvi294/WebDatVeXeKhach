<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
    
<%@include file="head.jsp"%>
    <body class="">
        <!-- MAIN -->
        
         <%@include file="navbar.jsp"%>
    <!--/////////////////////////////////////////-->
    <div class="wheel-start3">
        <img src="images/bg7.jpg" alt="" class="wheel-img">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 padd-lr0">
                    <div class="wheel-start3-body clearfix marg-lg-t255 marg-lg-b75 marg-sm-t190 marg-xs-b30">
                        <h3>Chi tiết vé đặt</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wheel-register-block">
        <div class="container">
            <div class="col-md-12">
                <div class="row">
                    <div class="receipt-main col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
                        <div class="row">
                            <div class="receipt-header receipt-header-mid">
                                <div class="col-xs-8 col-sm-8 col-md-8 text-left">
                                    <div class="receipt-right">
                                        <h5>${phieudat.KH.hoKH } ${phieudat.KH.tenKH }</h5>
                                        <p><b>Số điện thoại : ${phieudat.sdt}</b> </p>
                                        <p><b>Email: ${phieudat.email}</b> </p>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <div class="receipt-left">
                                        <h3>Mã phiếu đặt: ${phieudat.maPD}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                    
                                        <th colspan="2">Thông tin chuyến:${phieudat.chuyen.tuyen.diemDi.diaDiem}  => ${phieudat.chuyen.tuyen.diemDen.diaDiem} </th>
                                        
                                    
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="2" class="col-md-3">
                                            <br> Thời gian khởi hành : ${phieudat.chuyen.tgKh} ngày ${phieudat.chuyen.ngKH}
                                            <br> Số lượng ghế : ${soluong }
                                            <br> Số ghế:
                                            <c:forEach var="ve" items="${ phieudat.vexe}"> 
                                            <br>
                                            ${ve.id.soGhe }
                                            </c:forEach>
                                          
                                        </td>

                                    </tr>
                  
                                    <tr>
    
                                        <td class="text-right">
                                            <h2><strong>Tổng cộng: </strong></h2>
                                        </td>
                                        <td class="text-left text-danger">
                                            <h2><strong> ${phieudat.chuyen.gia} VNĐ</strong></h2>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
    
                        <div class="row">
                            <div class="receipt-header receipt-header-mid receipt-footer">
                                <div class="col-xs-8 col-sm-8 col-md-8 ">
                                    <div class="receipt-right">
                                        <p><b>Ngày đặt:</b> ${phieudat.ngaydat} </p>
                                        <h5 style="color: rgb(140, 140, 140);">Cảm ơn vì đã tin tưởng hãng xe của chúng tôi
                                        </h5>
                                        <form action="phieudat.html">
                                            <label for="input-val27" class="promo promo2">
                                                <button class="btn btn-primary" id="Re4">Quay lại</button>
                                            </label>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <!-- FOOTER -->
        <!-- ///////////////// -->
      	<%@include file="footer.jsp"%>
        <!-- Scripts project -->
        <script type="text/javascript" src="resources/KhachHang/assets/js/jquery-2.2.4.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="resources/KhachHang/assets/js/bootstrap.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        	<style type="text/css">
		body {
			background: #eee;
			margin-top: 20px;
		}

		.text-danger strong {
			color: #9f181c;
		}

		.receipt-main {
			background: #ffffff none repeat scroll 0 0;
			border-bottom: 12px solid #333333;
			border-top: 12px solid #9f181c;
			margin-top: 50px;
			margin-bottom: 50px;
			padding: 40px 30px !important;
			position: relative;
			box-shadow: 0 1px 21px #acacac;
			color: #333333;
			font-family: open sans;
		}

		.receipt-main p {
			color: #333333;
			font-family: open sans;
			line-height: 1.42857;
		}

		.receipt-footer h1 {
			font-size: 15px;
			font-weight: 400 !important;
			margin: 0 !important;
		}

		.receipt-main::after {
			background: #414143 none repeat scroll 0 0;
			content: "";
			height: 5px;
			left: 0;
			position: absolute;
			right: 0;
			top: -13px;
		}

		.receipt-main thead {
			background: #414143 none repeat scroll 0 0;
		}

		.receipt-main thead th {
			color: #fff;
		}

		.receipt-right h5 {
			font-size: 16px;
			font-weight: bold;
			margin: 0 0 7px 0;
		}

		.receipt-right p {
			font-size: 12px;
			margin: 0px;
		}

		.receipt-right p i {
			text-align: center;
			width: 18px;
		}

		.receipt-main td {
			padding: 9px 20px !important;
		}

		.receipt-main th {
			padding: 13px 20px !important;
		}

		.receipt-main td {
			font-size: 13px;
			font-weight: initial !important;
		}

		.receipt-main td p:last-child {
			margin: 0;
			padding: 0;
		}

		.receipt-main td h2 {
			font-size: 20px;
			font-weight: 900;
			margin: 0;
			text-transform: uppercase;
		}

		.receipt-header-mid .receipt-left h1 {
			font-weight: 100;
			margin: 34px 0 0;
			text-align: right;
			text-transform: uppercase;
		}

		.receipt-header-mid {
			margin: 24px 0;
			overflow: hidden;
		}

		#container {
			background-color: #dcdcdc;
		}
	</style>
    </body>

</html>