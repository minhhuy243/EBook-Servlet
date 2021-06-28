<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main id="content"
	class="page-section inner-page-sec-padding-bottom space-db--20">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Checkout Form s-->
				<div class="checkout-form">
					<div class="row row-40">
						<div class="col-12">
							<h1 class="quick-title">Thanh Toán</h1>							
						</div>
						<div class="col-lg-7 mb--20">
							<!-- Billing Address -->
							<div id="billing-form" class="mb-40">
								<h4 class="checkout-title">Thông Tin Thanh Toán</h4>
								<div class="row">																
									<div class="col-12 mb--20">
										<label>Tên</label> <input type="text"
											placeholder="Company Name">
									</div>
									<div class="col-12 mb--20">
										<label>Địa Chỉ</label> <input type="text"
											placeholder="Company Name">
									</div>									
									<div class="col-md-6 col-12 mb--20">
										<label>Email</label> <input type="email"
											placeholder="Email Address">
									</div>
									<div class="col-md-6 col-12 mb--20">
										<label>Số Điện Thoại</label> <input type="text"
											placeholder="Phone number">
									</div>									
								</div>
							</div>
							<!-- Shipping Address -->

						</div>
						<div class="col-lg-5">
							<div class="row">
								<!-- Cart Total -->
								<div class="col-12">
									<div class="checkout-cart-total">
										<h2 class="checkout-title">Đơn Hàng</h2>
										<h4>
											Sản Phẩm <span>Tổng</span>
										</h4>
										<ul>
											<li><span class="left">Cillum dolore tortor nisl
													X 01</span> <span class="right">$25.00</span></li>
											<li><span class="left">Auctor gravida
													pellentesque X 02 </span><span class="right">$50.00</span></li>
											<li><span class="left">Condimentum posuere
													consectetur X 01</span> <span class="right">$29.00</span></li>
											<li><span class="left">Habitasse dictumst
													elementum X 01</span> <span class="right">$10.00</span></li>
										</ul>
										<p>
											Tạm Tính <span>$104.00</span>
										</p>
										<p>
											Phí Vận Chuyển <span>$00.00</span>
										</p>
										<h4>
											Tổng Cộng <span>$104.00</span>
										</h4>		
										<button class="place-order w-100">Đặt Hàng</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>