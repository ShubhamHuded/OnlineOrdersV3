<%@ page import="maipl.db.*" %>
<%@ page errorPage="Error.jsp"%>
<%@ page import ="java.util.*"%>
<%@page import="br.brpltrade.server.*"%>
<%@page import="br.base.*"%>
<%@page import="maipl.server.*"%>	
<%@page import="maipl.util.*" %>
<%@page import="org.json.*" %>
<%@ page extends="br.brpltrade.control.BrTradeServlet" %>
<%@ page errorPage="Error.jsp" %>  

<%! 
%>

<%
	if(session.isNew()){  
		Log.debug("Session invalidating");
	  	session.invalidate();
	  	out.print("Session Expired. Please login again.");
	  	return;
	}
	

	String orderStatus[] = new String[4];	
	orderStatus[0]=getTraderName();
	orderStatus[1]=getSubSuer();
	orderStatus[2]=request.getParameter("start");
	orderStatus[3]=request.getParameter("end"); 
	//TradeHelperMaster object2 = helper.getHelper();
	String output1=TradeHelperMaster.getRejectedOrders(Resource.REJECTION_LIST, orderStatus);		
	Log.debug("Report Contents are :" +output1);
		
	if(output1==null){
		return;
	}
	JSONObject outputJSN = new JSONObject(output1);		
	out.print(outputJSN);
%>