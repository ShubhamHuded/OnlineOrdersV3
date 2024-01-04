<%@page language="java" import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="br.base.*"%>
<%@page language="java" import="maipl.server.*"%>
<%@page import="maipl.util.*"%>
<%@page import="org.json.*"%>
<%@ page errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>BRPL | Update Password</title>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
</head>
<style>
.border-danger {
	border: red 2px solid !important;
}

.border-success {
	border: green 2px solid !important;
}
</style>
<body>
	<%
	String referrer = request.getHeader("referer");

	ServletContext servletContext = getServletContext();
	String parameterValue = servletContext.getInitParameter("LocalHost");

	String expectedPage = "http://" + parameterValue + ":8080/home";

	System.out.println(expectedPage);
//referrer != null && referrer.equals(expectedPage)
	if (true) {
	%>
	<jsp:include page="../home/NavigationBar.jsp" />
	<div>
		<form action="/Online-Orders/update-reset" style="position: relative"
			; id="passwordReset" class="forgot-password">
			<div class="container mt-4">
				<div class="row justify-content-center">
					<div class="col-sm-4">

						<label>Current Password</label>
						<div class="form-group pass_show">
							<input type="password" class="form-control"
								placeholder="Confirm Password"
								data-eve-reg="blur,checkpassword">
						</div>
						<label>New Password</label>
						<div class="form-group pass_show">
							<input type="password" class="form-control"
								placeholder="New Password" data-pass
								data-eve-reg="blur,validatepassword" name="password">
						</div>
						<label>Confirm Password</label>
						<div class="form-group pass_show">
							<input type="password" class="form-control"
								placeholder="Confirm Password" data-pass
								data-eve-reg="blur,comparepassword">
						</div>
						<input disabled type="submit" value="submit"
							class="p-1" data-eve-reg="click,submit"
							id="forgot-submit" />
					</div>

				</div>
			</div>
		</form>
	</div>
	<%
	} else {
	// The page was not accessed from the expected page
	response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	//response.setStatus(404);
	request.getRequestDispatcher("/error").forward(request, response);

	}
	%>

	<div class="mt-5">
		<jsp:include page="../home/footer.jsp" />
	</div>
	<Script src="../Online-Orders/javascript/PasswordReset.js" type="module">
		
	</Script>



</body>
</html>