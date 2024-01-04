<%@ page import="java.sql.*" %>
<%@ page errorPage="Error.jsp" %>
<%@ page import="maipl.server.*" %>
<%@ page import="br.brpltrade.server.*" %>
<%@ page import="maipl.util.*" %>
<%@page extends="br.brpltrade.control.BrTradeServlet"%>
<%@ page errorPage="Error.jsp" %>  
<%! 

String orderId1=null;
String orderType=null;
TradeHelperMaster object1=null;
//Helper helper=null;
String output=null;
String action=null;
java.util.Date now=null;
DayTimeHelper currentTime=null;
DayTimeHelper start=null;
DayTimeHelper end=null;
boolean mktopen=false;
%>


<%
//	To get Current Time
	now = new java.util.Date();
	currentTime=new DayTimeHelper(now.getHours(), now.getMinutes(), now.getSeconds());

	action = request.getParameter(Resource.ACTION);
	Log.debug("I am in orderUpdate.jsp file: "+action);
	String loginTrader[] = new String[3];
	loginTrader[0]=session.getAttribute(Resource.INTRACTORIDS).toString();
	loginTrader[1]=session.getAttribute(Resource.SUBUSER).toString();
	loginTrader[2]=session.getAttribute(Resource.INTRACTOR_PASSWORD).toString();
	
	/*if(helper==null)
		helper=new Helper();*/
	//TradeHelperMaster object1 = helper.getHelper();
	String orderId = request.getParameter(Resource.ORDERID);
	String orderType = request.getParameter(Resource.ORDER_TYPE_PARAM);
	if(action.equalsIgnoreCase(Resource.DELETE)){
		String [] orderDetail={orderId,session.getAttribute(Resource.INTRACTORIDS).toString(),session.getAttribute(Resource.SUBUSER).toString()};
		if(orderType.equalsIgnoreCase(Resource.BUY_LIMIT))
		{
			Log.debug("Deleting Order");
			output = TradeHelperMaster.deleteOrder(Resource.DELETE_BUY_ORDER, orderDetail);
			Log.debug("Deleted Order for id: " +orderId+"Result is: "+output);
		}
		else if(orderType.equalsIgnoreCase(Resource.SELL_LIMIT))
		{
			output = TradeHelperMaster.deleteOrder(Resource.DELETE_SELL_ORDER, orderDetail);
			Log.debug("Deleting Order for id: " +orderId+"Result is: "+output);
		}
		else
		{
			out.print("Order Type " +orderType+ "is invalid");
			return;
		}
		out.print(output.trim());
		if(output.equals("Order Deleted")) {
			updateLog(request, new String[]{"Delet Buy Order"});
		}
	}
%>