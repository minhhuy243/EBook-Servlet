<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main class="page-section inner-page-sec-padding-bottom" style="margin-top: 50px;">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb--30 mb-lg--0">
				<!-- Login Form s-->
				<form>
					<div class="login-form">
						<h4 class="login-title">Đăng Ký</h4>
						<div class="row">
							<div class="col-lg-6 mb--20">
								<label for="last-name">Họ</label> <input
									class="mb-0 form-control" type="text" id="last-name" name="last-name"
									placeholder="Nhập họ của bạn">
								<span id="error-lastName" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
							</div>
							<div class="col-lg-6 mb--20">
								<label for="first-name">Tên</label> <input
									class="mb-0 form-control" type="text" id="first-name" name="first-name"
									placeholder="Nhập tên của bạn">
								<span id="error-firstName" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
							</div>
							<div class="col-12 mb--20">
								<label for="email">Email</label> <input
									class="mb-0 form-control" type="email" id="email" name="email"
									placeholder="Nhập email của bạn">
								<span id="error-email" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
							</div>
							<div class="col-12 mb--20">
								<label for="email">Địa Chỉ</label> <input
									class="mb-0 form-control" type="text" id="address" name="address"
									placeholder="Nhập địa chỉ của bạn">
								<span id="error-address" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
							</div>
							<div class="col-12 mb--20">
								<label for="email">Số Điện Thoại</label> <input
									class="mb-0 form-control" type="number" id="phone-number" name="phone-number"
									placeholder="Nhập số điện thoại của bạn">
								<span id="error-phoneNumber" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
							</div>
							<div class="col-12 mb--20">
								<label for="password">Mật khẩu</label> <input
									class="mb-0 form-control" type="password" id="password" name="password"
									placeholder="Nhập mật khẩu của bạn">
								<span id="error-password" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
							</div>											
							<div class="col-md-12">
								<a style="cursor: pointer;" id="btnSubmit" class="btn btn-outlined">Đăng Ký</a>
							</div>
						</div>
					</div>
				</form>
			</div>		
		</div>
	</div>
</main>

<script>

	function removeErrors() {
		$('#error-email').text('').css('display', 'none');
	    $('#email').css('borderBottom', '2px solid #eeeeee');
	    
	    $('#error-lastName').text('').css('display', 'none');
	    $('#last-name').css('borderBottom', '2px solid #eeeeee');
	    
	    $('#error-firstName').text('').css('display', 'none');
	    $('#first-name').css('borderBottom', '2px solid #eeeeee');
	    
	    $('#error-address').text('').css('display', 'none');
	    $('#address').css('borderBottom', '2px solid #eeeeee');
	    
	    $('#error-phoneNumber').text('').css('display', 'none');
	    $('#phone-number').css('borderBottom', '2px solid #eeeeee');
	    
	    $('#error-password').text('').css('display', 'none');
	    $('#password').css('borderBottom', '2px solid #eeeeee');
	}
	
	function setErrors(errors) {
		if(errors.email) {
			$('#error-email').text(errors.email).css('display', 'block');
		    $('#email').css('borderBottom', '1px solid red');
		}
		    
		if(errors.lastName) {
			$('#error-lastName').text(errors.lastName).css('display', 'block');
		    $('#last-name').css('borderBottom', '1px solid red');
		}
	        
		if(errors.firstName) {
			$('#error-firstName').text(errors.firstName).css('display', 'block');
		    $('#first-name').css('borderBottom', '1px solid red');
		}	    
	    	        
		if(errors.address) {
			$('#error-address').text(errors.address).css('display', 'block');
		    $('#address').css('borderBottom', '1px solid red');
		}
	        
		if(errors.phoneNumber) {
			$('#error-phoneNumber').text(errors.phoneNumber).css('display', 'block');
		    $('#phone-number').css('borderBottom', '1px solid red');
		}
	    	    
		if(errors.password) {
			$('#error-password').text(errors.password).css('display', 'block');
		    $('#password').css('borderBottom', '1px solid red');
		}    	    
	}

	$('#btnSubmit').on('click', async function () {
		await axios.post("<c:url value="/register" />", {
            email: $('#email').val(),
            password: $('#password').val(),
            lastName: $('#last-name').val(),
            firstName: $('#first-name').val(),
            address: $('#address').val(),
            phoneNumber: $('#phone-number').val()
        }).then((res) => {
            Swal.fire({
                title: 'Đăng ký tài khoản thành công',
                html:
                	'Họ: ' + res.data.lastName +
                    '<br>Tên: ' + res.data.firstName +
                    '<br>Email: ' + res.data.email +
                    '<br>Địa chỉ: ' + res.data.address +
                    '<br>Số điện thoại: ' + res.data.phoneNumber,
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