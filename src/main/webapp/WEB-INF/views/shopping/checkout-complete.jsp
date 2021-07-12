<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="order-complete inner-page-sec-padding-bottom">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="order-complete-message text-center">
                    <h1>Thành công !</h1>
                    <p>Đơn đặt hàng của bạn đã được tiếp nhận.</p>
                </div>
                <ul class="order-details-list">
                    <li>Mã đặt hàng: <strong>${purchase.id}</strong></li>
                    <li>Ngày: <strong>${purchase.createdAt}</strong></li>
                    <li>Tổng: <strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${purchase.total}"/> VNĐ</strong></li>
                </ul>
                <h3 class="order-table-title">Chi tiết đặt hàng</h3>
                <div class="table-responsive">
                    <table class="table order-details-table">
                        <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Tổng</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productCartList}" var="productCart">
                                <tr>
                                    <td>
                                        <a href="<c:url value="/product/detail?id=" />${productCart.product.id}">
                                            ${productCart.product.name}
                                        </a>
                                        <strong>× ${productCart.quantity}</strong>
                                    </td>
                                    <td><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${productCart.product.price}"/> VNĐ</span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>