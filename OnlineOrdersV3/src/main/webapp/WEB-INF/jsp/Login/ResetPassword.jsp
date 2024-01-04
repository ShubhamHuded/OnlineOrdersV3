<%@page language="java" import="maipl.db.*" %>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>
<%@page import ="java.util.*"%>
<%@page import="br.base.*"%>
<%@page language="java" import="maipl.server.*"%>
<%@page import="maipl.util.*"%>	
<%@ page errorPage="Error.jsp" %>  
<% 
	String passwordReset= request.getParameter(Resource.PASSWORD_RESET); 
	String userEmail = (String)session.getAttribute(Resource.SUBUSER_LOGIN);
	String[] input = {passwordReset, userEmail};
	boolean flag = RdbUserHelper.otpPasswordCheck(input);
	%>
	
	<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div id="popup1" class="overlay overlay-forgot">
  <div class="popup">
	<% if(flag) { 
		%>
    <div class="content">
      <div class="popup--msg">
        <h4>Password Reset</h4>
        <p>Update you're new password here. </p>
      </div>
       <div class = "otp--form">
      	<form action = "/Online-Orders/changeForgotPassword.jsp" style = "position:relative">
      		<input type = "password" required placeholder = "new password" id = "user_email" name="newPassword">
      		<input type = "submit" value = "update" id = "user_submit" style="padding-right:0.2rem;">
      	</form>
      </div>
    </div>
    <%} else { %>
        <div class="content">
      <div class="popup--msg">
        <h4>Wrong OTP</h4>
        <p>Please check again entered Otp.</p>
      </div>
    </div>
    <%} %>
  </div>
</div>

</body>
</html>