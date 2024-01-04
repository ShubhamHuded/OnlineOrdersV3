
<%@page import="br.brpltrade.server.*"%>
<%@page import="maipl.xml.*"%>
<%@page import="maipl.util.*"%>
<%@page import="org.json.*"%>
<%@page import="br.base.*"%>
<%@page import="java.text.*"%>

<%@ page errorPage="Error.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css"
	integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY="
	crossorigin="anonymous">
<script src="../javascript/Ztime.js"></script>
<script src="../javascript/OrderDisplayList.js"></script>
<script src="../javascript/modal.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
</head>


<div class="container" id="main--table">
	<P style = "color:green; margin-bottom:0rem">Accepted Orders </P>
	<table class="table table-hover" id="DataTable">
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">Order Id</th>
				<th scope="col">Order Date</th>
				<th scope="col">Commodity</th>
				<th scope="col">Order Type</th>
				<th scope="col">Qty</th>
				<th scope="col">Price</th>
				<th scope="col">Subuser</th>
				<th scope="col">amount</th>
			</tr>
		</thead>
		<tbody id="new--data">
			<%
			JSONArray jsoAr =(JSONArray) request.getAttribute("data");
			int length = jsoAr.length();
			if(length == 0) { %>
				<p>There Are No Orders</p>
			<% }
			for (int i = 0; i < length; i++) {
				JSONObject obj = (JSONObject) jsoAr.get(i);
				double value = Double.parseDouble(obj.getString("Total_Sales_Value"));
				String val = new DecimalFormat("#.##").format(value);
			%>
			<tr>
				<th scope="row"><%=i + 1%></th>
				<td><%=obj.getString("Doc_Id")%></td>
				<td><%=obj.getString("Date")%></td>
				<td><%=obj.getString("Symbol")%></td>
				<td><%=obj.getString("OrderType")%></td>
				<td><%=obj.getString("Quantity")%></td>
				<td><%=obj.getString("Price")%></td>
				<%
				if (obj.has("User_Id")) {
				%><td><%=obj.getString("User_Id")%></td>
				<%
				} else {
				%>
				<td>-</td>
				<%
				}
				%>
				<td><%=val%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<script>
setTimeout(() => {
	$('#DataTable').DataTable({
		"lengthChange": false,
		pagingType: 'first_last_numbers',
		pageLength: 5,
		'columnDefs': [{
			'targets': [0, 1, 3, 4, 5, 6, 7],
			'orderable': false,
		}]
	});
}, 500);
</script>
</div>