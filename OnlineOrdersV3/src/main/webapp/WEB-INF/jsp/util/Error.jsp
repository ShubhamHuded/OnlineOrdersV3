
<%@ page isErrorPage="true"%>
<html>
<head>
<title>Ooops something went wrong</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
.error-box {
	position: relatve;
}

.erro--img__box {
	position: absolute;
	top: 40%;
	left: 47%;
	transform: translate(-40%, -50%);
}

.error--msg {
	margin-top: 1rem;
}
</style>
</head>
<body>
	<div class="error-box">
		<div class="erro--img__box">
			<div class="d-flex d-center">
				<img src="/images/bad-server.jpg"
					alt="internal server error"
					style="width: 300px; height: 300px;" />
			</div>
			<div class="d-flex d-center d-col error--msg">
				<h3>Internal! Server Error</h3>
				<p style="text-align: center;margin-top:1rem;">
					Sorry, there were some technical<br /> issues while
					processing your request, wait some time or relogin
				</p>
			</div>
		</div>
	</div>
</body>
</html>


