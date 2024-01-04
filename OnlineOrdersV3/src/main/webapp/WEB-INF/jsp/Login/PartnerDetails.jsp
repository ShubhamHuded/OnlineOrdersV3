<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Partner Details</title>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css"
	integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY="
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-3">
		<form action="/Online-Orders/submit-partner-details" method="post" id="partnerDetails">
			<div
				class="row jumbotron box8 flex-column justify-content-center">
				<div class="col-sm-12 form-group mt-3">
					<label for="name-f mb-1">First Name</label> <input
						type="text" class="form-control" name="fname"
						id="name-f" placeholder="Enter your first name"
						value="${empty partnerDetails ? '' : partnerDetails.fname}" required>
				</div>
				<div class="col-sm-12 form-group mt-3">
					<label for="name-l">Last name</label> <input
						type="text" class="form-control" name="lname"
						id="name-l" placeholder="Enter your last name"
						value="${empty partnerDetails ? '' : partnerDetails.lname}" required>
				</div>

				<div class="col-sm-12 form-group mt-3">
					<label for="designation">Designation</label> <input
						type="text" class="form-control" name="designation"
						id="designation" placeholder="Enter your designation"
						value="${empty partnerDetails ? '' : partnerDetails.designation}" required>
				</div>

				<div class="col-sm-12 form-group mt-3">
					<label for="email">Email</label> <input type="email"
						class="form-control" name="email" id="email"
						placeholder="Enter your email."  value="${empty partnerDetails ? '' : partnerDetails.email}" required>
				</div>

				<div class="col-sm-12 form-group mt-3">
					<label for="pancard">Pancard Number</label> <input
						type="text" name="pancard" class="form-control" id="pancard"
						placeholder="Enter Your Pancard Number." value="${empty partnerDetails ? '' : partnerDetails.pancard}" required>
				</div>

				<div class="col-sm-12 form-group mt-3">
					<label for="tel">Phone Number</label> <input type="tel"
						name="phone" class="form-control" id="tel"
						placeholder="Enter Your Contact Number." value="${empty partnerDetails ? '' : partnerDetails.phone}" required>
				</div>

				<div class="col-sm-12 form-group mb-0">
					<input type = "submit" class="btn btn-primary float-right" value = "submit" data-event="click,submit"/>
				</div>

			</div>
		</form>
	</div>
	<script src="../javascript/PartnerDetails.js" type="module"></script>
</body>
</html>