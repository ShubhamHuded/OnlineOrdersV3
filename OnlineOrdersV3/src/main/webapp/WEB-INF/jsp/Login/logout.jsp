<%@page import="maipl.util.*"%>
<%
Log.debug("Session Destroying");
Log.debug("Session Destroyed");
javax.servlet.http.Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (int  i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("JSESSIONID")) {
			javax.servlet.http.Cookie cookie = cookies[i];
	cookie.setValue("");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	response.addCookie(cookie);
	break;
		}
	}
}
session.invalidate();
response.sendRedirect("/");
%>