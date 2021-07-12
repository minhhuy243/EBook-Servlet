<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
								<tbody id="productCartTable">
									<!-- Product Row -->
									<c:forEach items="${sessionScope.productCartList}" var="productCart">
										<tr>
											<td class="pro-remove"><a data-id="${productCart.product.id}" href="#"><i
													class="far fa-trash-alt"></i></a></td>
											<td class="pro-thumbnail"><a href="<c:url value="/product/detail?id=" />${productCart.product.id}"><img
													src="<c:url value="/assets/"/>${productCart.product.avatar}" alt="Product"></a></td>
											<td class="pro-title"><a href="<c:url value="/product/detail?id=" />${productCart.product.id}">
													${productCart.product.name}</a></td>
											<td class="pro-price">
												<span>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${productCart.product.price}"/> VNĐ
												</span>
											</td>
											<td class="pro-quantity">
												<div class="pro-qty">
													<div class="count-input-block">
														<input data-id="${productCart.product.id}" type="number" class="form-control text-center"
															   value="${productCart.quantity}">
													</div>
												</div>
											</td>
											<td class="pro-subtotal">
												<span>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${productCart.quantity * productCart.product.price}"/> VNĐ
												</span>
											</td>
										</tr>
									</c:forEach>
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
								Tổng Tiền Sản Phẩm
								<span id="totalPriceProductCart1" class="text-primary">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.totalPrice}"/> VNĐ
								</span>
							</p>
							<p>
								Phí Vận Chuyển <span class="text-primary">Miễn phí</span>
							</p>
							<h2>
								Tổng Cộng
								<span id="totalPriceProductCart2" class="text-primary">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.totalPrice}"/> VNĐ
								</span>
							</h2>
						</div>
						<div class="cart-summary-button">
							<a href="<c:url value="/checkout" />" class="checkout-btn c-btn btn--primary">Thanh Toán</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>