<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main class="page-section inner-page-sec-padding-bottom" style="margin-top: 50px;">
	<div class="container">
		<div class="row justify-content-md-center">
			
			<div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
						<form action="<c:url value="/login" />" method="POST">
							<div class="login-form">
								<h4 class="login-title">Đăng Nhập</h4>
								<div class="row">
									<div class="col-md-12 col-12 mb--15">
										<label for="email">Email</label>
										<input class="mb-0 form-control" type="email" id="email" name="email"
											placeholder="Nhập email của bạn">
										<span id="error-email" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
									</div>
									<div class="col-12 mb--20">
										<label for="password">Mật khẩu</label>
										<input class="mb-0 form-control" type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn">
										<span id="error-password" style="color: #ff0000; display: none; margin-top: 10px; margin-bottom: 10px;"></span>
									</div>
									<div class="col-md-12">
										<a style="cursor: pointer;" id="btnSubmit" class="btn btn-outlined">Đăng Nhập</a>
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
	    
	    $('#error-password').text('').css('display', 'none');
	    $('#password').css('borderBottom', '2px solid #eeeeee');
	}

	function setErrors(errors) {
		if(errors.email) {
			$('#error-email').text(errors.email).css('display', 'block');
		    $('#email').css('borderBottom', '1px solid red');
		}	    
	    	    
		if(errors.password) {
			$('#error-password').text(errors.password).css('display', 'block');
		    $('#password').css('borderBottom', '1px solid red');
		}    	    
	}
	
	$('#btnSubmit').on('click', async function () {
		await axios.post("<c:url value="/login" />", {
            email: $('#email').val(),
            password: $('#password').val()
        }).then((res) => {
        	location.href = "<c:url value="/" />";
        }).catch((error) => {
        	removeErrors();
            const errors = error.response.data;
            setErrors(errors);
        }); 
	});

</script>