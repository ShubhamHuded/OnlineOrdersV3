
<%@ page import="java.sql.*"%>
	<%@ page import="maipl.server.*"%>
	<%@ page import="maipl.server.*"%>
	<%@ page import="maipl.xml.*"%>
	<%@ page import="org.w3c.dom.*"%>
	<%@ page import="maipl.util.*"%>
	<%@ page import="org.json.*"%>
	<%@ page import="java.util.*"%>
<html lang="en">

<head>

<title>BRPL | iew profile</title>

<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description"
	content="A survey form used by a hotel to get the satisfaction level of visitors">

<meta name="author" content="Edward Mc Evoy 2019">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="../css/style.css" />
</head>

<body>

	<jsp:include page="../home/NavigationBar.jsp" />
	<div class="container">
		<!-- open container -->
		<div class="row justify-content-center">
			<!--  open row -->

			<div id="form-header" class="col-12 mt-4 d-flex justify-content-center">
				<h4 id="title">Profile</h4>
			</div>
		</div>
		<!--  close row -->

		<div class="row mt-4 justify-content-center">
			<!--  open row -->
			<div id="form-content" class="col-md-6">

				<form id="survey-form" onsubmit="return false;">
					<!-- open form -->

					<div class="row form-group">
						<div class="col-sm-3">
							<label  class="control-label"
								for="userFirstName">First Name:</label>
						</div>

						<div class="input-group col-sm-9">
							<input id="userFirstName" type="text" class="form-control"
								 name="userFirstName"
								required disabled value=${user.userFirstName}>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-sm-3">
							<label  class="control-label"
								for="userlastName">Last Name:</label>
						</div>

						<div class="input-group col-sm-9">
							<input id="userlastName" type="text" class="form-control"
								name="userlastName"
								required disabled value=${user.userLastName}>
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-3">
							<label  class="control-label"
								for="userEmail">Email:</label>
						</div>

						<div class="input-group col-sm-9">
							<input type="text" class="form-control" id="userEmail"  name="userEmail"
								pattern="^[-+.\w]{1,64}@[-.\w]{1,64}\.[-.\w]{2,6}$"
								required disabled value=${user.userEmailId}>
						</div>
					</div>


					<div class="form-group row">
						<div class="col-sm-3">
							<label class="control-label"
								for="userMobile">Mobile Number</label>
						</div>

						<div class="input-group col-sm-9">
							<input type="text" class="form-control" id="userMobile"
								 name="userMobile"
								min="1" max="125" required disabled value="${user.userMobile}">
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-3">
							<label  class="control-label"
								for="user">Password</label>
						</div>

						<div class="input-group col-sm-9">
							<input type="password" class="form-control" id="userPassword"
								 name="userPassword"
								 required disabled value=*******>
						</div>
					</div>
			  <!-- <button id="submit" class="btn btn-primary">update-info</button> -->
				</form> 

			</div>

		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>

</html>