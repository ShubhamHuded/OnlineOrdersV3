<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="Error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BRPL | Registration form</title>
<link rel="icon" type="image/x-icon" href="../images/favicon.jpg">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/spin.css" />

<script src="../javascript/BrplUtility.js"></script>
<script src="../javascript/OtpTemplet.js"></script>
<script src="../javascript/Dialog.js"></script>
<script src="../javascript/modal.js"></script>

</head>
<body>
	<c:if test="${fieldRequired}">
		<jsp:include page="../home/SignUpNavBar.jsp" />
	</c:if>
	<div id="spinid"></div>
	<form id="registrationform" autocomplete="off"
		action="/Online-Orders/subit-new-account">
		<div class="registration--container"
			style="width: 80%; background-color: #f0eedc; margin: auto; margin-top: 50px"
			id="form-conatiner">
			<div class="d-flex registration--container__base d-col">
				<div class="serverMsg">
					<span id="serverMsg" style="color: green; font-size: .8rem;"></span>
				</div>
				<c:if test="${fieldRequired}">
					<h3 style="margin-bottom: 1rem;">Create an account</h3>
				</c:if>

				<div class="register--left " id="main--base">
					<c:if test="${fieldRequired}">
						<div class="d-flex d-col">
							<label class="reg--label" for="userTitle">Title</label> <select
								class="regi--title" id="userTitle">
								<option value="">Mr</option>
								<option>Mrs</option>
							</select>
						</div>
					</c:if>
					<div class="registration__details gap-3">
						<div class="d-flex d-col ">
							<label class="reg--label" for="user-firstName">First Name
								<sup class="reg--require"> *</sup>
							</label> <input type="text" id="user-firstName" data-mandatory="true"
								data-event="focus,removeWarning" name="userFirstName"
								autocomplete="off" />
						</div>
						<div class="d-flex d-col">
							<label class="reg--label" for="user-middleName">Middle
								Name </label> <input type="text" id="user-middleName"
								data-event="focus,removeWarning" name="userMiddleName"
								autocomplete="off" />
						</div>
						<div class="d-flex d-col">
							<label class="reg--label" for="user-LastName">Last Name <sup
								class="reg--require"> *</sup>
							</label> <input type="text" id="user-LastName" data-mandatory="true"
								data-event="focus,removeWarning" name="userLastName"
								autocomplete="off" />
						</div>
					</div>

					<div class="registration__details gap-3">
						<div class="d-flex d-col">
							<label class="reg--label" for="user--email">Email <sup
								class="reg--require"> *</sup>
							</label> <input type="email" id="user--email" data-mandatory="true"
								data-event="blur focus,emailValidator removeWarning"
								name="userEmailId" autocomplete="off" />
						</div>
						<div class="d-flex d-col">
							<label class="reg--label" for="user--mobile">Mobile No <sup
								class="reg--require"> *</sup>
							</label> <input type="tel" id="user--mobile" data-mandatory="true"
								data-event="blur focus,mobileNoValidator removeWarning"
								name="userMobile" autocomplete="off" />
						</div>
					</div>

					<div class="registration__details gap-3">
						<div class="d-flex d-col">
							<label class="reg--label" for="user-pass1">Create
								Password <sup class="reg--require"> *</sup>
							</label> <input type="password" id="user-pass1" data-mandatory="true"
								data-pass data-event="blur focus,validatePassword removeWarning"
								name="userPassword" autocomplete="off" />
						</div>
						<div class="d-flex d-col">
							<label class="reg--label" for="user-pass2">Confirm
								Password <sup class="reg--require"> *</sup>
							</label> <input type="password" id="user-pass2" data-mandatory="true"
								data-pass
								data-event="blur focus,comparePassswords removeWarning"
								autocomplete="off" />
						</div>
					</div>
					<c:if test="${fieldRequired}">
						<div class="tacbox">
							<div>
								<input id="checkbox" type="checkbox" data-mandatory="true"
									data-event="focus,removeWarning" autocomplete="off" /> <label
									for="checkbox" style="font-size: .8rem;"> I agree to
									these </label> <a style="color: #D60000; font-size: .8rem;"
									data-eve-reg="click,opens" role="button">Terms and
									Conditions</a>
							</div>

						</div>
					</c:if>
					<c:if test="${AdminField}">
						<dic class="d-flex" style="gap:10px"> <label> <input
							type="radio" name="data-flow" value="with otp"> with otp
						</label> <label> <input type="radio" name="data-flow"
							value="without otp"> without otp
						</label>
				</div>
				</c:if>
				<div class="d-flex" style="margin-top: 1rem;">
					<button id="formSubmit" value="submit" data-event="click,submit"
						style="padding: 6px;" autocomplete="off" data-modal-view
						class="btn btn-primary">submit</button>
				</div>
				<c:if test="${fieldRequired}">
					<p style="margin-top: 18px;">
						Already registered? <a href="/Online-Orders/app/login"
							style="color: blue; font-size: .8rem;">Sign in here</a>
					</p>
				</c:if>
			</div>

		</div>
		</div>
	</form>
	<c:if test="${fieldRequired}">
		<jsp:include page="../home/footer.jsp" />
	</c:if>
	<c:if test="${fieldRequired}">
		<script src="../../javascript/CreateAccount.js" type="module"></script>
	</c:if>
	<script src="../javascript/CreateAccount.js" type="module"></script>
</body>
</html>







