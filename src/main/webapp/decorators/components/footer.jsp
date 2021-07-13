<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript" src="<c:url value="/assets/js/plugins.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/custom.js"/>"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

    function showError(error) {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: error.errorQuantity
        });
    }

    function renderProductCartHeader(productCartList, totalPrice) {
        let html = productCartList.map((productCart) => {
            return '<div class="cart-product">' +
                        '<a href="<c:url value="/product/detail?id=" />' + productCart.product.id + '"class="image">' +
                            '<img src="<c:url value="/assets/" />' + productCart.product.avatar + '"alt="">' +
                        '</a>' +
                        '<div class="content">' +
                            '<h3 class="title">' +
                                '<a href="<c:url value="/product/detail?id=" />' + productCart.product.id + '">' + productCart.product.name + '</a>' +
                            '</h3>' +
                            '<p class="price">' +
                                '<span class="qty">' + productCart.quantity + ' ×</span> ' + productCart.product.price.toLocaleString("it-IT") + ' VNĐ' +
                            '</p>' +
                            '<button data-id="' + productCart.product.id + '" class="cross-btn">' +
                                '<i class="fas fa-times"></i>' +
                            '</button>' +
                        '</div>' +
                    '</div>';
        }).join(' ');

        $('#productCartHeader').empty().append(html);
        $('#totalProductCartHeader').text(productCartList.length);
        $('#totalPriceProductCartHeader').text(totalPrice.toLocaleString("it-IT") + ' VNĐ')
            .append('<i class="fas fa-chevron-down"></i>');
    }

    function renderProductCart(productCartList, totalPrice) {
        let html = productCartList.map((productCart) => {
            return '<tr>' +
                        '<td class="pro-remove"><a href="#"><i class="far fa-trash-alt"></i></a></td>' +
                        '<td class="pro-thumbnail"><a href="<c:url value="/product/detail?id=" />' + productCart.product.id + '">' +
                            '<img src="<c:url value="/assets/" />' + productCart.product.avatar + '" alt="Product"></a></td>' +
                        '<td class="pro-title"><a href="<c:url value="/product/detail?id="/>' + productCart.product.id + '">' +
													productCart.product.name + '</a></td>' +
                        '<td class="pro-price">' +
                            '<span>' +
                                productCart.product.price.toLocaleString("it-IT") + ' VNĐ' +
                            '</span>' +
                        '</td>' +
                        '<td class="pro-quantity">' +
                            '<div class="pro-qty">' +
                                '<div class="count-input-block">' +
                                    '<input data-id="' + productCart.product.id + '" type="number" class="form-control text-center"' +
                                        'value="' + productCart.quantity + '">' +
                                '</div>' +
                            '</div>' +
                        '</td>' +
                        '<td class="pro-subtotal">' +
                            '<span>' +
                                (productCart.quantity * productCart.product.price).toLocaleString("it-IT") + ' VNĐ' +
                            '</span>' +
                        '</td>' +
                    '</tr>'
        }).join(' ');

        $('#productCartTable').empty().append(html);
        $('#totalPriceProductCart1').text(totalPrice.toLocaleString("it-IT") + ' VNĐ');
        $('#totalPriceProductCart2').text(totalPrice.toLocaleString("it-IT") + ' VNĐ');
    }

    $(document).on('ready', function () {

        /* Các sự kiện thêm/cập nhật sản phẩm vào giỏ hàng */

        $(".hover-btns a[data-id]").on("click", async function () { // Trang danh sách sản phẩm
            const id = $(this).data("id");
            await axios.post("<c:url value="/cart/add" />", {
                id: id
            }).then((res) => {
                renderProductCartHeader(res.data.productCartList, res.data.totalPrice);
            }).catch((error) => {
                showError(error.response.data);
            });
        });

        $("#btnAddCart").on("click", async function (e) { // Trang chi tiết
            e.preventDefault();
            const url = new URL(location.href);
            const id = url.searchParams.get("id");
            const quantity = $("#quantity").val();
            await axios.post("<c:url value="/cart/add" />", {
                id: id,
                quantity: quantity
            }).then((res) => {
                renderProductCartHeader(res.data.productCartList, res.data.totalPrice);
            }).catch((error) => {
                showError(error.response.data);
            });
        });

        $("body").on("blur", ".pro-quantity input[data-id]", async function () { // Trang giỏ hàng
            const id = $(this).data("id");
            const quantity = $(this).val();
            await axios.post("<c:url value="/cart/add" />", {
                id: id,
                quantity: quantity,
                update: 'true'
            }).then((res) => {
                renderProductCartHeader(res.data.productCartList, res.data.totalPrice);
                renderProductCart(res.data.productCartList, res.data.totalPrice);
            }).catch((error) => {
                showError(error.response.data);
            });
        });


        /* Các sự kiện xóa sản phẩm trong giỏ hàng */

        $("body").on("click", ".cart-product button[data-id]", async function () { // header
            const id = $(this).data("id");
            await axios.post("<c:url value="/cart/delete" />", {
                id: id
            }).then((res) => {
                renderProductCartHeader(res.data.productCartList, res.data.totalPrice);
            }).catch((error) => {
                showError(error.response.data);
            });
        });

        $("body").on("click", ".pro-remove a[data-id]", async function () { // Trang giỏ hàng
            const id = $(this).data("id");
            await axios.post("<c:url value="/cart/delete" />", {
                id: id
            }).then((res) => {
                renderProductCartHeader(res.data.productCartList, res.data.totalPrice);
                renderProductCart(res.data.productCartList, res.data.totalPrice);
            }).catch((error) => {
                showError(error.response.data);
            });
        });

    });

</script>