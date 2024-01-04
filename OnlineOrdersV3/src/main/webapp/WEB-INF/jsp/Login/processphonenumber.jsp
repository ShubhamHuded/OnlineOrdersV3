<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="maipl.server.*"%>
<%@ page import="maipl.util.*"%>
<%@page language="java" import="maipl.db.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@ page errorPage="Error.jsp"%>
<%@page import="br.base.*"%>
<%@page import="br.base.EncryptHelper"%>
<%@page import="br.jpa.util.JPATypedQuery"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	JSONObject obj = new JSONObject();
	String phone = (String) request.getParameter("phone");

	
	Map<String, String> mp = new HashMap<>();
	mp.put("user_phone", phone);
	
	List li = JPATypedQuery.getColumnList("PartyRegistry.getUserThroughMobileNumber",
			"br.jpa.entity.User", mp);
	
	if(li.size()>0) {
		obj.put("value", false);
	}else{
		obj.put("value", true);
	}
	
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();
	%>
</body>
</html>