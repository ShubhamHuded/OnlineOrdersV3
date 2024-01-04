<%@page language="java" import="maipl.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="maipl.server.*"%>
<%@page import="maipl.util.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*"%>
<%@page import="br.base.Debug"%>o
<%@ page errorPage="Error.jsp"%>
<%@page contentType="application/json; charset=UTF-8"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Type</title>
</head>
	
	<%
	String value = request.getParameter("type");
	List<String> options = RDBHelper.getDropDownOptions(value);
	JSONObject obj = new JSONObject();
	obj.put(value, options);
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();
	%>
	
</html>