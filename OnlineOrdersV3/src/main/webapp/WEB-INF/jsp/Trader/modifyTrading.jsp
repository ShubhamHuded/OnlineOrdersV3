<%@ page extends="br.brpltrade.control.BrTradeServlet" %>
<%@ page import="maipl.db.*" %>
<%@ page errorPage="Error.jsp" %>
<%@ page import="maipl.xml.*" %>
<%@ page import="br.brpltrade.server.*" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="org.xml.sax.*" %>
<%@ page import="java.util.*" %>
<%@ page import="maipl.server.*" %>
<%@ page import="maipl.util.*" %>
<%@page import="org.json.*" %>
<%@page import="br.base.Debug" %>
<%@ page errorPage="Error.jsp" %>  



<html>
<head>
<script src="jquery.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="admin/StyleSheet/formstyle.css" />
<link rel="stylesheet" type="text/css" href="admin/StyleSheet/menustyle.css" />
<link rel="stylesheet" type="text/css" href="admin/StyleSheet/controlstyle.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Modify Order Form</title>

<body>

<%
int count=0;
String orderId1=null;
String orderType=null;
TradeHelperMaster object1=null;
String modify_output=null;
Hashtable orderTable = new Hashtable();
java.util.Date now=null;
%>
	

<% 
JSONObject canTrade= RDBHelper.canTradeNow();
Debug.println("Can Tarde : " + canTrade.toString());
String canTradeStatus= canTrade.getString(Resource.STATUS);


if (canTradeStatus.equalsIgnoreCase(Resource.FAILS)) {%>
<script>
	window.alert(<%canTrade.getString(Resource.MSG);%>);
	window.close();
</script> 

<% return;} %> 

<%

String orderId[]= new String [1];
orderId[0]=request.getParameter(Resource.ORDERID);
Log.debug("------------Order id is: " +orderId[0]);
if(orderId[0].length()==0)
{
	%>
	<script>
		alert("Order Id is empty.");
		window.close();
	</script>
<%
	out.println( "Order Id is empty" );
    return;
}
orderType = request.getParameter(Resource.ORDER_TYPE_PARAM);

if(orderType.equals(Resource.BUY_LIMIT))
{
	modify_output = TradeHelperMaster.getBuyOrder(Resource.BUY_ORDER_FORM, orderId);
}
else
{
	modify_output = object1.getBuyOrder(Resource.SELL_ORDER_FORM, orderId);

}
Log.debug("XML String is: " +modify_output);
if(modify_output == null) return;


JSONObject order= new JSONObject(modify_output);
String commid = order.getString("Currency");
%>




<FORM ACTION="CreateOrder.jsp?action=update" name="frm_order" id="frm_order" METHOD="POST" onsubmit="return MaterialsFieldValues(this)">

<table id="orderformtable" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" class="formstrade">
  <tr class="formheaderrowtrade">
    <td colspan="5">&nbsp;Trading</td>
  </tr>
  <tr>
  <td colspan="5">
  
 <% 
		String subUser= getSubSuer();
		String traderId = getTraderName();
		NodeList header=null;
		String rate=null;
		rate= order.get("Rate").toString();
	
%>
	<input name="edit_rate" id="edit_rate" value="<%=rate %>" type="hidden"/>
	<% 
	  JSONObject table=order.getJSONObject("tables");
	  JSONArray buyOrderTable = table.getJSONArray("buy_order_form_table");
	  for (int i = 0; i < buyOrderTable.length(); i++) {
		  JSONObject row=buyOrderTable.getJSONObject(i);
		  orderTable.put(row.get(Resource.PRODUCT_ID), row.get(Resource.QUANTITY));
	  }
	%>
  <table width="100%">
  <tr>
    <td width="23%">&nbsp;</td>
<td width="21%"><input type="hidden" name="fe_Trader Group Form" id="fe_Trader Group Form"  value="Bangalore"/> 
    <input type="hidden" name="fe_Trader" id="fe_Trader"  value="<%= traderId %>"/> 
    <input type="hidden" name="fe_Sub User" id="fe_Sub User"  value="<%= subUser %>"/> 
				<input type="hidden" name="fe_Currency" id="fe_Currency"  value="<%= commid %>"/>
				<input type="hidden" name="fe_OrderId" id="fe_OrderId"  value="<%=orderId[0] %>"/> 
				<input type="hidden" name="OrderType" id="OrderType"  value=""/></td>
  <td>&nbsp;</td>
  <td width="26%">&nbsp;</td>
</tr>

<tr>
<td colspan="4">
<!--  					class="formstrade"-->
<table align="center" width="90%" class="formstrade">

<!--    To Read Product Currency table-->
<%
Enumeration E= RDBHelper.getProductDetails(commid);
int row=0;
while (E.hasMoreElements()) {  
	int col=0;
	ProductDetails detail=(ProductDetails)E.nextElement();
	String pname=detail.getProductId();
	String dispalyOption="Select Qty";
	if (orderTable.get(pname)!=null){
		dispalyOption=orderTable.get(pname).toString(); 
	}
%>
<tr>
<td class="labels" style="font-size:13px"><input type="hidden" value="<%=pname%>" name="te_Buy Order Form Table_<%=row%>_<%=col%>" 
id="te_BuyOrderFormTable_<%=row%>_<%=col%>" />
<input type="hidden" value="<%= detail.getConversion()%>" name="conversion_<%=row%>" id="conversion_<%=row%>"/>
  <%= pname%></td> 
<%col++;%>
<td colspan="2"><select name="te_Buy Order Form Table_<%=row%>_<%=col%>" id="te_BuyOrderFormTable_<%=row%>_<%=col %>" class="dropdownlisttrade" onchange="SANAjax();">
<option value="0"><%=dispalyOption %></option>



<!--<select name="test" id="test" onchange="SANAjax();" >-->
<!--<option value="0">Selct Qty </option>-->


<% 	
double min=detail.getMin();
double inc=detail.getInc();
double max=detail.getMax();

while(min <= max){ 
//if(min % inc == 0)
%>
<option value="<%=min %>"><%=min %></option>
<% min=min+inc; %>
<%	} %>
</select></td>

<%col++;%>
<td id="te_BuyOrderFormTable_<%=row%>_<%=col%>">&nbsp;</td>
</tr>

<%row++; }%>

<tr>
  <td class="labels" style="font-size:13px">&nbsp;<input id="detcount" type="hidden" value="<%=row %>"/></td>
  <td colspan="2"><strong>Net Total</strong></td>
  <td id="totalgrams">&nbsp;</td>
</tr>
<tr>
</table>
</td>
</tr>
<tr>
<td>&nbsp;</td>
  <td class="labels" style="font-size:13px">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td class="labels" style="font-size:13px">Type</td>
  <td><select name="fe_OrderType" id="fe_OrderType" class="dropdownlisttrade">
  <option value="">SELECT ORDER TYPE</option>
    <option value="Market Execution"  >MARKET RATE SELL</option>
    <option value="MRBUY">MARKET RATE BUY</option>
    <option value="PRSELL">PENDING RATE SELL</option>
    <option value="PRBUY">PENDING RATE BUY</option>
  </select></td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td class="labels"><div id="atp" style="display:none;vertical-align:middle"  >At Price</div></td>
  <td><div id="responsecontainer"></div></td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td colspan="2" align="center" style="font-size:13px">Notice! Making Charges for each piece is extra and computed at the time of billing </td>
  <td>&nbsp;</td>
</tr>
</table>
</form>  


<script>

function SANAjax(){
	var tot=0;
	var detcount=parseInt(document.getElementById("detcount").value);
	for(i=0;i<detcount;i++){
		prod1=parseInt(document.getElementById("te_BuyOrderFormTable_"+i+"_"+1).value);
		var conv_factor=parseInt(document.getElementById("conversion_"+i).value);
		prod1=prod1*conv_factor;
		tot=tot+prod1;
	}
	totval = document.getElementById("totalgrams");
	totval.innerHTML=tot;
}

$("#fe_OrderType").change(function(){
	ShowCurrencyRates();
});
	
$(function() {ShowCurrencyRates = function(){
	var comid = $("#fe_Currency").val();
	 //var value = comid.split(" ");
	 //alert(value[0]);
	 var ordtype="";
	 ordtype = $("#fe_OrderType").val();
	 $("#OrderType").val(ordtype.inneHTML);
	 //alert('ordtype' +ordtype);

	 //if(ordtype == 'Market Execution'){
	//	 ordtype='MarketExecution';
	 //}
	 var rate="";
	rate = $("#edit_rate").val();
	//alert(rate);
	 $("#responsecontainer").load('Tradings.jsp?'+ $.param( {rate: rate, comid: comid, ordtype: ordtype, randval: Math.random()} ));
	 
	// $("#responsecontainer").load('Tradings.jsp?'+ $.param( { comid: comid, ordtype: ordtype, randval: randval} )); 
/*
   	var refreshId = setInterval(function() {
      $("#responsecontainer").load('tradings.php?prdid=' + value[0]+ '&type=' + ordtype + '&randval='+ Math.random());
   }, 10000);
   $.ajaxSetup({ cache: false });
   */
}});

$(document).ready(function() 
{	
	//alert('Document ready function');
	var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == "orderType")
        {
            if(sParameterName[1] == "Buy%20Limit")
			{
				//alert('Buy Limit');
				$('#fe_OrderType option[value="PRBUY"]').attr('selected', 'selected');
				ShowCurrencyRates();
				$("#OrderType").val("PRBUY");
			}
			else if(sParameterName[1] == "Sell%20Limit")
			{
				//alert('Sell Limit');
				$('#fe_OrderType option[value="PRSELL"]').attr('selected', 'selected');
				ShowCurrencyRates();
				$("#OrderType").val("PRSELL");
			}
			$("#fe_OrderType").attr('disabled', 'disabled');
        }
    }
});


</script>

<script language="javascript">

function MaterialsFieldValues() 
{

	var frm = document.frm_order;	
	if(frm.fe_OrderType.value == "" ){ alert("Please Select Order Type ."); frm.fe_OrderType.focus();  return false;}

	
	return true;
} 
</script> 
</body>
</html>