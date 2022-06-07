<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">
	<div class="d-flex align-items-center justify-content-between">
		<a href="quanly/trangchu.html" class="logo d-flex align-items-center"> <img
			src="https://futabus.vn/_nuxt/img/logo-img.c178602.png" alt="" /> <span
			class="d-none d-lg-block">Phương Trang</span>
		</a> <i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
	<!-- End Logo -->

	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
			<li class="nav-item d-block d-lg-none"><a
				class="nav-link nav-icon search-bar-toggle" href="#"> <i
					class="bi bi-search"></i>
			</a></li>
			<!-- End Search Icon-->

		<c:if test="${user!=null}">
			<li class="nav-item dropdown pe-3 me-2"><a
				class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
				data-bs-toggle="dropdown"> <span
					class="d-none d-md-block dropdown-toggle ps-2"> <i class="bi bi-person-fill"></i> ${user.getHoNV()} ${user.getTenNV() }</span>
			</a> <!-- End Profile Iamge Icon -->

				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile v-drop-profile">
					<li class="dropdown-header">
						<h6>${user.getHoNV()} ${user.getTenNV() }</h6> 
					</li>
					<li>
						<hr class="dropdown-divider" />
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="quanly/trangcanhan.html"> <i class="bi bi-person"></i> <span>Tài
								khoản của tôi</span>
					</a></li>

					<li>
						<hr class="dropdown-divider" />
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="dangxuat.html"> <i class="bi bi-box-arrow-right"></i>
							<span>Đăng xuất</span>
					</a></li>
				</ul> <!-- End Profile Dropdown Items --></li>
				
				</c:if>
			<!-- End Profile Nav -->
		</ul>
	</nav>
	<!-- End Icons Navigation -->
</header>