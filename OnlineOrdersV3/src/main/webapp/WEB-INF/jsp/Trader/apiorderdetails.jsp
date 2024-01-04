<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<P style = "color:green; margin-bottom:0rem">API Order Details</P>
	<table class="table table-hover" id="DataTable">
		<thead>
			<tr>
                <th scope="col">Commodity Code</th>
                <th scope="col">Internal Id</th>
                <th scope="col">Ebiz Id</th>
				<th scope="col">Order Id</th>
                <th scope="col">rate</th>
				<th scope="col">Quntity</th>
				<th scope="col">Margin Used</th>
                <th scope="col">Order Date</th>
                <th scope="col">Order Status</th>
				<th scope="col">Order Type</th>

				
				
                
               
			</tr>
		</thead>
		<tbody id="apiOrderlist">
			<c:forEach items="${apiOrderlist}" var="item">
							<tr>
								<td>${item.commodityCode}</td> 
								<td>${item.internalid}</td>
								<td>${item.ebizId}</td>
								<td>${item.orderId}</td>
								<td>${item.rate}</td>
								<td>${item.quantity}</td>
                                <td>${item.marginUsed}</td>
								<td>${item.timeStamp}</td>
								<td>${item.orderStatus}</td>
								<td>${item.type}</td>
							</tr>
						</c:forEach>
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