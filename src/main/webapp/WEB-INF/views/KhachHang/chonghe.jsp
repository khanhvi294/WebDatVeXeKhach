<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="head.jsp"%>
<body class=" wheel-bg2 ">
<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<!-- MAIN -->
	
	<%@include file="navbar.jsp"%>

	<!-- /////////////////////////////////// -->
	<div class="step-wrap">
		<!-- ////////////////////////////////////////// -->
		<div class="container padd-lr0">
			<div class="row">
				<div class="col-xs-12 padd-lr0">
					<ul class="steps">
						<li class="title-wrap">
							<div class="title">
								<span>1.</span>Tìm chuyến
							</div>
						</li>
						<li class="title-wrap ">
							<div class="title">
								<span>2.</span>Chọn chuyến
							</div>
						</li>
						<li class="title-wrap active">
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
	<!-- /////////////////////////////// -->
	<form action="dienthongtin.html" method="post">
		<div class="reservation" style="padding:0;">
			<div class="container">
				<div class="car-containers">
				
				</div>

				<ul class="showcase">
					<li>
						<div class="seats"></div> <small>Trống</small>
					</li>
					<li>
						<div class="seats selected"></div> <small>Đang chọn</small>
					</li>
					<li>
						<div class="seats sold"></div> <small>Đã đặt</small>
					</li>
				</ul>

				<div class="containers">
					<div class="screen">
						<div class="screens">
							<li><small>Tầng dưới </small></li>
							<li><small>Tầng trên </small></li>

						</div>

						
						<div class="rows">
                            <input  id="A11" value="A11" ${map['A11']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A11">A11</label>                           
                            <input id="B11" value="B11" ${map['B11']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B11">B11</label>                
                            <input id="C11" value="C11" ${map['C11']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C11">C11</label>
                            <input id="A12" value="A12" ${map['A12']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A12">A12</label>
                            <input id="B12" value="B12" ${map['B12']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B12">B12</label>
                            <input id="C12" value="C12" ${map['C12']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C12">C12</label>             
                        </div>
                        <div class="rows">
                            <input id="A21" value="A21" ${map['A21']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A21">A21</label>                           
                            <input id="B21" value="B21" ${map['B21']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B21">B21</label>                
                            <input id="C21" value="C21" ${map['C21']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C21">C21</label>
                            <input id="A22" value="A22" ${map['A22']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A22">A22</label>
                            <input id="B22" value="B22"  ${map['B22']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B22">B22</label>
                            <input id="C22" value="C22"  ${map['C22']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C22">C22</label>             
                        </div>
                        <div class="rows">
                            <input id="A31" value="A31"  ${map['A31']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A31">A31</label>                           
                            <input id="B31" value="B31" ${map['B31']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B31">B31</label>                
                            <input id="C31" value="C31" ${map['C31']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C31">C31</label>
                            <input id="A32" value="A32" ${map['A32']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A32">A32</label>
                            <input id="B32" value="B32" ${map['B32']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B32">B32</label>
                            <input id="C32" value="C32" ${map['C32']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C32">C32</label>             
                        </div>
                        <div class="rows">
                            <input id="A41" value="A41" ${map['A41']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A41">A41</label>                           
                            <input id="B41" value="B41" ${map['B41']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B41">B41</label>                
                            <input id="C41" value="C41" ${map['C41']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C41">C41</label>
                            <input id="A42" value="A42" ${map['A42']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A42">A42</label>
                            <input id="B42" value="B42" ${map['B42']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B42">B42</label>
                            <input id="C42" value="C42" ${map['C42']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C42">C42</label>             
                        </div>
                        <div class="rows">
                            <input id="A51" value="A51" ${map['A51']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A51">A51</label>                           
                            <input id="B51" value="B51" ${map['B51']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B51">B51</label>                
                            <input id="C51" value="C51" ${map['C51']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C51">C51</label>
                            <input id="A52" value="A52" ${map['A52']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A52">A52</label>
                            <input id="B52" value="B52" ${map['B52']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B52">B52</label>
                            <input id="C52" value="C52" name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C52">C52</label>             
                        </div>
                        <div class="rows">
                            <input id="A61" value="A61" ${map['A61']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A61">A61</label>                           
                            <input id="B61" value="B61" ${map['B61']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B61">B61</label>                
                            <input id="C61" value="C61" ${map['C61']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C61">C61</label>
                            <input id="A62" value="A62" ${map['A62']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="A62">A62</label>
                            <input id="B62" value="B62"  ${map['B62']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="B62">B62</label>
                            <input id="C62" value="C62" ${map['C62']} name="ghe" class="input-checkbox invisible position-absolute" type="checkbox"></input>
                                <label class="seat" for="C62">C62</label>             
                        </div>

						<div class="ends">
							<li>
								<p class="text">
									
								</p>
							</li>

						</div>
						
						<label for="input-val27" class="promo promo2">
							<button class="wheel-btn" style="line-height: 50px" id="Re2">Tiếp theo</button>
						</label>
						
						


					</div>
				</div>
			</div>
		</div>
		</div>
	</form>
	
	<!-- FOOTER -->
	<!-- ///////////////// -->
	 <%@include file="footer.jsp"%>
	 <style>
	 .wheel-footer{
	 margin-top: 100px;}
	 </style>

	<%@include file="script.jsp"%>
</body>


</html>