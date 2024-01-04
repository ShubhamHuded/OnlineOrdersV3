<%@page import="org.json.*"%>
<%@page import="maipl.db.*"%>
<%@page import="java.util.*"%>
<%@page import="maipl.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trading view</title>
	<script
	src="../Online-Orders/javascript/jquery.js"></script>

<link rel="stylesheet" type="text/css"
	href="../Online-Orders/css/formstyle.css" />
<link rel="stylesheet" type="text/css"
	href="../Online-Orders/css/menustyle.css" />
<link rel="stylesheet" type="text/css"
	href="../Online-Orders/css/controlstyle.css" />
	<link rel="stylesheet" type="text/css"
	href="../Online-Orders/css/bootstrap.min.css" />
<script type="text/javascript" src="jqueryfunctions.js"></script>
<link rel="stylesheet" type="text/css"
	href="../Online-Orders/css/style.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
 <script ></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
  </head>
  <style>
	#order-info input {
		border: none;
		background-color: #ebebeb;
	}
	
	.content {
		background-color: #fefefe;
		margin: auto;
		padding: 20px;
		border: 1px solid #888;
		width: 80%;
	}
	</style>
  <body>
	<%

	String commid = request.getParameter("commid");
	String traderId = request.getParameter("traderId");
	String subUser = request.getParameter("subUser");

	%>
	<script type="text/javascript">
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
	<form action="/Online-Orders/create-order" name="frm_order"
	id="frm_order" METHOD="POST">
	<table width="100%" style="margin: 0 auto;">
		<tr id="order-info d-flex">
			<td>Trader <br /><span>${traderId}</span> <input
				type="hidden" name="fe_Trader" id="fe_Trader"
				value="${traderId}" />
			</td>
			<td>User <br /><span>${subUser}</span> <input
				type="hidden" name="fe_Sub User" id="fe_Sub User"
				value="${subUser}" />
			</td>
			<td>Commidity <br /><span>${commid}</span>
				<input type="hidden" name="fe_Currency"
				id="fe_Currency"
				value="${commid == 'GOLD' ? 'GLD' : commid}"  />
			</td>
			<td>Buy-rate <br /><span>${buyRate}</span>
				<input type="hidden" name="fe_BuyRate" id="fe_BuyRate"
				value="${buyRate}" />
			</td>
			<td>Bid-Type <br /><span>${type}</span>
				<input type="hidden" name="order_type" id="order_type"
				value="${type}" /></td>
		</tr>
		<tr style="text-align: center">
			<td colspan="4">
				<table align="center" width="100%" class="formstrade">
					<tr>

						<td width="27%" class="labels"
							style="font-size: 13px"><strong>Product</strong></td>
						<td colspan="2"><strong>Qty</strong></td>
						<td width="23%"><strong>Coin type</strong></td>
					</tr>

					<!--    To Read Product Currency table-->
					<%
					if(commid.equalsIgnoreCase("gold"))
						commid = "GLD";
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
							name="conversion_<%=row%>" id="conversion_<%=row%>" />
							<%=pname%></td>
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
								if (min != max) {
									while (min <= max) {
								%>
								<option value="<%=min%>"><%=min%></option>
								<%
								min = min + inc;
								%>
								<%
								}
								} else {
							
								}
								%>
						</select></td>

						<%
						col++;
						%>
						<td><select
							name="te_Buy Order Form Table_<%=row%>_<%=col%>"
							onchange="setValue(this)"
							id="te_BuyOrderFormTable_<%=row%>_<%=col%>">
							<option value="select image">Selct image</option>
								<%
								List<String> options = RDBHelper.getDropDownOptionsForImage(pname);
								for (String i : options) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
								}
								%>
						</select></td>
						<td colspan="2">
							<div class="btn--popup p-2">
								<a class="buttonPopup"
									data-label="img<%=row%><%=col%>"
									onclick="displayView(this)" role="button">&nbsp;view</a>
							</div>
							<div id="img<%=row%><%=col%>" class="overlay">
								<div class="popup">
									<span class="close" href="#"
										data-label="img<%=row%><%=col%>"
										onclick="displayView(this)">&times;</span>
									<div class="content d-flex d-center">
										<img src="./imagesbaner.png"
											id="te_BuyOrderFormTable_<%=row%>_<%=col%>_i"
											style="width: 250px; height: 250px; object-fit: cover;"></img>
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
			<td><select name="fe_OrderType" id="fe_OrderType"
				class="dropdownlisttrade">
					<option value="">SELECT ORDER TYPE</option>
					<%
					if (request.getParameter("type").equalsIgnoreCase(Resource.ASK)) {
					%>
					<option value="MRBUY">MARKET RATE BUY</option>
					<option value="PRBUY">PENDING RATE BUY</option>

					<%
					} else {
					%>
					<option value="Market Execution">MARKET RATE
						SELL</option>
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
			<td colspan="2" align="center" style="font-size: 13px">Notice!
				Making Charges for each piece is extra and computed at
				the time of billing</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</form>
<script>
	let image_path = "";
		$("#fe_OrderType").change(function() {
			var comid = document.getElementById("fe_Currency").value;
			var buyrate = document.getElementById("fe_BuyRate").value;
			var ordtype = "";
			var randval = Math.random()
			var ordtype = document.getElementById("fe_OrderType").value;
			$("#responsecontainer").load('/Online-Orders/trading-accept?' + $.param({
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
				url : "/Online-Orders/image-path",
				data : "value=" + value,
				success : function(data) {
					image_path = data;
					img.src = data;
				},
				error : function(err) {
					console.log(err);
				},

			});

		}

		function displayView(selectRow) {
			Swal.fire({
   			 imageUrl: image_path, 
   			 imageWidth: 400, 
    		 imageHeight: 400,
          });
		}


	</script>
  </body>
</html>
