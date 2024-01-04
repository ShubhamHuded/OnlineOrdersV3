<html>
<head>
<title></title>
<%@ page import="maipl.server.*"%>
<%@ page import="maipl.util.*"%>
<%@page language="java" import="maipl.db.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.servlet.http.Cookie" %>
<%@ page errorPage="Error.jsp" %>  
</head>
<body>
	<%
	JSONObject ret= new JSONObject();
	String gstNum = (String) request.getParameter("gstNum");
	String result = RdbUserHelper.checkGST(gstNum);
	response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.setContentLength(30);
    Cookie ck=new Cookie("resp",result);
    if(result == "NO GST"){
        // something
        ck = new Cookie("resp", result);
    } else if(result == "NO EMAIL") {
    	// something
    	ck = new Cookie("resp", result);
    } else {
    	ret.put("user_email", result);
 	    session.setAttribute("userEmail", result);
    }
    response.addCookie(ck);
	out.print(ret.toString());
	out.flush();
	%>
	<p></p>
</body>
</html>