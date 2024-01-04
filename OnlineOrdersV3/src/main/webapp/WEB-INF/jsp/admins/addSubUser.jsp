<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">       
</head>
<body>
		<form action="/Online-Orders/subuser-profile-data" id="subuserlist">
		<div class="subuser--modal">
			<form>
				<div>
					<div>
						<!-- Creating the contents of the modal -->

						<div class="tab-pane fade show active" id="profile"
							role="tabpanel" aria-labelledby="home-tab">

							<div
								class="company--profile__details company--profile__input--edit--enabled">
								<div class="company--profile__input">
									<label style="margin-right: auto;">First
										Name<super>*</super>
									</label> <input type="text" id="userfirstName" name="userFirstName"/>
								</div>
								<div
									class="company--profile__input company--profile__input--edit--enabled">
									<label style="margin-right: auto;">Last
										Name<super>*</super>
									</label> <input class="userlastName" type="text"
										id="userlastName" name="userLastName"/>
								</div>
							</div>

							<div
								class="company--profile__details company--profile__input--edit--enabled">
								<div class="company--profile__input">
									<label style="margin-right: auto;">Email<super>*</super></label>
									<input type="Email" id="userEmailId" name="userEmailId"/>
								</div>
								<div
									class="company--profile__input company--profile__input--edit--enabled">
									<label style="margin-right: auto;">Mobile
										Number<super>*</super>
									</label> <input type="text" id="userMobile" name="userMobile"/>
								</div>
							</div>


							<div class="company--profile__details">
								<div
									class="company--profile__input company--profile__input--edit--enabled">
									<label style="margin-right: auto;">Password<super>*</super></label>
									<input type="password" id="userPassword" name="userPassword"/>
								</div>
							</div>
						</div>

						<div class="d-flex d-g10 subuser--checklist">
							<div class=" d-flex">
								<input type="checkbox" id="tradingEnabeld" name="tradingEnabeld"/><label
									style="margin-right: auto;">Trading Enabled<super>*</super>

								</label>
							</div>

							<div class="d-flex">
								<input type="checkbox" id="allowPendingorder" name="allowPendingorder"/><label
									style="margin-right: auto;">Allow Pending
									Order<super>*</super>
								</label>
							</div>


							<div class=" d-flex">
								<input type="checkbox" id="allowSales" name="allowSales"/><label
									style="margin-right: auto;">Allow Sales<super>*</super>
								</label>
							</div>
						</div>

						<div class="subuser--table" id="subtable">
							<table id="subuserline--table" data-form-table>
								<thead data-table-head>
									<tr>
										<th data-col-name="currency"
											data-col-type="select">Curency</th>
										<th data-col-name="maxOrderQty"
											data-col-type="input">Max Order Qty</th>
										<th data-col-name="totalOrderQty"
											data-col-type="input">Total Order Qty</th>
										<th data-col-name="edit" data-col-type="button"
											data-col-child="Edit Delete">edit</th>
									</tr>
								</thead>
								<tbody data-table-body data-eve-reg="click,editRow"></tbody>
							</table>
						</div>

						<button id="close_btn" class="closebtn" >X</button>
						<div class="d-flex"
							style="justify-content: space-between; margin-top: 10px;">
							<button id="submitbtn" data-eve-reg="click,submit" 
								class="">submit</button> 
							<button id="addrowBtn" data-eve-reg="click,addRow" 
								class="">add new row</button>
						</div>
					</div>
 
				</div>
		</div>

	</form>
	<jsp:include page="../home/footer.jsp" />
	<script src = "./js/SubuserForm.js" type = "module"></script>
</body>
</html>