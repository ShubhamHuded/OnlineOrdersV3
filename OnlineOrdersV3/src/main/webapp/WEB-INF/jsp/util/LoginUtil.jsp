<%@page import="maipl.db.RdbUserHelper"%>
<%@page import="br.brpltrade.util.OnlineSessionTracker"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	final JSONObject obj = new JSONObject();
	String gst = request.getParameter("gstNum");
	String otp = request.getParameter("otp");
	String email = RdbUserHelper.checkGST(gst);
    boolean value = RdbUserHelper.otpCheck(new String[]{otp, email});
    if(value) {
    	OnlineSessionTracker.setActivateTime( new Date().getTime());
    	session.setAttribute("user_email", email);
    	obj.put("Value", true);
    } else {
    	obj.put("Value", false);
    }
    
    
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();
		
%>
</body>
</html>