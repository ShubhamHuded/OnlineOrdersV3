<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
<%@ page errorPage="Error.jsp" %>
<%@ page import="maipl.server.*" %>
<%@ page import="br.brpltrade.server.*" %>
<%@ page import="maipl.server.*"%>
<%@ page import="maipl.xml.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="maipl.util.*"%>	
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="Error.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String output = "NO";
	String trader =
	session.getAttribute(Resource.INTRACTORIDS).toString();
	String traderId[] = {trader}; 
	String output1 = TradeHelperMaster.getTraderMasterForm(Resource.TRADER, traderId);
	JSONObject traderform = new JSONObject(output1);
	JSONObject tableObj = traderform.getJSONObject(Resource.TABLES);
	Log.debug("length "+tableObj.length());
	Iterator ite = tableObj.keys();
	while(ite.hasNext()){		
		String tablekey = (String)ite.next();	
		JSONArray jsnarraobj = tableObj.getJSONArray(tablekey);
		Log.debug("length "+jsnarraobj.length()); 
		if (jsnarraobj.length() > 1)
			output = "YES";
	}
	JSONObject obj = new JSONObject();
	obj.put("result", output);
	response.getWriter().write(obj.toString());
	response.getWriter().flush();
	response.getWriter().close();
	%>
</body>
</html>