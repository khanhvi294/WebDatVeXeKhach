<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Bootstrap 5 404 Error Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div
		class="d-flex flex-column align-items-center justify-content-center vh-100 bg-primary">
		<h1 class="display-1 fw-bold text-white">403</h1>
		<h3><strong>Oops!</strong>&nbsp; Bạn không được quyền truy cập tài nguyên này</h3>
		<div>

			<c:choose>
				<c:when test="${ empty tkdn == false }">
					<c:if test="${tkdn.vaiTro.maVT != 'KH' }">
						<a href="quanly/trangchu.html" class="btn btn-light"> <span>
								Trang chủ </span></a/>
					</c:if>
				</c:when>
				<c:otherwise>
					<a href="trangchu.html" class="btn btn-light"> <span>
							Trang chủ </span></a/>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</body>

</html>