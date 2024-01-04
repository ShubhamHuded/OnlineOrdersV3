<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validate Parameter JSP Page</title>
<SCRIPT>
function showProperties (theObject){
	alert("I am in function");
   for (var i in theObject) {
      if (theObject[i] != null) {
          document.write(i + " : " + theObject[i] + "<br>");
           
      }
      else {
         document.write(i + "<br>");
      }
   }
   return;
}
</SCRIPT>
</head>
<body>
<%@ page errorPage="Error.jsp"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="br.brpltrade.server.*"%>
<%@page import="br.base.*"%>
<%@page import="maipl.xml.*"%>
<%@page import="maipl.server.*"%>
<%@page import="org.w3c.dom.*"%>	
<%@page import="maipl.util.*" %>

<%@ page errorPage="Error.jsp" %>  

<%! String loginTrader[] = { "ABC Jewellers", "test", "Admin" };

	String orderstatus[] = { "fenner" };
	DoubleDArray darray = new DoubleDArray();
	Hashtable table = new Hashtable();
	TradeHelperMaster object1=null;
	//Helper helper=null;
	String str="txt";
	
%>

<%	//try{
	
	String str = request.getParameter("submit");
	Log.debug("String str is: "+str);
	Enumeration enu = request.getParameterNames();
	while (enu.hasMoreElements()) {		
		String paramname = enu.nextElement().toString();
		table.put(paramname,request.getParameter(paramname));
	}
	int i=0;
	Enumeration enu1 = table.keys();
	while(enu1.hasMoreElements() && i<table.size() ){
		String param = (String)enu1.nextElement();
		darray.setValue(i,0,param);
		String value = (String)table.get(param);
		darray.setValue(i,1,value);
		i++;
	}
	String[][] order = darray.copyArray();
	
	if(object1==null)
		object1=new TradeHelperMaster("Sudhakar",1091);
	String msg=object1.loginTrader("Log In Trader", loginTrader);
	Log.debug(msg);
  	out.print("Test"+ msg);
  	
  	HttpSession sess = request.getSession();
  //	sess.setAttribute("Server", helper);
  	
  	TradeHelperMaster sessionhelper=(TradeHelperMaster)sess.getAttribute("Server");
  	
  	/*
  	// To get Trader Master Form
    String traderId[]={"ABC Jewellers"};
    String traderform = sessionhelper.getTraderMasterForm("Trader",traderId);
    Log.debug(traderform);
	out.println("Success " +traderform);
	
	DOMParser parser = new DOMParser();
	Document document=parser.buildDocument(traderform);
	
	NodeList trader = document.getElementsByTagName("Trader");
	Log.debug("Trader length is: " +trader.getLength());
	for (int k = 0; k < trader.getLength(); k++) {
		  Node node = trader.item(k);
		  if(node.getNodeType()==Node.ELEMENT_NODE){
			  Element trele = (Element) trader.item(k);
			  Log.debug("PassWord: "+ trele.getAttribute("PassWord"));
		  }
	}
	
	//
	NodeList subusertable = document.getElementsByTagName("sub_user_form_table");
	Log.debug("sub_user_form_table length is: " +subusertable.getLength());
	for (i = 0; i < subusertable.getLength(); i++) {
	  Node node = subusertable.item(i);
	  if(node.getNodeType()==Node.ELEMENT_NODE){
		  Element element = (Element) subusertable.item(i);
		  
		  NodeList tr = element.getElementsByTagName("tr");
		  Log.debug("tr length is: " +tr.getLength());
		  for (int j = 0; j < tr.getLength(); j++) {
			  Element tr1 = (Element) tr.item(j);
			  Log.debug("Doc Id is: "+ tr1.getAttribute("User_Id"));
			  Log.debug("Symbol is: "+ tr1.getAttribute("User_Name"));
			  Log.debug("OrderType is: "+ tr1.getAttribute("Trading_Enabled"));
			  Log.debug("Quantity is: "+ tr1.getAttribute("Allow_Pending_Order"));
			  Log.debug("Price is: "+ tr1.getAttribute("Allow_Sales"));
			  Log.debug("*******************************************************************");
		  }
	  }
    }
	*/
	/*
	//To get Blank Sub User Form
	String traderId[]={"fenner"};
    String blankSubform = sessionhelper.getBlankSubUserForm("Blank Sub User Form",traderId);
    Log.debug(blankSubform);
	out.println(blankSubform);
	*/
	/*
	//To get Create New Sub User Form
	String traderId[]={"fenner"};
    String creaSubForm = sessionhelper.newSubUser("Sub User Form",traderId,order);
    Log.debug(creaSubForm);
	out.println(creaSubForm);
	*/
	/*
	//To Get Sub User Form
	String userparam[] = {"ABC Jewellers", "Rajajinagar"};
    String getSubForm = sessionhelper.getSubUserForm("Get Sub User Form",userparam);
    Log.debug(getSubForm);
	out.println(getSubForm);
	
	DOMParser parser = new DOMParser();
	Document document=parser.buildDocument(getSubForm);
	
	NodeList openorder = document.getElementsByTagName("sub_user_form_table");
	Log.debug("open_orders length is: " +openorder.getLength());
	for (int k = 0; k < openorder.getLength(); k++) {
		  Node node = openorder.item(k);
		  if(node.getNodeType()==Node.ELEMENT_NODE){
			  Element element = (Element) openorder.item(k);
			  
			  NodeList tr = element.getElementsByTagName("tr");
			  Log.debug("tr length is: " +tr.getLength());
			  for (int j = 0; j < tr.getLength(); j++) {
				  Element tr1 = (Element) tr.item(j);
				  System.out.println("Currency is: "+ tr1.getAttribute("Currency"));
				  //System.out.println("Symbol is: "+ tr1.getAttribute("Symbol"));
				  //System.out.println("OrderType is: "+ tr1.getAttribute("OrderType"));
				  //System.out.println("Quantity is: "+ tr1.getAttribute("Quantity"));
				  //System.out.println("Price is: "+ tr1.getAttribute("Price"));
				  //System.out.println("User_Id is: "+ tr1.getAttribute("User_Id"));	 
				  //System.out.println("-------------------------------------------------------------------");
			  }
		  }
	}
	*/
	
	/*
	//To Modify Sub User Form
	String modifyparam[] = {"fenner", "subuser1"};
    String modifySubForm = sessionhelper.modifySubUser("Modify Sub User Form",modifyparam,order);
    Log.debug(modifySubForm);
	out.println(modifySubForm);
	*/  
	//This is for Session testing
  	//RequestDispatcher rd=request.getRequestDispatcher("Report.jsp");
  	//rd.forward(request,response);
  	
  	//To parse xml contents using JavaScript
	String userparam[] = {"ABC Jewellers", "Rajajinagar"};
    String getSubForm = "text";//sessionhelper.getSubUserForm("Get Sub User Form",userparam);
    Log.debug(getSubForm);
	out.println(getSubForm);
	%>
	<SCRIPT>
showProperties(str);
</SCRIPT>
	<%
  	
%>
</body>
</html>
