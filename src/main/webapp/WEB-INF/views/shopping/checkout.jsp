<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

						<%
							if(request.getSession().getAttribute("productCartList") == null) { %>
								<h4 style="color: red; text-align: center">Vui lòng thêm sản phẩm vào giỏ hàng để thanh toán!</h4>
						<%	} else { %>
								<div class="col-lg-7 mb--20">
									<div id="billing-form" class="mb-40">
										<h4 class="checkout-title">Thông Tin Thanh Toán</h4>
										<form id="frmCheckout" method="POST" action="<c:url value="/checkout" />">
											<div class="row">
												<div class="col-12 mb--20">
													<label>Tên</label>
													<input type="text" name="name" value="${sessionScope.user.firstName}">
												</div>
												<div class="col-12 mb--20">
													<label>Địa Chỉ</label>
													<input type="text" name="address" value="${sessionScope.user.address}">
												</div>
												<div class="col-md-6 col-12 mb--20">
													<label>Email</label>
													<input type="email" name="email" value="${sessionScope.user.email}">
												</div>
												<div class="col-md-6 col-12 mb--20">
													<label>Số Điện Thoại</label>
													<input type="text" name="phoneNumber" value="${sessionScope.user.phoneNumber}">
												</div>
											</div>
										</form>
									</div>
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
													<c:forEach items="${sessionScope.productCartList}" var="productCart">
														<li>
															<span class="left">
																${productCart.product.name} × ${productCart.quantity}
															</span>
															<span class="right">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${productCart.product.price}"/> VNĐ
															</span>
														</li>
													</c:forEach>
												</ul>
												<p>
													Tạm Tính
													<span>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.totalPrice}"/> VNĐ
													</span>
												</p>
												<p>
													Phí Vận Chuyển <span>Miễn phí</span>
												</p>
												<h4>
													Tổng Cộng
													<span>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.totalPrice}"/> VNĐ
													</span>
												</h4>
												<button id="btnSubmit" class="place-order w-100">Đặt Hàng</button>
											</div>
										</div>
									</div>
								</div>
						<% 	}	%>

					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>

	$('#btnSubmit').on('click', function() {
		$('#frmCheckout').submit();
	});

</script>