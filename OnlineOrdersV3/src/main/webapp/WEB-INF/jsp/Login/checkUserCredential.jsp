<%@ page import="maipl.server.*"%>
<%@ page import="maipl.util.*"%>
<%@page language="java" import="maipl.db.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.servlet.http.Cookie" %>
<%@ page errorPage="Error.jsp" %> 
<%@page import="br.base.EncryptHelper" %>
<%@page import = "br.webBase.WebConnectionMgr" %>
<%@page extends = "br.brpltrade.control.OnlineLoginServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%-- 	<% --%>

// 	String email = (String) request.getParameter("email");
// 	String password = (String) request.getParameter("password");
// 	String loginTrader[] = {email, EncryptHelper.encryptPassword(password)};
// 	JSONObject obj= new JSONObject();
// 	if(email.length() > 1) {
// 		boolean result = RdbUserHelper.isUserExist(email);
// 		if(!result) {
// 			obj.put("Value", "emailfails");
// 		} else {
// 			String output=RdbUserHelper.LoginNupddateStatus(loginTrader, session,  request);
// 			if(output.equalsIgnoreCase(Resource.SUCCESS)) { 
// 				obj.put("Value", "pass");
// 				obj.put("sessionID",session.getId());
// 				Cookie ck1=new Cookie("_s", session.getId());
// 				response.addCookie(ck1);
// 				WebConnectionMgr.login(email,password,session.getId());
// 			} else {
// 				obj.put("Value", "passfails");
// 			}
// 		}
// 	}
// 	response.getWriter().write(obj.toString());
// 	response.getWriter().flush();
// 	response.getWriter().close();

<%-- 	%> --%>
	
</body>
</html>