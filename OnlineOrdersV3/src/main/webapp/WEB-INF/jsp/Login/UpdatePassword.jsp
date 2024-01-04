
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="./js/jquery.js"></script>
</head>
<body>
<%@ page import="br.brpltrade.server.*" %>
<%@ page import="maipl.server.*"%>
<%@ page import="maipl.util.*"%>
<%@page import="br.base.EncryptHelper" %>
<%@page language="java" import="maipl.db.*" %>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>
<%@page import ="java.util.*"%>
<%@page import="br.brpltrade.server.*"%>
<%@page import="br.base.*"%>
<%@page language="java" import="maipl.server.*"%>
<%@page import="org.json.*" %>
<%@ page errorPage="Error.jsp" %>  
<%!
String oldPass=null;
String newPass1=null;
//Helper helper=null;
TradeHelperMaster object1=null;
String output=null;

%>
<% try{
	
 // session code moved to the brpltradeseravlet
%>
	<div id = "Popup"></div>
	<%
	
	/*if(helper==null)
		helper = new Helper();*/
	
	//object1 = helper.getHelper();
	/*uId = (String)request.getParameter("uID");
	uName=(String)request.getParameter("uname");
	pass=(String)request.getParameter("newPass");
	String []order = {uId,uName,pass};*/
	oldPass = (String)request.getParameter(Resource.PASSWORD_OLD);
	newPass1 = (String)request.getParameter(Resource.PASSWORD_NEW);
	//output = TradeHelperMaster.modifyTraderPassword(Resource.MODIFY_PASSWORD,order);	
		String loginTrader[] = new String[3];
		loginTrader[0]= session.getAttribute(Resource.SUBUSER_LOGIN_EMAIL).toString();	
		loginTrader[1]= oldPass;
		loginTrader[2]= newPass1;
		//String output=RDBHelper.changePasswordCheck(loginTrader);
		String output=RdbUserHelper.updateOldPassword(loginTrader);
		Debug.println(output);
%>
	<script>
	  		var output = "<%=output %>";
			if(output == "Password Modified") {
				 setTimeout(function(){
						$("#Popup").load("./popupLogin.html");
					}, 500);
				 
			} else {
				 alert("Old password is not correct");
			}
			/* window.addEventListener('load', (event) => {
				  console.log('page is fully loaded');
				}); */
	</script>
<%
}
catch(Exception ex){
	ex.printStackTrace();
%>
<%
}
%>
</body>
</html>