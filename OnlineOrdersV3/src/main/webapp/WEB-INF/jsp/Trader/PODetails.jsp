
<%@page import="br.brpltrade.server.*"%>
<%@page import="maipl.xml.*"%>
<%@page import="maipl.util.*"%>
<%@page import="org.json.*"%>
<%@page import="br.base.*"%>
<%@page import="java.text.*"%>

<%@ page errorPage="Error.jsp"%>

<home>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css"
	integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY="
	crossorigin="anonymous">
<script src="../javascript/Ztime.js"></script> <script
	src="../javascript/OrderDisplayList.js"></script> <script
	src="../javascript/modal.js"></script> <script
	src="https://code.jquery.com/jquery-3.5.1.js"></script> <script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
</home>

<style>
		#main--table {
		margin-left: 0px !important;
		margin-right: 0px !important;
		max-width: 100% !important;
	}
</style>


<div class="container" id="main--table">
	<table class="table table-hover" id="DataTable2">
		<thead>
			<tr>
				<th scope="col">SLNO</th>
				<th scope="col">Order Id</th>
				<th scope="col">Order Date</th>
				<th scope="col">Order Type</th>
				<th scope="col">Currency</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">User Id</th>

			</tr>
		</thead>
		<tbody id="new--data">
			<%
			JSONArray jsoAr =(JSONArray) request.getAttribute("data");
			int length = jsoAr.length();
			for (int i = 0; i < length; i++) {
				JSONObject obj = (JSONObject) jsoAr.get(i);
			%>
			<tr>
				<th scope="row"><%=i + 1%></th>
				<td><%=obj.getString("Order_Id")%></td>
				<td><%=obj.getString("Date")%></td>
				<td><%=obj.getString("OrderType")%></td>
				<td><%=obj.getString("Currency")%></td>
				<td><%=obj.getString("Quantity")%></td>
				<td><%=obj.getString("Price")%></td>
				<td><%=obj.getString("User_Id")%></td>
			</tr>
			<%
			}
			%>
		</tbody>
		<script>
		setTimeout(() => {
			$('#DataTable2').DataTable({
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