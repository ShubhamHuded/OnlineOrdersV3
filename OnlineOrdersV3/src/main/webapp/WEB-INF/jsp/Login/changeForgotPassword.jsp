<html>
<%@page language="java" import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="br.base.*"%>
<%@page language="java" import="maipl.server.*"%>
<%@page import="maipl.util.*"%>
<%@page import="org.json.*"%>
<%@ page errorPage="Error.jsp"%>

<title>BRPL | reset password</title>

<%
String passwordReset = request.getParameter("newPassword");
String userEmail = (String) session.getAttribute(Resource.SUBUSER_LOGIN);
String[] input = { userEmail, passwordReset };
boolean flag = RdbUserHelper.changePasswordCheck(input);
%>
<body>
	<div id="popup1" class="overlay">
		<div class="popup">
			<%
			if (flag) {
				session.invalidate();
			%>
			<div class="content">
				<div class="popup--msg">
					<h4>Password Changed Sucessfully</h4>
				</div>
				<div class="otp--form">
					Pleases do re-login to continue from this link, <a
						href="LoginHtml.jsp">Login</a>
				</div>
			</div>
			<%
			} else {
			%>
			<div class="content">
				<div class="popup--msg">
					<h4>Password Not Changed Sucessfully</h4>
				</div>
				<div class="otp--form">
					Re-check the password <a href="#">Login</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>