
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
.erro--img__box h3 {
text-align: center;
}
.erro--img__box img {
width:300px;
height:300px;
}
</style>
</head>
<body>
	<%
	int status = response.getStatus();
	String[] msgs = {"500 internal server Error", "404 Requested page NOt found", "301 request page is redirected"};
%>
	<div class="error-box">
	<div class="erro--img__box">
		<div class="erro--img__box">
			<h3>
			<% if(status >= 500) { %>
			<h3><%= msgs[0]%></h3>
			<img src="../images/bad-server.jpg" />
			
			<%} else if(status >= 400) {  %>
			<h3><%= msgs[1]%></h3>
			<img src="../images/error404.jpg" />
					
			<%} else {  %>
				<h3><%= msgs[2]%></h3>
				<img src="../images/error301.jpg" />
			<%} %>
			</h3> 
			</div>	
			<p style="text-align: center; margin-top: 20rem;">
				Sorry, there were some technical<br /> issues while processing your
				request, wait some time or relogin.
			</p>
		</div>
		</div>
</body>
</html>


