<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Brpl| Update company profile</title>
	<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css" />	
</head>
<style>
.striped-hr {
	height: 2px;
	border: none;
	margin-top: 55px !important;
	background-image: linear-gradient(to right, #000000 10%, #ffffff 10%, #ffffff 20%, #000000
		20%, #000000 30%, #ffffff 30%, #ffffff 40%, #000000 40%, #000000 50%,
		#ffffff 50%, #ffffff 60%, #000000 60%, #000000 70%, #ffffff 70%,
		#ffffff 80%, #000000 80%, #000000 90%, #ffffff 90%, #ffffff 100%);
	background-size: 30px 1px;
	background-image: linear-gradient(to right, #000000 10%, #ffffff 10%, #ffffff 20%, #000000
		20%, #000000 30%, #ffffff 30%, #ffffff 40%, #000000 40%, #000000 50%,
		#ffffff 50%, #ffffff 60%, #000000 60%, #000000 70%, #ffffff 70%,
		#ffffff 80%, #000000 80%, #000000 90%, #ffffff 90%, #ffffff 100%);
}
</style>
<body>
	<jsp:include page="./NavigationBar.jsp" />
	<div class = "container">
		<div class="row">
			<div
				class="one col-sm-9 mt-4 justify-content-center container">
				<form id="companydetails"
					action="/Online-Orders/submit-company-profile-data">
					<c:if test="${type eq 'Admin'}">
						<div class="d-flex justify-content-between">
							<p style="font-weight: bold;">Company Details</p>
							<div class="d-flex">
								<ul class="list-unstyled d-flex">
									<li class="m-2" role="button"
										data-eve-reg="click,submit">Save</li>
									<li class="m-2" role="button"
										data-eve-reg="click,edit">Edit</li>
									<li class="m-2" role="button"
										data-eve-reg="click,reload">Reload</li>
								</ul>
							</div>
						</div>
					</c:if>
					<div class="form-group">
						<div class="">
							<div class="mt-2">
								<label>Company Name<span
									class="reg--require"> *</span></label> <input id="firmName"
									type="text" disabled class="form-control"
									data-mandatory name="firmName" data-editable-once value="${empty partyProfile ? '' : partyProfile.firmName}"/>
							</div>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<div class="col-5">
								<label>Owner Name<span class="reg--require">
										*</span></label> <input id="ownerName" type="text" disabled
									class="form-control" data-mandatory
									name="ownerName" data-editable-once value="${empty partyProfile ? '' : partyProfile.ownerName}"/>
							</div>
							<div class="col-5">
								<label>Type:<span class="reg--require">
										*</span></label> <select id="companyProfile" disabled
									class="company--profile__dropdown form-control"
									data-mandatory name="companyType"
									data-editable-once value="${empty partyProfile ? '' : partyProfile.companyType}">
									<option value="">Select a type</option>
									<option value="propteripor">Propteripor</option>
									<option value="llp">LLP</option>
									<option value="pvt_ltd">Pvt Ltd</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<div class="col-3">
								<label>Phone Number<span
									class="reg--require"> *</span></label> <input
									id="phoneNumer" type="text" disabled
									class="form-control" data-mandatory
									name="phoneNumer" value="${empty partyProfile ? '' : partyProfile.phoneNumer}"/>
							</div>
							<div class="col-4">
								<label>Website<span class="reg--require">
										*</span></label> <input id="webSite" type="text" disabled
									class="form-control" data-mandatory name="webSite" value="${empty partyProfile ? '' : partyProfile.webSite}">
							</div>
							<div class="col-4">
								<label>GST Number<span class="reg--require">
										*</span></label> <input id="gstNumber" type="text" disabled
									class="form-control" data-mandatory
									name="gstNumber" data-editable-once
									value="${empty partyProfile ? '' : partyProfile.gstNumber}"
							>
							</div>
						</div>
					</div>
					<div class="mt-5 form-group">
						<p style="font-weight: bold;">Address</p>
						<div class="mt-3">
							<div class="">
								<label>Street Address 1<span
									class="reg--require"> *</span></label> <input
									id="streetAddress1" type="text" disabled
									class="form-control" data-mandatory name="address1" value="${empty partyProfile ? '' : partyProfile.address1}"/>
							</div>
							<div class="mt-3">
								<label>Street Address 2</label> <input
									id="streetAddress2" type="text" disabled
									class="form-control" name="address2" 
									value="${empty partyProfile ? '' : partyProfile.address2}"/>
							</div>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<div class="col-3">
								<label>City<span class="reg--require">
										*</span></label> <input id="city" type="text" disabled
									class="form-control" data-mandatory name="city" 
									value="${empty partyProfile ? '' : partyProfile.city}"/>
							</div>
							<div class="col-4">
								<label>State<span class="reg--require">
										*</span></label> <select name="state" id="state" disabled
									class="form-control company--profile__dropdown"
									data-mandatory name="state"
									value="${empty partyProfile ? '' : partyProfile.state}">
									<option value="">Select a state</option>
									<option value="Andhra Pradesh">Andhra
										Pradesh</option>
									<option value="Andaman and Nicobar Islands">Andaman
										and Nicobar Islands</option>
									<option value="Arunachal Pradesh">Arunachal
										Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadar and Nagar Haveli">Dadar
										and Nagar Haveli</option>
									<option value="Daman and Diu">Daman and
										Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal
										Pradesh</option>
									<option value="Jammu and Kashmir">Jammu
										and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya
										Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar
										Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>
							</div>
							<div class="col-4">
								<label>Country<span class="reg--require">
										*</span></label> <input id="country" type="text" disabled
									class="form-control" data-mandatory name="country" 
									value="${empty partyProfile ? '' : partyProfile.country}"/>
							</div>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<div class="col-5">
								<label>Fax Number</label> <input id="faxNumber"
									type="text" disabled class="form-control" 
									value="${empty partyProfile ? '' : partyProfile.firmName}"/>
							</div>
							<div class="col-5">
								<label>Pincode<span class="reg--require">
										*</span></label> <input id="pincode" type="text" disabled
									class="form-control" data-mandatory name="pincode" 
									value="${empty partyProfile ? '' : partyProfile.pincode}"/>
							</div>

						</div>
					</div>
					<div class="three"></div>
				</form>
			</div>
		</div>
		<hr class="striped-hr">
		<div class="row">
			<div class="d-flex flex-column">
				<div class="container">
					<div class="text-center mt-4">
						<h3>Partners Details</h3>
					</div>
				</div>
			</div>
			<div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Firstname</th>
							<th>Lastname</th>
							<th>Designation</th>
							<th>Email</th>
							<th>Pancard</th>
							<th>Phone Number</th>
							<c:if test="${type eq 'Admin'}">
								<th>Modify</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${partnerList}" var="item">
							<tr>
								<td>${item.fname}</td>
								<td>${item.lname}</td>
								<td>${item.designation}</td>
								<td>${item.email}</td>
								<td>${item.pancard}</td>
								<td>${item.phone}</td>
								<c:if test="${type eq 'Admin'}">
									<td>
										<div class = "d-flex">
											<p class = "" role="button" data-eve-reg="click,editpartner">edit</p>
											<p style="margin-left:2px;margin-right:2px;"> | </p>
											<p class = "" role="button" data-eve-reg="click,deletepartner">delete</p>
										</div>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="${type eq 'Admin'}">
				<div class="container">
					<div class="text-center mt-4">
						<button class="btn btn-primary"
							data-eve-reg="click,addpartner">Add Partners</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<div class="mt-5">
		<jsp:include page="./footer.jsp" />
	</div>
	<script src="../Online-Orders/javascript/UploadCompanyProfile.js" type="module"></script>
</body>
</html>