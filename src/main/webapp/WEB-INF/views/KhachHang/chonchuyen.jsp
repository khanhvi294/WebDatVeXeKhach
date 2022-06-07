<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="head.jsp"%>

<body class="wheel-bg2">
	<!-- MAIN -->
	<%@include file="navbar.jsp"%>
	<!-- ////////////////////////////////////////////////////////////// -->

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
						<li class="title-wrap active ">
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
	<div class="prosuct-wrap">
		<div class="container padd-lr0 xs-padd">
			<div class="row">
				<div class="col-sm-8">
					<header class="wheel-header marg-lg-t25 marg-lg-b65">
						<h3>
							Danh sách chuyến xe từ <span>${diemdi} </span> đến <span>
								${diemden} </span>
						</h3>
					</header>
				</div>
			</div>

		</div>
		<div class="container padd-lr0 xs-padd">
			<form action="chonghe.html" method="post">
				<div class="product-list product-list2 wheel-bgt clearfix">
					<c:forEach var="cx" items="${dschuyenxe}">
						<div class="row" style="display: flex; justify-content: center;">
							<div class="col-xs-9" >
								<div
									class="product-elem-style1 product-elem-style wheel-bg1 clearfix"
									style="border-radius: 10px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
									<div class="product-table3" style="width: 70%;">
										<div class="text-wrap text-wrap2 product-cell">
											<div class="title" style="margin-bottom: 15px;">${cx.tgKh }
												<i class="fa fa-long-arrow-right"></i> 08:00
											</div>
											<div class="price-wrap step-progress product-cell "
												style="display: flex; gap: 0 10px;">
												<p>
													<i class="fa fa-circle"></i> ${cx.gia }
												</p>
												<p>
													<i class="fa fa-circle" aria-hidden="true"></i>
													${cx.xekhach.lx.tenLX }
												</p>
												<p>
													<i class="fa fa-circle"></i> Còn ${cx.sochotrong } chỗ
												</p>
											</div>
										</div>
										<div class="route-line-container">
											<div class="route-line-list"
												style="display: flex; flex-direction: column; gap: 15px;">
												<div class="route-line bold" style="font-weight: 600;">
													<img alt="pickup-bold"
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAn1BMVEUAAAAAAAAAgAAAVVUAbUkAYEAAYkUAYkMAYjwAYD4AYTwAYD0AYT4AYTwAYT0AYT0AYT0AYT0AYT0AYT0AYDwAYT0AYT0AYT0AYD0AYT3////+/v79/f39/fzv8/HV4dzL29WTr6I0d1orakwfZUQWY0IPY0APYT4HYj8MXzwGYT4DYT0AYjwAYT0AYTwAYD0AYDwAXTYAXDAAWS0ASwCRAZr+AAAAGnRSTlMAAQIDBxgaIi9Se5eZwsja4Orx9/r7/P39/ifZSUoAAAFmSURBVHjahVMJjoMwDHS37fY+odBAuQrlTmKO/79tTUBVVWmVERLKzCSxHRtGzOYAy83+eDGMy3G/WQLMZ/CBH4DV7iRwgjjtVgP5xhwW2yvi3WKMc8asO+J1uyD6vf/3wPFmC8klgUth35AffkmY9q/P0mTIJcoJHJkpz2uSxv1nNDnpH6CliWd1xgwWBznq3w55WJA8hy0nfSKrsqwmMxK9JRlWV2QDxTnmSdY0WZIjH9ZEXylb2OFt0tOib+O47Yt0dJCwA1ie0Obq/FdXR6Hvh1HdvVBRNp6WsBF3ofS0ewaOQvDsUuUgaQN7tIb8MS/qwPEervvwnKAuchW2hXs4IlPHJX3keK7j0uc5UZ8okuERLsgkocra0Hk4LoF+YZtVRCLDCxhj1mUT+0pWFj9uyrEyhtagv4KCFP8FKShIbZraQmlLrX0s7XNrG0bbcrqm1bX99+AIsqD4GBz96OmHVzv+f2mSel1r7cqaAAAAAElFTkSuQmCC"
														width="16" height="16" data-v-7026b95e="" />
													${cx.tuyen.diemDi.diaDiem }

												</div>
												<div style="margin-left: 32px; color: green;">Xe
													tuyến: 305km - 8 tiếng</div>
												<div class="route-line bold" style="font-weight: 600;">
													<img alt="destination-bold"
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAmCAMAAACS/WnbAAAA51BMVEUAAAD/AAD/ZjPmTRrvUCDwWh7yTSbzUSP2VSbwUiXwUCT4VSPxUyLyUSLwVSPxVSbyVSTtUSTzUiHuVCPvVSPxUyPxVCPxUyPvUyPwUyLwUyPxUyPwUyPwUiLxUiLvUyPwUiLwVCLvVCLwUyLvUyLvUiLwUyPwUiLvUyPvUyLwUiPwUyLvUiLvUiLwUiLvUyLwUiLvUiPxUyLwUiLwUyLvUiLwUiLvUyLvUyLwUyLvUiLwUiPvUiPvUiL////++ff83tX71sv1knTxZjzwXC70VCPyUyLxUyLwUiLvUiLvUSHvTx/vTh3N/rktAAAAPnRSTlMAAQUKEBEUFhsiIyQlJjM2OTk+SWBsbW5ueHuEhIiPk56rrra8xcfJ1dXW2Nna3OHi5efo6u3v9Pb5+vv7/K+Q08cAAAFUSURBVHjafdPllsIwEAXgu8YKrOHu7u5umQHe/3kWerophabfz9w5k2RyAunxwxPPlobDUjbu+XjEne9shwQRM5GgTvYbZp+pHZvsUp+44m0JviFaXki+CVuY+KDzT9nS1A+Ne8AKAzcuKsQKVMFZWLCSCAOOKhsOx9PpeGBD1YHfsRFv16vFYrXeGiXjX0SFzDfLuWa5kRUiijyxbqvlWsWWdZRHWzZYz6W1bNHGiHXH1VxaHVk3Qp91p8VcWpxY10eF7AqogjTZbUFpBPd2h9wH8TO2u+b4B46a3aBqDiBJ6lFTEoBrpn6smQtnCcEKIoGL9y4rdN+hiQlFgxh0RWILVMS/rx5b6H1BCrCFAAwPkfufFXnAlZccsQnlXmDyWiZTXn7FDVedWKK6C3ecDZJ5wwkLzqpgjag6YemtILS88AaF54wgEplnKD2Fms3Qk2npDzuS7aPkEDnLAAAAAElFTkSuQmCC"
														width="16" height="19" data-v-7026b95e="" />
													${cx.tuyen.diemDen.diaDiem }
												</div>

											</div>


										</div>
									</div>




									<div style=" height: 250px; display: flex;">
										<div
											style="display: flex; align-items: center; height: 50px; gap: 10px; position: relative; top: 74%; left: 57%;">
											<label for="ip-cx" style="position: relative; top: 10%;">Chọn</label>
											<input type="radio" name="machuyen" id="ip-cx"
												value="${cx.maChuyen }" class="choose-cx" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					<div class="promo promo2">
						<button class="wheel-btn" id="Re3">Tiếp theo</button>
					</div>
				</div>

			</form>
		</div>
	</div>


	<!-- FOOTER -->
	<!-- ///////////////// -->

	<%@include file="footer.jsp"%>
	<!-- Scripts project -->
	<%@include file="script.jsp"%>
	<script type="text/javascript">
		const btnSubmit = $("#Re3");
		btnSubmit.click(function(e) {
			if ($("input[name='machuyen']:checked").val() == null) {
				alert("Vui lòng chọn chuyến trước khi tiếp tục")
				e.preventDefault()
			}
		})
	</script>
	<!-- sixth block end -->
</body>
</html>
