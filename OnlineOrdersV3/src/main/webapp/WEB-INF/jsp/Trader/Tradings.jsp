<HTML>
<BODY>

<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@ page errorPage="Error.jsp"%>
<%@ page import="maipl.util.*"%>
<%@ page import="br.base.money.*"%>
<%! 
	String comid=null;
	String type=null;
	TradeSocket tc=null;
%>
<%
Log.debug("Rate is: " +request.getParameter(Resource.RATE_TRADINGS));
comid=request.getParameter(Resource.COMID_TRADINGS);
type=request.getParameter(Resource.ORDER_TYPE_TRADINGS);
if(comid.equalsIgnoreCase("GLD"))
  comid = "GOLD";
%>
	
<%  	
		if(type.equalsIgnoreCase(Resource.MARKET_EXECUTION)){
%>
<table width="200" border="0" align="center">
  <tr>
    <td style="color:#00C">SELL</td>
  </tr>
  <tr>
    <td><span class="labels"><%= request.getParameter(Resource.BUY_RATE) %>
      <input type="hidden" name="fe_Rate" id="fe_Rate" value="<%=request.getParameter(Resource.BUY_RATE) %>" />
    </span></td>
  </tr>
  <tr>
    <td><span class="labels">
      <input TYPE="Submit" value="submit" name="SELL" id="SELL"   class="buysubmit" />
    </span></td>
  </tr>
</table>
<%  }
		if(type.equalsIgnoreCase(Resource.MRBUY)){%>
<table width="200" border="0" align="center">
  <tr>
    <td style="color:#C00">BUY</td>
  </tr>
  <tr>
    <td><span class="labels"><%= TradeSocket.getMarketValue((String)comid,1) %>
      <input type="hidden" name="fe_Rate" id="fe_Rate" value="<%= TradeSocket.getMarketValue((String)comid,1) %>" />
    </span></td>
  </tr>
  <tr>
    <td><span class="labels">
      <input type="submit" name="ORDER" id="BUY" value="BUY"  class="sellsubmit" />
    </span></td>
  </tr>
</table>
<% } %>

<% if(type.equalsIgnoreCase(Resource.PRSELL)){%>
<table width="200" border="0" align="center">
  <tr>
    <td style="color:#00C">SELL LIMIT</td>
  </tr>
  <tr>
    <td><span class="labels"><%= TradeSocket.getMarketValue((String)comid,1) %>
      <input type="text" name="fe_Rate" id="fe_Rate" value="<%if(request.getParameter(Resource.RATE_TRADINGS)!=null) out.print(request.getParameter(Resource.RATE_TRADINGS)); %>" />
    </span></td>
  </tr>
  <tr>
    <td><span class="labels">
      <input type="submit" name="SELL" id="SELL" value="SELL LIMIT"  class="buysubmit" />
    </span></td>
  </tr>
</table>
<% } %>
 <% if(type.equalsIgnoreCase(Resource.PRBUY)){ %>
<table width="200" border="0" align="center">
  <tr>
    <td style="color:#C00">BUY LIMIT</td>
  </tr>
  <tr>
    <td><span class="labels"><%= TradeSocket.getMarketValue(comid,1) %>
      <input type="text" name="fe_Rate" id="fe_Rate" value="<% if(request.getParameter(Resource.RATE_TRADINGS)!=null) 
    	   out.print(request.getParameter(Resource.RATE_TRADINGS)); %>" /> 
    </span></td>
  </tr>
  <tr>
    <td><span class="labels">
      <input type="submit" name="ORDER" id="BUY" value="BUY LIMIT"  class="sellsubmit" />
    </span></td>
  </tr>
</table>
<% }   %>
</BODY>
</HTML>