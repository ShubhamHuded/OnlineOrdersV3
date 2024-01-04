
    <%@page import="org.json.*" %>
    <%@page language="java" import="maipl.db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>..</title>
</head>
<body>
	<%
	/* isUserExist check for email is database, if user exist then condition is true then we set message as email is already present */
	String email = (String) request.getParameter("email");
	String mobileNumber = (String) request.getParameter("mobileNumber");
	JSONObject obj= new JSONObject();
	if(email.length() > 1) {
		boolean result = RdbUserHelper.isUserExist(email);
		if(result) {
			obj.put("Value", true);
		} else {
			obj.put("Value", false);
		}
	}
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();

	%>
	
</body>
</html>