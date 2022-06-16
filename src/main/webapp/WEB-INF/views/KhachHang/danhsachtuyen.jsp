<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<style>
.dstuyen-container {
	margin: 50px 70px;
}

.table>tbody>tr>td {
	border-top: none;
}
</style>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row dstuyen-container">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<h3 class="panel-heading" style="font-weight: 700;">Danh sách tuyến</h3>

				<!-- Table -->
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Tuyến xe</th>
							<th>Thời gian hành trình</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="dd" items="${diadiem }">
							<c:if test="${dd.tuyenxedi.size() !=0}">

								<tr style="background-color: antiquewhite;">
									<td colspan="3"><span style="color: orange;font-size: 16px; font-weight: 600;">${dd.diaDiem } &nbsp; =>
											</span></td>

								</tr>
								<c:forEach var="tuyen" items="${dd.tuyenxedi }">
									<c:if test="${tuyen.trangThai==true}">
									
										<tr>

											<td><a
												href="timchuyen.html?chon&di=${dd.maDD }&den=${tuyen.diemDen.maDD}"
												style="padding-left: 65px;">
													<span>${tuyen.diemDen.diaDiem } </span>

											</a></td>
											<td>
													<span>
													
													<fmt:formatNumber type="number"
														value="${(tuyen.tgchay/60) }" maxFractionDigits="0" />
													giờ <fmt:formatNumber type="number" value="${(tuyen.tgchay % 60) }" maxFractionDigits="0"/> phút
													</span>
											</td>
											<td> 
												<a  href="timchuyen.html?chon&di=${dd.maDD }&den=${tuyen.diemDen.maDD}" class="btn btn-info" >Đặt vé</a>
											</td>

										</tr>
									

									</c:if>
								</c:forEach>

							</c:if>


						</c:forEach>




					</tbody>
				</table>
			</div>
		</div>
	</div>

<%-- 	<c:forEach var="dd" items="${diadiem }">
		<c:if test="${dd.tuyenxedi.size() !=0}">
			<p>điểm đi : ${dd.diaDiem }</p>

			<c:forEach var="tuyen" items="${dd.tuyenxedi }">
				<c:if test="${tuyen.trangThai==true}">
					<p>điểm đến : ${tuyen.diemDen.diaDiem }</p>
					<a
						href="timchuyen.html?chon&di=${dd.maDD }&den=${tuyen.diemDen.maDD}">
						<div style="background-color: #000; width: 70px; height: 15px;">


						</div>
					</a>


				</c:if>
			</c:forEach>
			<hr>
		</c:if>


	</c:forEach> --%>
	<%@include file="footer.jsp"%>
</body>
</html>