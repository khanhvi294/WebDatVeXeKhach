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
										<span>??i???m ??i</span> <label for="input-val20"
											class="fa fa-map-marker"> <form:select
												class="selectpicker" path="tuyen.diemDi.maDD"
												itemLabel="diaDiem" itemValue="maDD" id="input-val20"
												items="${dsdiadiem }"></form:select>
										</label>

									</div>
									<div class="wheel-date">
										<span>??i???m ?????n</span> <label for="input-val20"
											class="fa fa-map-marker"> <form:select
												class="selectpicker" path="tuyen.diemDen.maDD"
												itemLabel="diaDiem" itemValue="maDD" id="input-val21"
												items="${dsdiadiem }"></form:select>
										</label>
									</div>
									<div class="wheel-date ">
										<span>Ng??y ??i</span> <label class="fa fa-calendar"
											for="inputval22"> <jsp:useBean id="datek"
												class="java.util.Date" /> <fmt:formatDate var="datek2"
												value="${datek}" type="date" pattern="yyyy-MM-dd" /> <form:input
												path="ngKH" class="" type="date" value="${datek2 }"
												id="inputval22" />
										</label>
									</div>


									<button type="submit" class="wheel-btn" id='input-val27'
										style="line-height: 59px;">T??m ki???m</button>
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
					<h3>G???i ?? tuy???n xe</h3>
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
						<h5>Ch??ng t??i l?? ai ?</h5>
						<h3>
							<span>Ch???t l?????ng</span> l?? <span>Danh d???</span>
						</h3>
					</div>
					<span>C??ng ty Ph????ng Trang ???????c th??nh l???p n??m 2001. Tr???i qua
						20 n??m ph??t tri???n ?????t kh??ch h??ng l??m tr???ng t??m, ch??ng t??i t??? h??o
						tr??? th??nh doanh nghi???p v???n t???i n??ng c???t g??p ph???n ph??t tri???n ng??nh
						v???n t???i c???a c??? n?????c.</span>
					<p>
						Tu??n th??? ph????ng ch??m<span> ???Ch???t l?????ng l?? danh d??????</span> , c??ng
						ty hi???n ??ang khai th??c h??n 60 chuy???n v???n t???i h??nh kh??ch li??n t???nh
						c??? ?????nh tr???i d??i t??? Nam ra B???c v???i h??n 250 ph??ng v?? v?? tr???m trung
						chuy???n, h??n 2000 ?????u xe c??c lo???i, ph???c v??? h??n 20 tri???u kh??ch m???i
						n??m
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
							Ph????ng Trang - <span>"Ch???t l?????ng l?? danh d???"</span>
						</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 padd-lr0 ">
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50 ">
						<i class="fa fa-users"></i> <span data-to="9999" data-speed="5000"></span><b>+</b>
						<p>H??n 9999 l?????t kh??ch</p>
						<h5>Phuowng Trang ph???c v??? h??n 9999 l?????t kh??ch/n??m</h5>
					</div>
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50">
						<i class="fa fa-thumbs-o-up"></i> <span data-to="90"
							data-speed="5000"></span><b>%</b>
						<p>Ch???t l?????ng ph???c v???</p>
						<h5>H??n 90% h??nh kh??ch h??i l??ng v??? ch???t l?????ng d???ch v???</h5>
					</div>
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50">
						<i class="fa fa-building"></i> <span data-to="100"
							data-speed="5000"></span><b>+</b>
						<p>H??n 100 ph??ng v??</p>
						<h5>Ph????ng Trang c?? h??n 100 ph??ng v??, b???n xe kh???p c??? n?????c</h5>
					</div>
					<div
						class="wheel-testimonial-item marg-lg-b130 marg-md-b100 marg-sm-b50">
						<i class="fa fa-car"></i> <span data-to="632" data-speed="1000"></span><b>+</b>
						<p>H??n 632 chuy???n xe / ng??y</p>
						<h5>Ph????ng Trang ph???c v??? h??n 632 chuy???n xe / ng??y</h5>
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
						<h5>T???i sao b???n l???i ch???n ch??ng t??i ?</h5>
						<h3 style="line-height: 37px;">
							Ch??ng t??i ??ang n??? l???c tr??? th??nh nh?? xe uy t??n v?? ch???t l?????ng nh???t
							c??? n?????c v???i nh???ng<span> cam k???t </span> :
						</h3>
					</div>
					<div class="wheel-skills-info">
						<p>Hi???u ???????c nhu c???u ngh??? ng??i, th?? gi??n c???a h??nh kh??ch tr??n
							c??c h??nh tr??nh d??i qua nhi???u t???nh, th??nh ph???, C??ng ty Ph????ng
							Trang c??n ?????u t?? v??o h??? th???ng tr???m d???ng Ph??c L???c t???i c??c khu v???c
							tr???ng ??i???m nh?? Ti???n Giang, L??m ?????ng, B???n Tre, V??nh Long, S??c
							Tr??ng... H??? th???ng Tr???m d???ng Ph??c L???c ???????c ?????u t?? to??n di???n, ?????m
							b???o ph???c v??? l?????ng l???n kh??ch h??ng 24/7.</p>
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
								T???o ra m??i tr?????ng l?? vi???c n??ng ?????ng, th??n thi???n <span></span>
							</h5>
							<div class="panel-content">?????i ng?? nh??n vi??n ???????c ????o t???o
								b??i b???n v?? lu??n l???ng nghe theo y??u c???u c???a kh??ch h??ng</div>
						</div>
						<div class="panel-wrap">
							<h5 class="panel-title">
								Ph??t tri???n t??? l??ng tin c???a kh??ch h??ng <span></span>
							</h5>
							<div class="panel-content">Whell cam k???t mang l???i cho kh??ch
								h??ng chuy???n ??i an to??n, tho???i m??i v???i m???c gi?? ph?? h???p</div>
						</div>
						<div class="panel-wrap">
							<h5 class="panel-title">
								Ph???n ?????u l??m vi???c ????? tr??? th??nh nh?? xe h??ng ?????u <span></span>
							</h5>
							<div class="panel-content">Trong xu h?????ng 4.0 hi???n nay,
								ch??ng t??i c??ng ??ang ???ng d???ng v?? ph??t tri???n nh???ng c??ng ngh??? qu???ng
								c??o k??? thu???t s??? v?? ph??t tri???n trang web</div>
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
						<h5>?????a ??i???m ph??? bi???n</h5>
						<h3>
							G???i ?? nh???ng ??i???m du l???ch ???????c<span> ??a th??ch</span> trong n??m
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
							<h5>???? N???ng</h5>

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
							<h5>???? L???t</h5>

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
						<h5>Gi???i thi???u</h5>
						<h3 style="line-height: 37px;">
							Ph????ng Trang<span> Ch???t l?????ng l?? danh d???</span>
						</h3>
					</div>
					<span>Tu??n th??? ph????ng ch??m ???Ch???t l?????ng l?? danh d??????, C??ng ty
						C??? ph???n Xe Kh??ch Ph????ng Trang ??? FUTA Bus Lines hi???n ??ang khai th??c
						h??n 60 tuy???n v???n t???i h??nh kh??ch li??n t???nh c??? ?????nh tr???i d??i t??? Nam
						ra B???c v???i h??n 250 ph??ng v?? v?? tr???m trung chuy???n, h??n 2,000 ?????u xe
						c??c lo???i, ph???c v??? h??n 20 tri???u l?????t kh??ch m???i n??m.
						</p>
						<p data-v-716155d2>
					</span>
					<p>C??ng ty Ph????ng Trang ???????c th??nh l???p n??m 2001. Tr???i qua 20
						n??m ph??t tri???n ?????t kh??ch h??ng l??m tr???ng t??m, ch??ng t??i t??? h??o tr???
						th??nh doanh nghi???p v???n t???i n??ng c???t ????ng g??p t??ch c???c v??o s??? ph??t
						tri???n chung c???a ng??nh v???n t???i n??i ri??ng v?? n???n kinh t??? ?????t n?????c
						n??i chung. Lu??n c???i ti???n mang ?????n ch???t l?????ng d???ch v??? t???i ??u nh???t
						d??nh cho kh??ch h??ng, C??ng ty Ph????ng Trang ???????c ghi nh???n qua nhi???u
						danh hi???u danh gi?? nh?? ???Top 5 C??ng ty Uy t??n ng??nh V???n T???i v??
						Logistics???, ???Top 50 Nh??n hi???u n???i ti???ng Vi???t Nam???, ???S???n ph???m v??
						D???ch v??? Ch???t l?????ng Ch??u ?????, ???Top 10 Th????ng hi???u ch???t l?????ng Ch??u
						?????,???</p>
					<a href="#" class="wheel-btn">T??m hi???u th??m</a>
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