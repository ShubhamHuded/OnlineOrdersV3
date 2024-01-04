<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BRPL | Reports</title>
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
<style>
.jexcel_tabs .jexcel_tab_link {
	background-color: #f3f3f3;
}

.jexcel_tabs .jexcel_tab_link.selected {
	background-color: #eed7ba;
	border: 1px solid gold;
	border-radius: 8px;
}

.jexcel_content {
	border: 1px solid black;
	width: 100%;
	border-radius: 8px;
}
</style>
<body>
	<div class="">
		<jsp:include page="../home/NavigationBar.jsp" />
		<div class="container mt-4">
			<div id="spreadsheet"></div>
		</div>
	</div>
	<script src="../Online-Orders/javascript/reports.js" type="module"></script>
</body>
</html>