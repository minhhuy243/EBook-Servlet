<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main class="cart-page-main-block inner-page-sec-padding-bottom">
	<div class="cart_area cart-area-padding  ">
		<div class="container">
			<div class="page-section-title">
				<h1>Giỏ Hàng</h1>
			</div>
			<div class="row">
				<div class="col-12">
					<form action="#" class="">
						<!-- Cart Table -->
						<div class="cart-table table-responsive mb--40">
							<table class="table">
								<!-- Head Row -->
								<thead>
									<tr>
										<th class="pro-remove"></th>
										<th class="pro-thumbnail">Ảnh</th>
										<th class="pro-title">Sản Phẩm</th>
										<th class="pro-price">Giá</th>
										<th class="pro-quantity">Số Lượng</th>
										<th class="pro-subtotal">Tổng</th>
									</tr>
								</thead>
								<tbody>
									<!-- Product Row -->
									<tr>
										<td class="pro-remove"><a href="#"><i
												class="far fa-trash-alt"></i></a></td>
										<td class="pro-thumbnail"><a href="#"><img
												src="image/products/product-1.jpg" alt="Product"></a></td>
										<td class="pro-title"><a href="#">Rinosin Glasses</a></td>
										<td class="pro-price"><span>$395.00</span></td>
										<td class="pro-quantity">
											<div class="pro-qty">
												<div class="count-input-block">
													<input type="number" class="form-control text-center"
														value="1">
												</div>
											</div>
										</td>
										<td class="pro-subtotal"><span>$395.00</span></td>
									</tr>
									<!-- Product Row -->
									<tr>
										<td class="pro-remove"><a href="#"><i
												class="far fa-trash-alt"></i></a></td>
										<td class="pro-thumbnail"><a href="#"><img
												src="image/products/product-2.jpg" alt="Product"></a></td>
										<td class="pro-title"><a href="#">Rinosin Glasses</a></td>
										<td class="pro-price"><span>$395.00</span></td>
										<td class="pro-quantity">
											<div class="pro-qty">
												<div class="count-input-block">
													<input type="number" class="form-control text-center"
														value="1">
												</div>
											</div>
										</td>
										<td class="pro-subtotal"><span>$395.00</span></td>
									</tr>
							
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="cart-section-2">
		<div class="container">
			<div class="row justify-content-center">
				
				<!-- Cart Summary -->
				<div class="col-lg-6 col-12 d-flex">
					<div class="cart-summary">
						<div class="cart-summary-wrap">
							<h4>
								<span>Giỏ Hàng</span>
							</h4>
							<p>
								Tổng Tiền Sản Phẩm <span class="text-primary">$1250.00</span>
							</p>
							<p>
								Phí Vận Chuyển <span class="text-primary">$00.00</span>
							</p>
							<h2>
								Tổng Cộng <span class="text-primary">$1250.00</span>
							</h2>
						</div>
						<div class="cart-summary-button">
							<a href="checkout.html" class="checkout-btn c-btn btn--primary">Thanh Toán</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>