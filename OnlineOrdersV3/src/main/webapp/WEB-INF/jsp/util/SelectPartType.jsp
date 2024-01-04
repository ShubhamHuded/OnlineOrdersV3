<%@page language="java" import="maipl.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="maipl.server.*"%>
<%@page import="maipl.util.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*"%>
<%@page import="br.base.Debug"%>
<%@ page errorPage="Error.jsp"%>
<%@page contentType="application/json; charset=UTF-8"%>
<!DOCTYPE html>
<html dir="ltr">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String value = request.getParameter("value");
	String output = RDBHelper.getImagesPath(value);
	JSONObject obj = new JSONObject();
	obj.put(value, output);
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();
	%>
</body>
</html>