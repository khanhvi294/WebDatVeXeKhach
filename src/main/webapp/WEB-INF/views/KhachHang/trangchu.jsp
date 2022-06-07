<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html lang="en">
<%@include file="head.jsp"%>
<body class="">
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>

	<%@include file="navbar.jsp"%>

	<!-- /////////////////////////////////////////////////// -->
	<div class="container padd-lr0">

		<div class="row">
			<div class="col-xs-12">

				<article class="wheel-blog-item"
					style="margin-bottom: 0; height: 310px;">

					<div class="wheel-blog-logo">
						<div class="swiper-container" data-autoplay="2000" data-touch="1"
							data-mouse="0" data-xs-slides="1" data-sm-slides="1"
							data-md-slides="1" data-lg-slides="1" data-add-slides="1"
							data-slides-per-view="responsive" data-loop="1" data-speed="1000">
							<div class="swiper-wrapper ">
								<div class="swiper-slide">
									<div class="wheel-blog-slides">
										<img class="wheel-slide-img" style="width: 1112px;"
											src="https://cdn.vato.vn/google-storage/facecar-29ae7.appspot.com/images/4984c7d7-d893-49ee-b594-328ef1c5818c-1649385161074.png"
											alt="">
									</div>
								</div>
								<div class="swiper-slide">
									<div class="wheel-blog-slides">
										<img class="wheel-slide-img"
											style="width: 1080px; max-height: 276px;"
											src="https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-9/123869057_1825631017584572_9197127299065866525_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=e3f864&_nc_ohc=Va3_dqcSe54AX_C_whw&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT_TTpwaAN5fozzETZ5wiuSvUxQ5To0a1dOVYHTUSZj-2A&oe=62BC715B"
											alt="">
									</div>
								</div>

								<div class="swiper-slide">
									<div class="wheel-blog-slides">
										<img class="wheel-slide-img"
											style="width: 1112px; max-height: 276px;"
											src="https://ksdalat.com/wp-content/uploads/2019/08/nha-xe-phuong-trang-da-lat.jpg"
											alt="">
									</div>
								</div>

							</div>
							<div class="pagination"></div>
							<div class="swiper-arrow-left fa fa-angle-left"
								style="background-color: transparent;"></div>
							<div class="swiper-arrow-right fa fa-angle-right"
								style="background-color: transparent;"></div>
						</div>
					</div>
				</article>

			</div>
		</div>
		<div class="reservation" style="background-color: #fff; padding: 50px 25px;">
			<div class=" padd-lr0 marg-lg-b100 marg-xs-t0 marg-xs-b0"
				style="margin-bottom: 20px;">
				<div class="row">
					<div class="padd-lr0 box-shadow">
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
										<span>Điểm đến</span> <label for="input-val20"
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


									<button type="submit" class="wheel-btn" id='input-val27'
										style="line-height: 59px;">Tìm kiếm</button>
								</div>
							</div>
						</form:form>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="wheel-header text-center marg-lg-b90"
					style="margin-bottom: 40px;">
					<h3>Gợi ý tuyến xe</h3>
				</div>
			</div>
			<%
				int index = -1;
				List<String> anh = new ArrayList<String>();
				anh.add("https://cdn1.nhatrangtoday.vn/images/photos/xe-nha-trang-sai-gon-4.jpg");
				anh.add("https://fantasea.vn/wp-content/uploads/2018/05/H%C3%A3ng-xe-Ph%C6%B0%C6%A1ng-Trang-.jpg");
				anh.add("https://shojiki.vn/template/uploads/2022/02/dan-xe-khach-phuong-trang-3-1030x532.jpg");
				anh.add("https://cdn.cungcap.net/media/img/2019/04/13/NWgrf-1555174229.jpeg");
				anh.add("https://diachiamthuc.vn/wp-content/uploads/2021/10/nha-xe-phuong-trang-1024x819.jpg");
				anh.add("https://dichung.vn/file/2021/01/duong-dai-hai-phong-6-1.jpg");
				
			%>
			
			<c:forEach var="tuyen" items="${tuyenrandom }">
				<a
				 <%index++; %>
					href="timchuyen.html?chon&di=${tuyen.getDiemDi().getMaDD() }&den=${tuyen.getDiemDen().getMaDD()}">
					<%-- <div class="col-md-4 padd-l0 padd-md-lr15">
						<div class="wheel-news-item box-shadow wheel-bg1">
							<!-- <i class="">29 April</i> -->
							<div class="wheel-news-text">
								<h4>${tuyen.getDiemDi().getDiaDiem()}
									<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									${tuyen.getDiemDen().getDiaDiem()}
								</h4>
							</div>
						</div>
					</div> --%>

					<div class="col-sm-6 col-md-6 trans">
						<div class=" thumbnail box-shadow wheel-news-text" style="display: flex;">
							<img style="margin-left: unset; margin-right: unset; width: 100px; height: 80px;" src='<%= anh.get(index) %>' alt="...">
							<div class="caption">
								<h4>${tuyen.getDiemDi().getDiaDiem()}
									<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									${tuyen.getDiemDen().getDiaDiem()}
								</h4>
								
							</div>
						</div>
					</div>
				</a>
			</c:forEach>


		</div>
		<div class="row">
			<div class="col-md-6 ">
				<div
					class="wheel-info-img  marg-lg-t150 marg-lg-b150 marg-md-t100 marg-md-b100">
					<img src="https://canthoplus.com/wp-content/uploads/2022/02/tong-dai-so-dien-thoai-xe-phuong-trang-ben-xe-mien-tay.jpg" alt=""
						class="wheel-img">
						<!-- 
						
						 -->
				</div>
			</div>
			<div class="col-md-6 ">
				<div
					class="wheel-info-text  marg-lg-t150 marg-lg-b150 marg-md-t100 marg-md-b100 marg-sm-t50 marg-sm-b50">
					<div class="wheel-header">
						<h5>Chúng tôi là ai ?</h5>
						<h3>
							<span>Chất lượng</span> là <span>Danh dự</span>
						</h3>
					</div>
					<span>Công ty Phương Trang được thành lập năm 2001. Trải qua
						20 năm phát triển đặt khách hàng làm trọng tâm, chúng tôi tự hào
						trở thành doanh nghiệp vận tải nòng cốt góp phần phát triển ngành
						vận tải của cả nước.</span>
					<p>
						Tuân thủ phương châm<span> “Chất lượng là danh dự”</span> , công
						ty hiện đang khai thác hơn 60 chuyến vận tải hành khách liên tỉnh
						cố định trải dài từ Nam ra Bắc với hơn 250 phòng vé và trạm trung
						chuyển, hơn 2000 đầu xe các loại, phục vụ hơn 20 triệu khách mỗi
						năm
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////////////////////////////////// -->
	<div class="wheel-bg2">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div
						class="wheel-header wheel-testi-header text-center marg-lg-t145 marg-lg-b65 marg-md-t100 marg-sm-t50 marg-md-b50">
						<h3>
							Phương Trang - <span>"Chất lượng là danh dự"</span>
						</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 padd-lr0 ">
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50 ">
						<i class="fa fa-users"></i> <span data-to="9999" data-speed="5000"></span><b>+</b>
						<p>Hơn 9999 lượt khách</p>
						<h5>Phuowng Trang phục vụ hơn 9999 lượt khách/năm</h5>
					</div>
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50">
						<i class="fa fa-thumbs-o-up"></i> <span data-to="90"
							data-speed="5000"></span><b>%</b>
						<p>Chất lượng phục vụ</p>
						<h5>Hơn 90% hành khách hài lòng về chất lượng dịch vụ</h5>
					</div>
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50">
						<i class="fa fa-building"></i> <span data-to="100"
							data-speed="5000"></span><b>+</b>
						<p>Hơn 100 phòng vé</p>
						<h5>Phương Trang có hơn 100 phòng vé, bến xe khắp cả nước</h5>
					</div>
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50">
						<i class="fa fa-car"></i> <span data-to="632" data-speed="1000"></span><b>+</b>
						<p>Hơn 632 chuyến xe / ngày</p>
						<h5>Phương Trang phục vụ hơn 632 chuyến xe / ngày</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //////////////////////////////////////////// -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 padd-lr0">
				<div class="wheel-skills marg-lg-b150 marg-sm-b50">
					<div class="wheel-header marg-lg-t140 marg-lg-b55 marg-sm-t50">
						<h5>Tại sao bạn lại chọn chúng tôi ?</h5>
						<h3 style="line-height: 37px;">
							Chúng tôi đang nỗ lực trở thành nhà xe uy tín và chất lượng nhất
							cả nước với những<span> cam kết </span> :
						</h3>
					</div>
					<div class="wheel-skills-info">
						<p>Hiểu được nhu cầu nghỉ ngơi, thư giãn của hành khách trên
							các hành trình dài qua nhiều tỉnh, thành phố, Công ty Phương
							Trang còn đầu tư vào hệ thống trạm dừng Phúc Lộc tại các khu vực
							trọng điểm như Tiền Giang, Lâm Đồng, Bến Tre, Vĩnh Long, Sóc
							Trăng... Hệ thống Trạm dừng Phúc Lộc được đầu tư toàn diện, đảm
							bảo phục vụ lượng lớn khách hàng 24/7.</p>
						<p data-v-716155d2></p>
					</div>
				</div>
			</div>
			<div class="col-md-6 padd-lr0">
				<div
					class="wheel-skills-accordion marg-lg-t150 marg-lg-b135 marg-sm-t50 marg-sm-b50">
					<div class="wpc-accordion">
						<div class="panel-wrap active">
							<h5 class="panel-title">
								Tạo ra môi trường là việc năng động, thân thiện <span></span>
							</h5>
							<div class="panel-content">Đội ngũ nhân viên được đào tạo
								bài bản và luôn lắng nghe theo yêu cầu của khách hàng</div>
						</div>
						<div class="panel-wrap">
							<h5 class="panel-title">
								Phát triển từ lòng tin của khách hàng <span></span>
							</h5>
							<div class="panel-content">Whell cam kết mang lại cho khách
								hàng chuyến đi an toàn, thoải mái với mức giá phù hợp</div>
						</div>
						<div class="panel-wrap">
							<h5 class="panel-title">
								Phấn đấu làm việc để trở thành nhà xe hàng đầu <span></span>
							</h5>
							<div class="panel-content">Trong xu hướng 4.0 hiện nay,
								chúng tôi cũng đang ứng dụng và phát triển những công nghệ quảng
								cáo kỹ thuật số và phát triển trang web</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////// -->
	<!-- /////////////////////////////// -->
	<div class="wheel-bg2">
		<div class="container padd-lr0">
			<div class="row">
				<div class="col-xs-12">
					<div
						class="wheel-header text-center marg-lg-t145 marg-sm-t50 marg-lg-b90">
						<h5>Địa điểm phổ biến</h5>
						<h3>
							Gợi ý những điểm du lịch được<span> ưa thích</span> trong năm
						</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="wheel-team text-center marg-lg-b150 marg-sm-b50"
						style="height: 260px;">
						<div class="wheel-team-logo" style="height: 180px;">
							<img
								src="https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/07/c-r-e1505464506291.jpg"
								alt="">
						</div>
						<div class="wheel-team-info ">
							<h5>Đà Nẵng</h5>

						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="wheel-team text-center marg-lg-b150 marg-sm-b50"
						style="height: 260px;">
						<div class="wheel-team-logo">
							<img style="height: 180px; max-height: unset;"
								src="https://quynhontourist.com/wp-content/uploads/2019/07/tour-du-lich-quy-nhon-da-lat-3-ngay-2-dem.png"
								alt="">
						</div>
						<div class="wheel-team-info ">
							<h5>Đà Lạt</h5>

						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="wheel-team text-center marg-lg-b150 marg-sm-b50"
						style="height: 260px;">
						<div class="wheel-team-logo">
							<img style="height: 180px; max-height: unset;"
								src="https://hanoitourist.com.vn/images/destination/2021/07/16/large/3_fansipan-sapa-kynghidongduong-vn-03_1626382049.jpg"
								alt="">
						</div>
						<div class="wheel-team-info ">
							<h5>Sa Pa</h5>

						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="wheel-team text-center marg-lg-b150 marg-sm-b50"
						style="height: 260px;">
						<div class="wheel-team-logo">
							<img style="height: 180px; max-height: unset; width: 270px;"
								src="https://staticproxy.mytourcdn.com/480x360,q90/resources/pictures/locations/eer1614568552.jpg"
								alt="">
						</div>
						<div class="wheel-team-info ">
							<h5>Nha Trang</h5>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////// -->
	<!-- ////////////////////////////////////// -->
	<div class="container ">
		<div class="row">
			<div class="col-md-6 padd-lr0">
				<div
					class="wheel-info-text2 marg-lg-t140 marg-lg-b150 marg-md-t100 marg-md-b50 ">
					<div class="wheel-header">
						<h5>Giới thiệu</h5>
						<h3 style="line-height: 37px;">
							Phương Trang<span> Chất lượng là danh dự</span>
						</h3>
					</div>
					<span>Tuân thủ phương châm “Chất lượng là danh dự”, Công ty
						Cổ phần Xe Khách Phương Trang – FUTA Bus Lines hiện đang khai thác
						hơn 60 tuyến vận tải hành khách liên tỉnh cố định trải dài từ Nam
						ra Bắc với hơn 250 phòng vé và trạm trung chuyển, hơn 2,000 đầu xe
						các loại, phục vụ hơn 20 triệu lượt khách mỗi năm.
						</p>
						<p data-v-716155d2>
					</span>
					<p>Công ty Phương Trang được thành lập năm 2001. Trải qua 20
						năm phát triển đặt khách hàng làm trọng tâm, chúng tôi tự hào trở
						thành doanh nghiệp vận tải nòng cốt đóng góp tích cực vào sự phát
						triển chung của ngành vận tải nói riêng và nền kinh tế đất nước
						nói chung. Luôn cải tiến mang đến chất lượng dịch vụ tối ưu nhất
						dành cho khách hàng, Công ty Phương Trang được ghi nhận qua nhiều
						danh hiệu danh giá như “Top 5 Công ty Uy tín ngành Vận Tải và
						Logistics”, “Top 50 Nhãn hiệu nổi tiếng Việt Nam”, “Sản phẩm và
						Dịch vụ Chất lượng Châu Á”, “Top 10 Thương hiệu chất lượng Châu
						Á”,…</p>
					<a href="#" class="wheel-btn">Tìm hiểu thêm</a>
				</div>
			</div>
			<div class="col-md-6 padd-lr0">
				<div
					class="wheel-info-video marg-lg-t150 marg-lg-b150 marg-md-t50 marg-md-b50">
					
					<iframe src="https://www.youtube.com/embed/LfWSjzaYuaY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- //////////////////////////////////////////// -->


	<!-- FOOTER -->
	<!-- ///////////////// -->
	<%@include file="footer.jsp"%>


	<%@include file="script.jsp"%>
	<script>
		inputval22.min = new Date().toISOString().split("T")[0];
	</script>
	<!-- sixth block end -->


</body>


</html>