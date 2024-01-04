<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.traderates.*"%>
<%@page import="br.base.money.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.text.*"%>
<%@page import="maipl.util.*"%>
<%@ page errorPage="Error.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1">
<title>Getting and displaying values</title>
</head>
<style>
	.tablet { 
	--accent-color: #acbfaa; 
	--text-color: black; 
	--bgColorDarker: #c9c9c9;
	--bgColorLighter: #fcfcfc; 
	--insideBorderColor: lightgray;
	margin: 0;
	padding: 0;
	border: 2px solid var(--accent-color);
	border-collapse: collapse;
	color: var(--text-color);
	table-layout: fixed;
}

.tablet caption {
	margin: 1rem 0;
	color: slategray;
	font-size: 1.5rem;
	font-weight: 600;
	letter-spacing: 0.055rem;
	text-align: center;
}

.tablet thead tr {
	color: black;
	background-color: #ce7f20;
	font-size: 1rem;
}

.tablet tbody tr {
	border: 1px solid var(--insideBorderColor);
	background-color: var(--bgColorDarker);
}

.tablet tbody tr:nth-child(odd) {
	background-color: var(--bgColorLighter);
}

.tablet th {
	letter-spacing: 0.075rem;
}

.tablet th, .tablet td {
	padding: 0.75rem 1rem;
	font-weight: normal;
	text-align: left;
}

.tablet th:nth-child(4), .tablet td:nth-child(4) {
	text-align: left;
}

@media screen and (max-width: 768px) {
	.tablet {
		border: none;
	}
	.tablet thead {
		position: absolute;
		width: 1px;
		height: 1px;
		clip: rect(0, 0, 0, 0);
		overflow: hidden;
	}
	.tablet tbody tr {
		margin-bottom: 2rem;
		display: block;
	}
	.tablet td {
		font-size: 0.875rem;
		text-align: right;
		display: block;
	}
	.tablet td:before {
		content: attr(data-label);
		font-size: 0.75rem;
		font-weight: 600;
		letter-spacing: 0.075rem;
		text-transform: uppercase;
		float: left;
		opacity: 0.5;
	}
	.tablet td:not(:last-child) {
		border-bottom: 1px solid var(--insideBorderColor);
	}
}
</style>
<body>
	<% 
	String type = session.getAttribute("type") != null ? session.getAttribute("type").toString() : "";
	%>

	<%!String colors[] = new String[10];  
	String[] cola = new String[10];

	String colors2[] = new String[10];
	String[] cola2 = new String[10];
	HttpSession session1;
	HttpSession session2;%>

	<%-- <span class="row2s" style="color:<?php echo $cola; ?>;font-size:20px;background-color:<?php echo $colors?>"></span> --%>

	<table width="" border="0" align="center"
		cellpadding="0" cellspacing="0" id="" data-form-table class = "tablet  table-bordered">
		<thead>
			<tr>
						<th
							style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; color: #000; background-repeat: repeat-x"
							width="518" class="headings" align="left"><strong>&nbsp;&nbsp;PGM</strong></th>
						<th
							style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; color: #000; background-repeat: repeat-x"
							width="412" align="right" valign="middle"
							class="headings"><strong>BID&nbsp;&nbsp;</strong></th>
						<th
							style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; color: #000; background-repeat: repeat-x"
							width="359" align="right" valign="middle"
							class="headings"><strong>ASK&nbsp;&nbsp;</strong></th>
					</tr>
		</thead>
		<tbody>	
		<%
					String[][] prices = TradeSocket.getAskBidTableValues();
					int j = prices.length;
					//System.out.println("j =" +j);
					for (int i = 0; j > i; i++) {
					%>
					<tr>
						<%
						




       						DecimalFormat decfor ;
						decfor = new DecimalFormat("0.00");   
						String Item = prices[i][0].toString();
						String Val1 = prices[i][1].toString();
						double num  = Double.parseDouble(Val1);
						Double Val = new Double(decfor.format(num));

						String Val2 = prices[i][2].toString();
						double num2  = Double.parseDouble(Val2 );
						Double Val22 = new Double(decfor.format(num2));

						String Val3 = prices[i][3].toString();
						double num3  = Double.parseDouble(Val3 );
						Double Val33 = new Double(decfor.format(num3));

						session1 = request.getSession();
						String old;
						if (session1.getAttribute("old" + i) == null) {
							session1.setAttribute("old" + i, "0.00");
						}
						old = session1.getAttribute("old" + i).toString();
						Double in = new Double(old);

						if (in.doubleValue() < Val.doubleValue()) {
							colors[0] = "#307AA3";
							cola[0] = "red";
						} else if (in.doubleValue() > Val.doubleValue()) {
							colors[0] = "#d51c1c";
							cola[0] = "green";
						} else if (in.doubleValue() == Val.doubleValue()) {
							colors[0] = "";
							cola[0] = "black";
						}

						session1.setAttribute("old" + i, Val);

						session2 = request.getSession();
						String old2;
						if (session2.getAttribute("old2" + i) == null) {
							session2.setAttribute("old2" + i, "0.00");
						}
						old2 = session2.getAttribute("old2" + i).toString();
						Double in2 = new Double(old2);
						//System.out.println("test 9999   " +old2 + "    "+Val22);   	
						if (in2.doubleValue() < Val22.doubleValue()) {
							colors2[0] = "#307AA3";
							cola2[0] = "green";
						} else if (in2.doubleValue() > Val22.doubleValue()) {
							colors2[0] = "#d51c1c";
							cola2[0] = "red";
						} else if (in2.doubleValue() == Val22.doubleValue()) {
							colors2[0] = "";
							cola2[0] = "black";
						}
						%>

						<TD style="color: black; font-size:20px; font-weight:600;" align="LEFT"><%=Item%>
						</TD>

						<%
						if (Val33 == 1) {
						%>
						<td align="Right"
							style="color:<%=cola[0]%>;font-size:20px; font-weight:600;cursor:cell" data-user=${type} data-modal-view data-modal-href = "http://localhost:8080/" data-type = <%=Item%> data-trade-type = <%=Resource.BID%>
						><%=Val%></td>
						<td align="Right"
							style="color:<%=cola2[0]%>;font-size:20px; font-weight:600;cursor:cell" data-user=${type} data-modal-view data-modal-href = "http://localhost:8080/" data-type = <%=Item%> data-trade-type = <%=Resource.ASK%>
							><%=Val22%></td>

						<%
						}
						%>

						<%
						if (Val33 == 0) {
						%>

						<td align="Right"
							style="color:<%=cola[0]%>;font-size:20px; font-weight:600;"  data-user=${type} data-modal-view data-modal-href = "http://localhost:8080/" data-type = <%=Item%>>
							<%=Val%>
						</td>
						<td align="Right"
							style="color:<%=cola2[0]%>;font-size:20px; font-weight:600;" data-user=${type} data-modal-view data-modal-href = "http://localhost:8080/" data-type = <%=Item%>>
							<%=Val22%>
						</td>
						<%
						}
						%>

					</tr>
					<%
					session2.setAttribute("old2" + i, Val22);
					%>

					<%
					}
					%>
						
		</tbody>
	</table>
	
	




</body>

</html>