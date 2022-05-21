<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- ProfileViewModal -->
<div class="modal fade" id="ProfileViewModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content border-0" style="width: 660px;">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Thông tin</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close"
					style="font-weight: 700;">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<!-- profile -->
				<div id="modal-main" class="main">
					<section class="section profile">
						<div class="row">
							<div class="col-xl-12">
								<div class="card v-modal-de">
									<div class="card-body pt-3">
										<!-- Bordered Tabs -->
										<div class="tab-content pt-2">
											<div class="tab-pane fade show active profile-overview"
												id="profile-overview">
												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Mã
														chuyến</div>
													<div class="col-lg-8 col-md-5" name = ""></div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Tuyến</div>
													<div class="col-lg-8 col-md-5">Lueilwitz, Wisoky and
														Leuschke</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Nhân
														viên</div>
													<div class="col-lg-8 col-md-5">Web Designer</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Thời
														gian</div>

													<div class="col-lg-4 col-md-5">22/02/2022</div>

													<div class="col-lg-4 col-md-5">18:00</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Giá</div>
													<div class="col-lg-8 col-md-5">180.000</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Xe khách</div>
													<div class="col-lg-8 col-md-5">k.ande</div>
												</div>
											</div>
										</div>
										<!-- End Bordered Tabs -->
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- end profile -->
			</div>
		</div>
	</div>
</div>