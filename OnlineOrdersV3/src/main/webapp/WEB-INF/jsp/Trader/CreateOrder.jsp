<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Order Jsp Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
 <script ></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
</head>
<body>

<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="br.base.*"%>
<%@page import="br.brpltrade.server.*"%>
<%@ page import="maipl.util.*" %>

<%! 
	String action=null;
//	Hashtable table=new Hashtable();	
	String orderType=null;
	String output=null;
	TradeHelperMaster helper;
	//DoubleDArray darray = new DoubleDArray();
	String ans = "no";
%>
<% 	
	Debug.println("In create Order");
	Map map = new TreeMap(request.getParameterMap());
	String order[][]=new String[map.size()][2];
	Iterator iter = map.entrySet().iterator() ;
	int i=0;
	while ( iter.hasNext() ) {
	  Map.Entry entry  = (Map.Entry)iter.next() ;
	  order[i][0]   = (String)entry.getKey() ;
	  String[]  values = (String[])entry.getValue() ;
	  order[i][1]=values[0];
	  i++;
	}
	Log.debug("Sorting Array");
	Arrays.sort(order, new KeyComparator(0));
	Debug.println("Sorting Array is completed");
	//* for debugging
	for(int j=0;j<order.length;j++){
		Debug.println("Key is : " +order[j][0].toString()+ " And Value is:  "+ order[j][1].toString());
	}
	action = request.getParameter(Resource.ACTION);
	String ordtype = request.getParameter(Resource.ORDER_TYPE);
	String comid = request.getParameter(Resource.FE_CURRENCY);
	Debug.println("Action is: " +action+" ordtype is: " +ordtype+ " comid is: " +comid);
	if(action==null)
		action=Resource.CREATE;
	
for(int j = 0; j < i; j++) {
	
	if(order[j][0].equals(Resource.FE_ORDERTYPE) && order[j][1].equals(Resource.MARKET_EXECUTION))
	{
		orderType = Resource.NEW_SELL_ORDER;
	}
	else if(order[j][0].equals(Resource.FE_ORDERTYPE) && order[j][1].equals(Resource.MRBUY))
	{
		orderType = Resource.NEW_BUY_ORDER;
		order[j][1] = Resource.MARKET_EXECUTION;
	}
	else if(order[j][0].equals(Resource.FE_ORDERTYPE)&& order[j][1].equals(Resource.PRSELL))
	{
		orderType = Resource.NEW_SELL_ORDER;
		order[j][1] = Resource.PENDING_ORDER;
	}
	else if(order[j][0].equals(Resource.FE_ORDERTYPE)&& order[j][1].equals(Resource.PRBUY))
	{
		orderType = Resource.NEW_BUY_ORDER;
		order[j][1] = Resource.PENDING_ORDER; 
	}
	else if(order[j][0].equals(Resource.FE_SUB_USER))
	{
		order[j][0] = "fe_Sub User";
	}
	else
	{
		order[j][0].replace("Buy_Order_Form_Table", Resource.BUY_ORDER_FORM_TABLE_SPACE);
	}
}
	if(action == Resource.CREATE)
	{
		Debug.println("In create Order");
		Debug.println("Set Otder **************       1 "+orderType);
		if(orderType.equals("New Sell Order"))
			throw new Exception("We are not accepting Sell Orders now.");
		try {
			output = helper.setOrder(orderType, order);
		} catch(Exception ex) {
			String[] o = ex.toString().split(":");
			output = o[1];
			
		}
		Debug.println("Set Otder **************         2 " +output);
	}
	
	else if(action.equalsIgnoreCase(Resource.UPDATE))
	{
		if(request.getParameter(Resource.ORDER_TYPE).equals(Resource.PRBUY))
		{
			orderType = Resource.MODIFY_BUY_ORDER;
		}
		else if(request.getParameter(Resource.ORDER_TYPE).equals(Resource.PRSELL))
		{
			orderType = Resource.MODIFY_SELL_ORDER;
		}
		String orderId [] = new String [1];
		orderId[0]=request.getParameter("fe_OrderId");
		output=helper.modifyOrder(orderType,orderId,order);
		Log.debug("Output for order is: " +output);
		//String objectid=Commodity

	} 
	Log.debug("Output for order is: " +output);
	if(output.equals("Order Accepted")) {
		ans = "yes";
	} else {
		ans = "no";
	}
%>

<script >  
Swal.fire({
	icon: "<%=ans%>" === "yes" ? "success" : "error",
	title: "<%=ans%>" === "yes" ? "successful transaction" : 'Unsuccessful Transaction...',
	text: "<%=output%>",
}).then((result) => {
	if (result.isConfirmed) {
		window.close()
	}
});
</script>

</body>
</html>