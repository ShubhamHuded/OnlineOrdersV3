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
<link rel="stylesheet" type="text/css" href="/css/style.css" />
</head>
<body>
	<form action=""
		style="position: relative; margin-right: 60px"
		id="passwordReset">
		<input type="password" required placeholder="OTP"
			id="user_email" name="passwordReset"> <input
			type="submit" value="submit" id="user_submit"
			data-event="blur,checkPassword">
	</form>
	<Script src="../js/PasswordReset.js" type="module">
		
	</Script>
</body>
</html>