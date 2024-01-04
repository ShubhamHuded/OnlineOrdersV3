<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notification</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css"
	href="../css/style.css" />
</head>
<body>
	<jsp:include page="./NavigationBar.jsp" />
	<style>
.notification {
	display: flex;
	justify-content: center;
	background-color: #ddd;
	flex-direction: column;
	margin: 10px;
	font-size: 20px;
	max-width: 100%;
}

.notifiy {
	display: flex;
	padding: 10px;
}
</style>


	<div class="notification">
		<div class="notifiy">
			<h1 style="font-size: 26px;">Notification</h1>
		</div>



		<div class="notifiy">
			<span class="date">Date:29/09/2022,</span> <span
				class="Time"> Time:5:00:00sc</span><br>
			<p></p>
		</div>

		<div class="notifiy">
			<span class="date">Date:29/09/2022,</span> <span
				class="Time"> Time:5:00:00sc</span><br>
			<p></p>
		</div>

		<div class="notifiy">
			<span class="date">Date:29/09/2022,</span> <span
				class="Time"> Time:5:00:00sc</span><br>
			<p></p>
		</div>
		<table>
			<th>no.</th>
			
			<th>Date</th>
			<th>Time</th>
			

		</table>
	</div>
	
	<body>

<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="maipl.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ page extends="br.brpltrade.control.BrTradeServlet"%>
<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="maipl.server.*"%>
<%@page import="maipl.util.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.*"%>
<%@page import="br.base.Debug"%>
<%@ page errorPage="../util/Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>BRPL ORDER FORM JSP</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="../admin/StyleSheet/formstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css"
	href="../admin/StyleSheet/menustyle.css" />
<link rel="stylesheet" type="text/css"
	href="../admin/StyleSheet/controlstyle.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="jqueryfunctions.js"></script>
</head>

<body>


	<%!int count = 0;
	String commid = null;
	java.util.Date now = null;
	String subUser;
	String traderId;
	boolean tradeEnabled = true;
	//String coName=null;%>

	<%
	//if(session.isNew()){
	%>
	<script>
		/*alert("Session expired. Please login again.");
		window.opener.location.reload();
		window.close();*/
	</script>
	<%
	// session code moved to the brpltradeservalet
	//To Restrict Admin User from creating an Order
	//now = new java.util.Date();
	commid = request.getParameter(Resource.COMMID);
	Debug.println("Trading Commid is: " + commid);
	traderId = getTraderName();
	subUser = getSubSuer();
	JSONObject resObj = RDBHelper.isTradingEnabled(traderId, subUser, commid);
	String status = resObj.getString(Resource.STATUS);
	%>
	<%
	if (status.equalsIgnoreCase(Resource.FAILS)) {
	%>
	<script>
		alert(
	<%resObj.getString(Resource.MSG);%>
		);
		window.opener.location.reload();
		window.close();
	</script>
	<%
	}
	%>


	<table id="orderformtable" width="95%" border="0"
		cellspacing="0" cellpadding="0" align="center"
		class="formstrade">
		<tr class="formheaderrowtrade">
			<td colspan="5" class="formheaderrowtrade"
				style=background-color:"#EC8D1b">&nbsp;Trading</td>
		</tr>
		<tr>
			<td colspan="5" id="formheaderrowtrade1"
				style=background-color:"#EC8D1b">
				<%
				JSONObject canTrade = RDBHelper.canTradeNow();
				String canTradeStatus = canTrade.getString(Resource.STATUS);

				if (canTradeStatus.equalsIgnoreCase(Resource.FAILS)) {
				%> <script>
					window.alert(
				<%canTrade.getString(Resource.MSG);%>
					);
					window.close();
				</script> <%
 return;
 }
 %> <script type="text/javascript">
		function SANAjax() {
			var tot = 0;
			var detcount = parseInt(document.getElementById("detcount").value);
			for (i = 0; i < detcount; i++) {
				prod1 = parseInt(document
						.getElementById("te_BuyOrderFormTable_" + i + "_" + 1).value);
				var conv_factor = parseFloat(document
						.getElementById("conversion_" + i).value);
				prod1 = prod1 * conv_factor;
				tot = tot + prod1;
			}
			totval = document.getElementById("totalgrams");
			totval.innerHTML = tot;
		}
	</script>

				<form action="CreateOrder.jsp" name="frm_order"
					id="frm_order" METHOD="POST">
					<table width="100%">
						<tr>
							<td width="23%">&nbsp;</td>
							<!--    <?php echo $count->intractor_group?>       *********** Add dynamic Group Name-->
							<td width="21%"><input type="hidden"
								name="fe_Trader" id="fe_Trader"
								value="<%=traderId%>" /> <input type="hidden"
								name="fe_Sub User" id="fe_Sub User"
								value="<%=subUser%>" /> <input type="hidden"
								name="fe_Currency" id="fe_Currency"
								value="<%=request.getParameter(Resource.COMMID)%>" />
								<input type="hidden" name="fe_BuyRate"
								id="fe_BuyRate"
								value="<%=request.getParameter(Resource.BUY_RATE)%>" />
								<input type="hidden" name="order_type"
								id="order_type"
								value="<%=request.getParameter(Resource.TYPE)%>" /></td>
							<td>&nbsp;</td>
							<td width="26%">&nbsp;</td>
						</tr>

						<tr>
							<td colspan="4">
								<!--  					class="formstrade"-->
								<table align="center" width="90%" class="formstrade"
									style=background-color:"#EC8D1b">
									<tr>

										<td width="27%" class="labels"
											style="font-size: 13px"><strong>Product</strong></td>
										<td colspan="2"><strong>Qty</strong></td>
										<td width="23%"><strong>Coin type</strong></td>
									</tr>

									<!--    To Read Product Currency table-->
									<%
									Enumeration E = RDBHelper.getProductDetails(commid);
									int row = 0;
									while (E.hasMoreElements()) {
										int col = 0;
										ProductDetails detail = (ProductDetails) E.nextElement();
										String pname = detail.getProductId();
										String type = RDBHelper.getTypeBasedOnProdcut("commondb.dbo_mas_product", "type", pname);
										if (!type.equals(request.getParameter("selectType")))
											continue;
									%>
									<tr>

										<td class="labels" style="font-size: 13px"><input
											type="hidden" value="<%=pname%>"
											name="te_Buy Order Form Table_<%=row%>_<%=col%>"
											id="te_BuyOrderFormTable_<%=row%>_<%=col%>" /> <input
											type="hidden" value="<%=detail.getConversion()%>"
											name="conversion_<%=row%>"
											id="conversion_<%=row%>" /> <%=pname%></td>
										<%
										col++;
										%>
										<td colspan="2"><select
											name="te_Buy Order Form Table_<%=row%>_<%=col%>"
											id="te_BuyOrderFormTable_<%=row%>_<%=col%>"
											class="dropdownlisttrade" onchange="SANAjax();">
												<option value="0">Selct Qty</option>

												<%
												double min = detail.getMin();
												double inc = detail.getInc();
												double max = detail.getMax();
												if(min != max) {
													while (min <= max) {
												%>
												<option value="<%=min%>"><%=min%></option>
												<%
												min = min + inc;
												%>
												<%
												}
											} else {
												response.sendRedirect("../util/Error.jsp");
											}
												%>
										</select></td>

										<%
										col++;
										%>
										<td>
										<select name="te_Buy Order Form Table_<%=row%>_<%=col%>"
											onchange="setValue(this)"
											id="te_BuyOrderFormTable_<%=row%>_<%=col%>">
												<%
												List<String> options = RDBHelper.getDropDownOptionsForImage(pname);
												for (String i : options) {
												%>
												<option value="<%=i%>"><%=i%></option>
												<%
												}
												%>
										</select> </td>
										<td colspan="2">
											<div class="btn--popup p-2">
												<a class="buttonPopup" href="#img<%=row%><%=col%>">&nbsp;view</a>
											</div>
											<div id="img<%=row%><%=col%>" class="overlay">
												<div class="popup">
													<a class="close" href="#">&times;</a>
													<div class="content d-flex d-center">
														<img src="./images/baner.png"
															id="te_BuyOrderFormTable_<%=row%>_<%=col%>_i" style = "width:150px; height:150px;  object-fit: cover;"></img>
													</div>
												</div>
											</div>

										</td>
									</tr>
									<%
									row++;
									}
									%>
									<tr>
										<td class="labels" style="font-size: 13px">&nbsp;<input
											id="detcount" type="hidden" value="<%=row%>" /></td>
										<td colspan="2"><strong>Net Total</strong></td>
										<td><span id="totalgrams">0</span><span>
												Grams</span></td>
									</tr>
									<tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="labels" style="font-size: 13px">&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="labels" style="font-size: 13px">Type</td>
							<td><select name="fe_OrderType"
								id="fe_OrderType" class="dropdownlisttrade">
									<option value="">SELECT ORDER TYPE</option>
									<%
									if (request.getParameter("type").equalsIgnoreCase(Resource.ASK)) {
									%>
									<option value="MRBUY">MARKET RATE BUY</option>
									<option value="PRBUY">PENDING RATE BUY</option>

									<%
									} else {
									%>
									<option value="Market Execution">MARKET
										RATE SELL</option>
									<option value="PRSELL">PENDING RATE SELL</option>

									<%
									}
									%>
							</select></td>
							<td>
								<!-- ///////// here ////////
								<p id="imgSrc"></p> -->
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="labels"><div id="atp"
									style="display: none; vertical-align: middle">At
									Price</div></td>
							<td><div id="responsecontainer"></div></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="2" align="center"
								style="font-size: 13px">Notice! Making Charges
								for each piece is extra and computed at the time of
								billing</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form> <script>
				<!--$("#Premium0").focus();$("#Premium0").css("background-color","#fff");-->
					$("#fe_OrderType").change(
							function() {
								var comid = document
										.getElementById("fe_Currency").value;
								var buyrate = document
										.getElementById("fe_BuyRate").value;
								var ordtype = "";
								var randval = Math.random()
								var ordtype = document
										.getElementById("fe_OrderType").value;
								$("#responsecontainer").load(
										'Tradings.jsp?' + $.param({
											comid : comid,
											rate : buyrate,
											randval : randval,
											ordtype : ordtype,
											randval : randval
										}));
								$.ajaxSetup({
									cache : false
								});
							});
					function setValue(selectObject) {
						value = selectObject.value;
						console.log(value)
						let id = selectObject.id;
						id += "_i";
						let img = document.getElementById(id);
						$.ajax({
							type : "GET",
							url : "../util/imagePathSelector.jsp",
							data : "value=" + value,
							success : function(data) {
								var values = Object.values(data)[0];
								console.log(values);
								img.src = values;
							},
							error : function(err) {
								console.log(err);
							},

						});

					}
				</script>
</body>
</html>

</body>
</body>
</html>