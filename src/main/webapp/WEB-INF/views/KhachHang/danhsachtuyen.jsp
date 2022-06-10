<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<body>
	<%@include file="navbar.jsp"%>
	<c:forEach var="dd" items="${diadiem }">
		<c:if test="${dd.tuyenxedi.size() !=0}">
			<p>điểm đi : ${dd.diaDiem }</p>

			<c:forEach var="tuyen" items="${dd.tuyenxedi }">
				<c:if test="${tuyen.trangThai==true}">
				<p>điểm đến : ${tuyen.diemDen.diaDiem }</p>
				<a
							href="timchuyen.html?chon&di=${dd.maDD }&den=${tuyen.diemDen.maDD}">
				<div style="background-color: #000; width: 70px;height:15px;">
				
						
					</div>
					</a>
					
					
				</c:if>
			</c:forEach>
			<hr>
		</c:if>


	</c:forEach>
	<%@include file="footer.jsp"%>
</body>
</html>