<%@page import="maipl.util.*" %>
<%
	if(request.getSession(false).isNew()){  
			Log.debug("Session invalidating");
		  	//session.invalidate();
		  	out.print("Session Expired. Please login again.");
		  	return;
	}
%>