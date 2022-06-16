<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
		<base href="${pageContext.servletContext.contextPath}/">
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
         <link rel="stylesheet" type="text/css" href="resources/KhachHang/assets/css/alertify.min.css">
    </head>
    <body class="">
      <div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
         <%@include file="navbar.jsp"%>
        <!-- /////////////////////////////// -->
        <!-- /////////////////////////////////// -->
        <div class="wheel-register-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 padd-r0" style="margin-left: 300px">
					<div
						class="wheel-register-log marg-lg-t70 marg-lg-b150 marg-sm-t100 marg-sm-b100">
						<div class="wheel-header">
							<h5 style="margin-bottom: 0px;">Thông tin cá nhân</h5>
						</div>
						<form:form id="form-canhan" action="thongtincanhan.html" modelAttribute="khachhang" class="row g-3" method="post">
                              <form:hidden path="maKH" class="form-control" />
                               <form:hidden path="tkkh.userName" />
                              <div class="col-md-12" >
                                <label for="inputName5" class="form-label">Họ</label>
                                <form:input  path="hoKH" type="text" id="lastName"/>
                               <form:errors  class="text-er" path="hoKH"></form:errors>
                                <p id="ho-error" class="text-er"> </p>
                              </div>
                              <div class="col-md-12" >
                                <label for="inputName5" class="form-label"> Tên</label>
                                <form:input path="TenKH" id="firstName" type="text"/>
                                 <form:errors  class="text-er" path="tenKH"></form:errors>
                                 <p id="ten-error" class="text-er"> </p>
                              </div>
                              <div class="col-md-12">
                                <label class="col-form-label" style="line-height: 0px;">Giới tính</label>
                                <div class="row" style="display: flex;">
                                  <div class="col-sm-2" style="margin-left: 30px;">
                                    <div class="form-check form-check-inline" style="display: flex; align-items: center;" >
                                     <label class="form-check-label" for="gridRadios1">
                                        Nam
                                      </label>
                                      <form:radiobutton  path="phai" class="form-check-input" id="gridRadios1" value="0" style="margin-top: 15px;"/>
                                      
                                    </div>
                                  </div>
                                  <div class="col-sm-2">
                                    <div class="form-check form-check-inline" style="display: flex; align-items: center;">
                                    <label class="form-check-label" for="gridRadios2">
                                        Nữ
                                      </label>
                                      <form:radiobutton path="phai" class="form-check-input" id="gridRadios2" value="1" style="margin-top: 15px;"/>
                                      
                                    </div>
                                  </div>
                                </div>
                              </div>
                            
                              <div class="col-md-12">
                                <label for="inputDate" class="form-label">Ngày sinh</label>
                                
                                  <form:input path="ngSinh" type="date"/>
                                   <form:errors  class="text-er" path="ngSinh"></form:errors>
                               	<p id="ngsinh-error" class="text-er"> 
                               	 </p>
                              </div>
                              <div class="col-md-12">
                                <label for="inputName5" class="form-label">Email</label>
                                <form:input path="tkkh.email" type="text"  id="email"/>
                                 <form:errors  class="text-er" path="tkkh.email"></form:errors>
                                  <p id="error-email" class="text-er"> </p>
                              </div>
                              <div class="col-md-12">
                                <label for="inputName5" class="form-label">SĐT</label>
                                <form:input path="sdt" type="text" id="sdt"/>
                                  <form:errors  class="text-er" path="sdt"></form:errors>
                                   <p id="sdt-error" class="text-er"> </p>
                              </div>
                      
                              <div class="text-center">
                                <button id="btn-canhan" type="submit" style="width:97%;" class="btn btn-primary">Lưu</button>
                              </div>
                            </form:form>
					</div>
                    <!-- <div class="col-lg-8 marg-lg-t150 marg-lg-b150 marg-sm-t100 marg-sm-b100 ">             
                        <div class="card">
                          <div class="card-body">
                          </div>
                        </div>
                    </div> -->
                </div>    
            </div>
        </div>
                    
        <!-- FOOTER -->
        <!-- ///////////////// -->
       <%@include file="footer.jsp" %>
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
          <script type="text/javascript" src="resources/KhachHang/assets/js/alertify.min.js"></script>
        <script type="text/javascript" src="resources/KhachHang/assets/js/showMessage.js"></script>
        <!-- sixth block end -->
        <script>
	let check = true;
	let dataCheck = "";
	function checkInputRegister() {
		check = true;
		
		
		
		$("#sdt").bind("change",function() {
			let sdt = $("#sdt").val();
			let regexSdt = new RegExp(/(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/);
			if(!regexSdt.test(sdt)){
				check = false;
				$("#sdt-error").text("Số điện thoại phải hợp lệ");
				return false;

			}else {
				$("#sdt-error").text("");
				check = true;
			}
		});
		
		
		
		$("#firstName").bind("change",function(){
			let firstName = $("#firstName").val();
			let regexFirstname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵýỷỹ]+$/);
			if(!regexFirstname.test(firstName)){
				check = false;
				$("#ten-error").text("Tên không được để trống và không được có kí tự đặc biệt!")
				return false;

			}else {
				$("#ten-error").text("")
				firstName = firstName.trim().replace(/\s+/g, '')
				$("#firstName").val(firstName)
			}
			
		});
		
		$("#lastName").bind("change",function(){
		let lastName  = $("#lastName").val();
   		let regexLastname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵýỷỹ ]+$/);
		if(!regexLastname.test(lastName)){
			check = false;
			
			$("#ho-error").text("Họ không được để trống và không được có kí tự đặc biệt!")
			return false;

		}else {
			$("#ho-error").text("")
			let namearr = lastName.split(" ")
			lastName = "";
			namearr.forEach((item) => {
				item = item.trim().replace(/\s+/g, '')
				if(item.length > 0){
					lastName += item + " " 
				}
			})
			lastName = lastName.trim()
			$("#lastName").val(lastName)
		}
		});
		$("#email").change(function() {
			let email = $(this).val();
			let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
			if (!regexEmail.test(email)) {
				$("#error-email").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
				return false;
			} else {
				$("#error-email").text("")
			}


			
		});
		
		
		
		check = true;
		
	}
	
	function checkInfo() {
		let check =  true;
		$("#btn-canhan").click(function(e) {
			check = true;
			e.preventDefault();

			let lastName  = $("#lastName").val();
	   		let regexLastname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵýỷỹ ]+$/);
			if(!regexLastname.test(lastName)){
				check = false;
				$("#ho-error").text("Họ không được để trống và không được có kí tự đặc biệt!")
			}else {
				$("#ho-error").text("")
				let namearr = lastName.split(" ")
				lastName = "";
				namearr.forEach((item) => {
					item = item.trim().replace(/\s+/g, '')
					if(item.length > 0){
						lastName += item + " " 
					}
				})
				lastName = lastName.trim()
				$("#lastName").val(lastName)
			}
			
			let firstName = $("#firstName").val();
			let regexFirstname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵýỷỹ]+$/);
			if(!regexFirstname.test(firstName)){
				check = false;
				$("#ten-error").text("Tên không được để trống và không được có kí tự đặc biệt!")
			}else {
				$("#ten-error").text("")
				firstName = firstName.trim().replace(/\s+/g, '')
				$("#firstName").val(firstName)
			}
			
			
			let email = $("#email").val();
			let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
			if (!regexEmail.test(email)) {
				$("#error-email").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
				check = false;
			} else {
				$("#error-email").text("")
			}
			
			let ngaysinh = $("input[name=ngSinh]").val()
			if(!ngaysinh){
				check = false;
				$("#ngsinh-error").text("Ngày sinh không được để trống");
			}else {
				$("#ngsinh-error").text("");
			}
			
			let phai = $("input[name=phai]").val()
			if(phai != true && phai != false){
				check = false;
				$("#phai-error").text("????");
			}else {
				$("#phai-error").text("")
			}
			
			let sdt = $("#sdt").val();
			let regexSdt = new RegExp(/(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/);
			if(!regexSdt.test(sdt)){
				check = false;
				$("#sdt-error").text("Số điện thoại phải hợp lệ");
			}else {
				$("#sdt-error").text("");
			}
			
			
			if (check) {
				$("#form-canhan").submit();
			}
		})
	}
	

	$(document).ready(function() {
		checkInputRegister();
		checkInfo();
	})
	
	</script>
    </body>

</html>
