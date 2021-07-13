<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page-section inner-page-sec-padding">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <!-- My Account Tab Menu Start -->
                    <div class="col-lg-3 col-12">
                        <div class="myaccount-tab-menu nav" role="tablist">
                            <a href="#account-info" class="active" data-toggle="tab"><i class="fa fa-user"></i> Hồ sơ</a>
                        </div>
                    </div>
                    <!-- My Account Tab Menu End -->
                    <!-- My Account Tab Content Start -->
                    <div class="col-lg-9 col-12 mt--30 mt-lg--0">
                        <div class="tab-content" id="myaccountContent">
                            <!-- Single Tab Content Start -->
                            <div class="tab-pane fade show active" id="account-info" role="tabpanel">
                                <div class="myaccount-content">
                                    <h3>Hồ sơ</h3>
                                    <div class="account-details-form">
                                        <form>
                                            <div class="row">
                                                <div class="col-12  mb--30">
                                                    <h4>Đổi mật khẩu</h4>
                                                </div>
                                                <div class="col-12  mb--30">
                                                    <input id="current-pwd" name="current-pwd" placeholder="Mật khẩu hiện tại"
                                                           type="password">
                                                    <span id="error-current-pwd" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
                                                </div>
                                                <div class="col-lg-6 col-12  mb--30">
                                                    <input id="new-pwd" name="new-pwd" placeholder="Mật khẩu mới"
                                                           type="password">
                                                    <span id="error-new-pwd" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
                                                </div>
                                                <div class="col-lg-6 col-12  mb--30">
                                                    <input id="confirm-pwd" name="confirm-pwd" placeholder="Nhập lại mật khẩu mới"
                                                           type="password">
                                                    <span id="error-confirm-pwd" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
                                                </div>
                                                <div class="col-12">
                                                    <button id="btnSubmit" class="btn btn--primary">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Tab Content End -->
                        </div>
                    </div>
                    <!-- My Account Tab Content End -->
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    function removeErrors() {
        $('#error-current-pwd').text('').css('display', 'none');
        $('#current-pwd').css('borderBottom', '2px solid #eeeeee');

        $('#error-new-pwd').text('').css('display', 'none');
        $('#new-pwd').css('borderBottom', '2px solid #eeeeee');

        $('#error-confirm-pwd').text('').css('display', 'none');
        $('#confirm-pwd').css('borderBottom', '2px solid #eeeeee');
    }

    function setErrors(errors) {
        if(errors.currentPwd) {
            $('#error-current-pwd').text(errors.currentPwd).css('display', 'block');
            $('#current-pwd').css('borderBottom', '1px solid red');
        }

        if(errors.newPwd) {
            $('#error-new-pwd').text(errors.newPwd).css('display', 'block');
            $('#new-pwd').css('borderBottom', '1px solid red');
        }

        if(errors.confirmPwd) {
            $('#error-confirm-pwd').text(errors.confirmPwd).css('display', 'block');
            $('#confirm-pwd').css('borderBottom', '1px solid red');
        }
    }

    $('#btnSubmit').on('click', async function (e) {
        e.preventDefault();
        await axios.post("<c:url value="/user/changePwd" />", {
            currentPwd: $('#current-pwd').val(),
            newPwd: $('#new-pwd').val(),
            confirmPwd: $('#confirm-pwd').val()
        }).then((res) => {
            Swal.fire({
                title: 'Đổi mật khẩu thành công',
                icon: 'success',
                showCancelButton: false,
                confirmButtonColor: '#A5DC86',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "<c:url value="/" />";
                }
            })
        }).catch((error) => {
            removeErrors();
            const errors = error.response.data;
            setErrors(errors);
        });
    });

</script>