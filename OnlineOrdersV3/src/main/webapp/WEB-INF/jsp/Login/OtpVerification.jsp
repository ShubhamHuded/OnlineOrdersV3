<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="maipl.db.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<title>Verify OTP</title>
<style>
body {
	background: #eee;
}

.bgWhite {
	background: white;
	box-shadow: 0px 3px 6px 0px #cacaca;
}

.title {
	font-weight: 600;
	margin-top: 20px;
	font-size: 24px
}

.customBtn {
	border-radius: 0px;
	padding: 10px;
}

.otp--input input {
	display: inline-block;
	width: 50px;
	height: 50px;
	text-align: center;
}

.btn-primary {
	background-color: #db8319 !important;
}

.btn-primary:hover {
  color: #fff;
  background-color: #db8319;
  border-color: #db8319;
}

</style>

</head>
<body>



	<%
	// 	String email = request.getParameter("userEmailId");
	// 	if (email.length() > 1 && email != null)
	// 		RdbUserHelper.otpForRegistration(email);
	%>



	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-4 text-center">
				<div class="row">
					<div class="col-sm-12 mt-5 bgWhite">
						<div class="title">Verify OTP</div>

						<form action="" class="mt-5 otp--input d-flex justify-content-center" id="otpform">
							<input class="otp" type="text"
								oninput='digitValidate(this)' onkeyup='tabChange(1)'
								maxlength=1 name="one"> <input class="otp"
								type="text" oninput='digitValidate(this)'
								onkeyup='tabChange(2)' maxlength=1 name="two">
							<input class="otp" type="text"
								oninput='digitValidate(this)' onkeyup='tabChange(3)'
								maxlength=1 name="three"> <input class="otp"
								type="text" oninput='digitValidate(this)'
								onkeyup='tabChange(4)' maxlength=1 name="four">
						</form>
						<hr class="mt-4">
						<button
							class='btn btn-primary btn-block mt-4 mb-4 customBtn'
							id="verifyOtp" data-eve-reg="click,submit"
							value="verifyOtp">Verify</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 mt-2">
						<p>
							Resend OTP in <span id="countdowntimer"></span>
							Seconds
							<button
								class='btn btn-primary mt-4'
								id="resendOtp" 
								value="verifyOtp" data-eve-reg="click,resendotp" disabled>Resend Otp</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		let digitValidate = function(ele) {
			console.log(ele.value);
			ele.value = ele.value.replace(/[^0-9]/g, '');
		}

		let tabChange = function(val) {
			let ele = document.querySelectorAll('input');
			if (ele[val - 1].value != '') {
				ele[val].focus()
			} else if (ele[val - 1].value == '') {
				ele[val - 2].focus()
			}
		}
	</script>

	<script src="../javascript/AccountCreationOtp.js" type="module"></script>

</body>
</html>   