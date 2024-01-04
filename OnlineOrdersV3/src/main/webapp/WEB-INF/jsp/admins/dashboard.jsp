<!DOCTYPE html>
<html>
<head>
<title>Dashboard Template</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<style>
body {
	font-family: Arial, sans-serif;
}

.dashboard {
	margin: 20px;
	background-color: #f9fafa;
	height: 700px !important;
}

.sidebar {
	color: black;
	padding: 20px;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar li {
	margin-bottom: 10px;
}

.content {
	background-color: #f5f5f5;
	padding: 20px;
}

.widget {
	border: 1px solid #ccc;
	padding: 20px;
	text-align: center;
	background-color: #f5f5f5;
}

.chart {
	width: 100%;
	height: 300px;
}

.dashboard-content {
	background-color: white !important;
	border: 1px solid whitesmoke;
	border-radius: 12px;
	padding: .8rem;
	box-shadow: 1px 1px 8px 1px rgba(230, 213, 202, 1);
	height: 600px;
}

body::-webkit-scrollbar {
	width: 1em;
}

body::-webkit-scrollbar-track {
	box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

body::-webkit-scrollbar-thumb {
	background-color: darkgrey;
	outline: 1px solid slategrey;
}

.dashboard-list {
	padding: 1rem;
}

.dashboard-list_li {
	margin: 5px !important;
}

.dashboard-list_li i {
	margin: 5px !important;
}
</style>
</head>
<body style="background-color: #f9fafa;">
	<div class="">
		<div class="container-flex" style="background-color:white">
			<div class="container">
				<!-- Image and text -->
				<nav class="navbar navbar-light">
					<a class="navbar-brand" href="#"> <img
						src="https://cdn.shopify.com/s/files/1/0048/7722/1988/files/Brand_Logo.jpg?v=1648123278"
						width="30" height="30" class="d-inline-block align-top" alt="">
					</a>
					
					<a>Logout</a>
				</nav>
			</div>
		</div>
		<div class="container mt-5">
			<div class="row">
				<div class="sidebar col-lg-2">
					<h4>Explore</h4>
					<ul class="dashboard-list list-group">
						<li class="d-flex align-items-center dashboard-list_li cursor-pointer"
							data-eve-reg="click,toggleFrame"
							data-frame="../admin/user-panel">
							<i class="fa-solid fa-user fa-xs mr-3"></i> User
						</li>
						<li class="d-flex align-items-center dashboard-list_li cursor-pointer"
							data-eve-reg="click,toggleFrame"
							data-frame="https://practicepaper.in/gate-cse/discrete-mathematics?page_no=1">
							<i class="fas fa-shopping-cart fa-lg mr-3" aria-hidden="true"></i>
							Commodities
						</li>
						<li class="d-flex align-items-center dashboard-list_li cursor-pointer"
							data-eve-reg="click,toggleFrame"
							data-frame="https://www.w3schools.com/tags/tag_iframe.ASP">
							<i class="far fa-handshake fas mr-3"></i> Company Profiles
						</li>
						<li class="d-flex align-items-center dashboard-list_li cursor-pointer"
							data-eve-reg="click,toggleFrame"
							data-frame="https://css-tricks.com/almanac/properties/s/scrollbar/">
							<i class="far fa-file fas mr-3"></i> Reports
						</li>
						<li class="d-flex align-items-center dashboard-list_li cursor-pointer"
							data-eve-reg="click,toggleFrame"
							data-frame="../admin/basepc-page">
							<i class="fas fa-gear fas  mr-3"></i>All Settings
						</li>
					</ul>
				</div>

				<div class="dashboard-content col-lg-10">
					<div>
						<iframe src="../admin/default-panel" width="100%" height="580px"
							id="frameid"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../javascript/dashboard.js" type="module" defer></script>
</body>
</html>
