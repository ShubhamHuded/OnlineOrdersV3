<html>
<head>
<title>****</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css"
	href="../css/style.css" />
</head>
<body>
<%
	String data = request.getParameter("row-data");
%>
<form class="sub--form" id="subForm" action="/Online-Orders/subuser-profile-data">
	<div class="container">
		<div class="row">
			<div class="one col-lg-10 mt-4">
				<div class="form-group">
					<div class="d-flex justify-content-between mt-2">
						<div class="col-5">
							<label for="userFirstName"class="p-1">First Name<span
								class="reg--require"> *</span></label> <input id="userfirstName" name="userFirstName"
								type="text" class="form-control form-control-sm" />
						</div>
						<div class="col-5">
							<label for = "userlastName" class="p-1">Last Name<span
								class="reg--require"> *</span></label> <input id="userlastName" name="userLastName"
								type="text" class="form-control form-control-sm" />
						</div>
					</div>
					<div class="d-flex justify-content-between mt-2">
						<div class="col-5">
							<label for="userEmailId" class="p-1">Email<span
								class="reg--require"> *</span></label> <input id="userEmailId" name="userEmailId"
								type="text" class="form-control form-control-sm" />
						</div>
						<div class="col-5">
							<label for="userMobile" class="p-1">Mobile Number<span
								class="reg--require"> *</span></label> <input id="userMobile" name="userMobile"
								type="text" class="form-control form-control-sm" />
						</div>
					</div>
					<div class="d-flex justify-content-between mt-2">
						<div class="col-5">
							<label for="userPassword" class="p-1">Password<span
								class="reg--require"> *</span></label> <input type="password" id="userPassword" name="userPassword" class="form-control form-control-sm" />
						</div>
						<div class="col-5 mt-4">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									value="" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault">
									Allow Trading</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									value="" id="flexCheckChecked"> <label
									class="form-check-label" for="flexCheckChecked">
									Allow Pending Order </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									value="" id="flexCheckChecked"> <label
									class="form-check-label" for="flexCheckChecked">
									Allow Sales </label>
							</div>
						</div>
					</div>
				</div>
				<div class = "mt-4">
					<table data-form-table class="table" id="subTable">
						<thead data-table-head>
							<tr>
								<th data-col-name="currency" data-col-type="select">Curency</th>
								<th data-col-name="maxOrderQty"
									data-col-type="input">Max Order Qty</th>
								<th data-col-name="totalOrderQty"
									data-col-type="input">Total Order Qty</th>
								<th data-col-name="edit" data-col-type="button"
									data-col-child="Delete">edit</th>
							</tr>
						</thead>
						<tbody data-table-body ></tbody>
					</table>
					<div class = "d-flex justify-content-between">
						<button data-label="row-add" data-eve-reg="click,addRow">Add row</button>
						<button data-label="submit" data-eve-reg="click,submit">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<script src="../js/subuserfrom.js" type="module"></script>
	<script>
		document.addEventListener("load", ()=>{
			console.log("its working")
		})
	</script>
</body>
</html>