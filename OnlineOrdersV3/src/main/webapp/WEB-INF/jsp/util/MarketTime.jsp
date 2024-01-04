<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="Error.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Market Opening and closing Timings</title>
</head>
<body>
<%@page import="java.util.Date"%>
<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="maipl.server.*"%>
<%@page language="java"  import="maipl.util.*" %>
<%@page import ="br.brpltrade.server.*" %>
<%@page import ="br.base.*" %>
<%@page import="java.util.*"%>
<%@page import="java.rmi.registry.*"%>

<%! 
boolean currentStatus = false;
//Helper helper;
private static String BRPLWebServer=null;
private static String CompanyName;
private boolean open;
HttpSession session;
private static String host=null;
private static int portno;
%>
<%
	
    try{ 
	java.util.Date currtime = new java.util.Date();
	String[] coName = {CompanyName}; 
	//System.out.println(" Company Name " + CompanyName);
	boolean open=TradeHelperMaster.getCacheMktStatus();
	
	// cacheDate is when the next change is market happen
	java.util.Date cachDate=TradeHelperMaster.getCacheMktTime();
	
	if (currtime.before(cachDate)){
		open = TradeHelperMaster.getCacheMktStatus();
		cachDate=TradeHelperMaster.getCacheMktTime();
	}
	if (open){
%>
<p style="font-size:1.2rem; color:black" class = "font-weight-bolder  text-justify">Market closes at <%=cachDate %></p>
<%
	}
	else {
%>
<p style="font-size:1.2rem; color:black" class = "font-weight-bolder  text-justify">Market opens at <%=cachDate %></p>
<%
		
	}
 }catch(Exception ex){ 
	 //Log.error("Server is closed -------------------- "+ex);
%>
<p style="font-size:1.2rem; color:black" class = "font-weight-bolder  text-justify">Market is Closed</p>
<%
      } 
 %>
</body>
</html>