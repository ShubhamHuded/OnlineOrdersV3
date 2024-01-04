<html>
<head>
<title></title>
<%@page import="br.base.*"%>
<%@ page import="br.brpltrade.server.*"%>
<%@ page import="maipl.server.*"%>
<%@ page import="maipl.util.*"%>
<%@page import="br.base.EncryptHelper"%>
<%@page language="java" import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>
<%@page import="java.util.*"%>
<%@page import="br.brpltrade.server.*"%>
<%@page import="br.base.*"%>
<%@page language="java" import="maipl.server.*"%>
<%@page import="org.json.*" %>
<%@ page errorPage="Error.jsp" %>  
</head>
<body>
	<% 
	String gstNum = (String)request.getParameter("SubuserLogInEmail");
	String otp  = (String)request.getParameter("Password");
	String userEmail = (String)session.getAttribute("userEmail");
	boolean result = RdbUserHelper.otpPasswordCheck(new String[]{otp, userEmail});
	if(result) {
		session.invalidate();
		session = request.getSession();
		RdbUserHelper.updateSession(userEmail,  session);
		response.sendRedirect("/home");
	} 
	%>
</body>
</html>