<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Material+Icons" />

<script src="https://jsuites.net/v4/jsuites.js"></script>

<script src="https://jsuites.net/v4/jsuites.webcomponents.js"></script>

<link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css"
	type="text/css" />

<script src="https://bossanova.uk/jspreadsheet/v4/jexcel.js"></script>
<link rel="stylesheet"
	href="https://bossanova.uk/jspreadsheet/v4/jexcel.css" type="text/css" />
</head>
<body>
	<style>
.time-line__container {
	border-left: 2px solid #ccc;
	margin-left: 100px;
}

li {
	list-style: none;
	position: relative;
	margin: 15px;
}

.dot-container {
	width: 12px;
	height: 12px;
	background-color: white;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid black;
	position: absolute;
	top: 30%;
	left: -2.4%;
}

.dot {
	width: 7px;
	height: 7px;
	background-color: black;
	border-radius: 50%;
}

.item {
	margin-left: 1.5rem;
}

.email-button {
	background-color: #fff;
	padding: .4em;
	border-radius: 8px;
}
</style>
	<div class="d-flex justify-content-end mb-4">
		<button type="button" class="email-button">
			<i class="fa-solid fa-envelope mr-3"></i> New Email
		</button>
	</div>
	<div data-info="accordino">
		<div class="accordion" id="accordionPanelsStayOpenExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
						aria-controls="panelsStayOpen-collapseOne">Basic info</button>
				</h2>
				<div id="panelsStayOpen-collapseOne"
					class="accordion-collapse collapse show"
					aria-labelledby="panelsStayOpen-headingOne">
					<div class="accordion-body">
						<div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="${email}" disabled>
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">First Name</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="${firstName}">
							</div>
						</div>
						<div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Last Name</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="${lastName}">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Mobile Number</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="${mobile}">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
						aria-controls="panelsStayOpen-collapseTwo">User Activity
						and information</button>
				</h2>
				<div id="panelsStayOpen-collapseTwo"
					class="accordion-collapse collapse"
					aria-labelledby="panelsStayOpen-headingTwo">
					<div class="accordion-body">
						<strong>This is the second item's accordion body.</strong> It is
						hidden by default, until the collapse plugin adds the appropriate
						classes that we use to style each element. These classes control
						the overall appearance, as well as the showing and hiding via CSS
						transitions. You can modify any of this with custom CSS or
						overriding our default variables. It's also worth noting that just
						about any HTML can go within the
						<code>.accordion-body</code>
						, though the transition does limit overflow.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseThree"
						aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">Change
						Password</button>
				</h2>
				<div id="panelsStayOpen-collapseThree"
					class="accordion-collapse collapse"
					aria-labelledby="panelsStayOpen-headingThree">
					<div class="accordion-body">
						<strong>This is the third item's accordion body.</strong> It is
						hidden by default, until the collapse plugin adds the appropriate
						classes that we use to style each element. These classes control
						the overall appearance, as well as the showing and hiding via CSS
						transitions. You can modify any of this with custom CSS or
						overriding our default variables. It's also worth noting that just
						about any HTML can go within the
						<code>.accordion-body</code>
						, though the transition does limit overflow.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseThree"
						aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">More
						information</button>
				</h2>
				<div id="panelsStayOpen-collapseThree"
					class="accordion-collapse collapse"
					aria-labelledby="panelsStayOpen-headingThree">
					<div class="accordion-body">
						<strong>This is the third item's accordion body.</strong> It is
						hidden by default, until the collapse plugin adds the appropriate
						classes that we use to style each element. These classes control
						the overall appearance, as well as the showing and hiding via CSS
						transitions. You can modify any of this with custom CSS or
						overriding our default variables. It's also worth noting that just
						about any HTML can go within the
						<code>.accordion-body</code>
						, though the transition does limit overflow.
					</div>
				</div>
			</div>
		</div>

	</div>
	<div>
		<%
		JSONArray timeline = (JSONArray) request.getAttribute("timeline");
		%>
		<%
		if (timeline != null && timeline.length() > 0) {
		%>
		<div class="d-flex ml-4 flex-column mt-4">
			<h4>Activity History</h4>
			<div class="time-line__container">
				<%
				out.println("<ul class=\"list-group list-group-flush\">");
				for (int i = 0; i < timeline.length(); i++) {
					JSONObject item = timeline.getJSONObject(i);
					out.println("<li>");
					out.println("<div class=\"dot-container\">");
					out.println("<div class=\"dot\"></div>");
					out.println("</div>");
					out.println("<div class=\"item\">");
					out.println(item.getString("action") + " " + " " + item.getString("timeStamp"));
					out.println("</div>");
					out.println("</li>");
				}
				%>
				<%
				out.println("</ul>");
				%>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>