<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>

<style>
	.steps .title {
		font-size: 15px;
	}
	
	.steps .title span{
		font-size: 20px;
	}
	
	.step-wrap {
		padding: 45px 0 65px;
	}
</style>
<body class="">
<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<!-- MAIN -->
	<%@include file="navbar.jsp"%>
	<!-- //////////////////////////////// -->
	
	<!-- /////////////////////////////////// -->
	<div class="step-wrap">
		<!-- ////////////////////////////////////////// -->
		<div class="container padd-lr0">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<ul class="steps">
						<li class="title-wrap active">
							<div class="title">
								<span>1.</span>Tìm chuyến
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>2.</span>Chọn chuyến
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>3.</span>Chọn ghế
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>4.</span>Thông tin khách hàng
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>5.</span>Thanh toán
							</div> 
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- ////////////////////////////////////////// -->
	</div>
	<!-- ////////////////////////////////////////// -->
	<div class="reservation" style="padding-top: 6px">
		<div
			class="container padd-lr0 marg-lg-t100 marg-lg-b100 marg-xs-t0 marg-xs-b0">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<form:form action="chonchuyen.html" modelAttribute="chuyenxe"
						method="post">
						<div class="wheel-start-form wheel-start-form2">
							<div class="clearfix">
								<div class="wheel-date">
									<span>Điểm đi</span> <label for="input-val20"
										class="fa fa-map-marker"> <form:select
											class="selectpicker" path="tuyen.diemDi.maDD"
											itemLabel="diaDiem" itemValue="maDD" id="input-val20"
											items="${dsdiadiem }"></form:select>
									</label>

								</div>
								<div class="wheel-date">
									<span>Điểm đến</span> <label for="input-val21"
										class="fa fa-map-marker"> <form:select
											class="selectpicker" path="tuyen.diemDen.maDD"
											itemLabel="diaDiem" itemValue="maDD" id="input-val21"
											items="${dsdiadiem }"></form:select>
									</label>
								</div>
								<div class="wheel-date ">
										<span>Ngày đi</span> <label class="fa fa-calendar"
											for="inputval22"> <jsp:useBean id="datek"
												class="java.util.Date" /> <fmt:formatDate var="datek2"
												value="${datek}" type="date" pattern="yyyy-MM-dd" /> <form:input
												path="ngKH" class="" type="date" value="${datek2 }"
												id="inputval22" />
										</label>
									</div>

					
								<button type="submit" class="wheel-btn" id='input-val27' style="line-height: 59px;">Tìm
									kiếm</button>
							</div>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>
	<!-- ////////////////////////////////////////// -->

	<!-- FOOTER -->
	<!-- ///////////////// -->
	<%@include file="footer.jsp" %>
	<%@include file="script.jsp"%>
	<script >
	$(document).ready( function() {
	    var now = new Date();
	    var month = (now.getMonth() + 1);               
	    var day = now.getDate();
	    if (month < 10) 
	        month = "0" + month;
	    if (day < 10) 
	        day = "0" + day;
	    var today = now.getFullYear() + '-' + month + '-' + day;
	    $('#inputval22').val(today);
	});
	
	inputval22.min = new Date().toISOString().split("T")[0]; 
	</script>
	<!-- Scripts project -->
	
	

	<!-- sixth block end -->
</body>

</html>