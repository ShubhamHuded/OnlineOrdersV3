<%@page language="java" import="maipl.db.*"%>
<%@page language="java" import="java.util.*"%>
    <%@page import="org.json.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>..</title>
</head>
<body>
	<%
	/* isUserExist check for email is database, if user exist then condition is true then we set message as email is already present */
	JSONObject obj = new JSONObject();
	Vector<String> vec = RdbUserHelper.getCurrency();
	JSONArray arr  = new JSONArray();
	for(int i = 0; i < vec.size(); i++) {
		arr.put(vec.get(i));
	}
	obj.put("value", vec.toString());
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();

	%>
	
</body>
</html>