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
	String email = (String) request.getParameter("email");
	String otp = (String) request.getParameter("otp");

	
	Map<String, String> mp = new HashMap<>();
	mp.put("user_email", email);
	
	List li = JPATypedQuery.getColumnList("PartyRegistry.getUserThroughEmail",
			"br.jpa.entity.User", mp);
	
	if(li.size()>0) {
		obj.put("value", false);
	} else {
		// OTP is sent to the user email set session email falg to true.
		if (otp == null) {
			String otpRandom = RdbUserHelper.generateOtp(4);
			session.setAttribute("emailFlag", true);
			session.setAttribute("otp", otpRandom);
			Debug.println(otpRandom);
			String sub = "Email Verification code for updating the profile";
			//String message = "OTP has be sent to update you're profile, please don't share otp with any one";
			RdbUserHelper.otpForRegistration(email);

			return;
		}

		String[] data = new String[] { email, otp };
		if (RdbUserHelper.otpPasswordCheck(data))
			obj.put("value", true);
		else
			obj.put("value", false);
	}
	


	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();
	%>
</body>
</html>