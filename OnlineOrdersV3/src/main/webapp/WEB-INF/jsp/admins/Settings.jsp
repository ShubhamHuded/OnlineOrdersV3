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

<style>
.approval-container {
	width: 100%;
}

.approval-container a {
	margin: 10px;
}

.jmodal::after {
	display: none !important;
}

.swal2-container {
	z-index: 9999 !important; /* Adjust the z-index as needed */
}

.jexcel_container {
	width: 100% !important;
}

.jexcel_toolbar {
	justify-content: end;
	gap: 10px;
}

.jexcel_toolbar i.jexcel_toolbar_item {
	width: 28px;
	height: 28px;
	padding: 5px;
	cursor: pointer;
	display: inline-block;
}

.jexcel_tabs .jexcel_tab {
	border: 1px solid black;
	border-radius: 8px;
}

[data-x="2"] {
 text-color:blue;
}
</style>
<div id='modal'></div>
<div id='userView'></div>
<div class="d-flex flex-column">
	<div>
		<h4>Onboarding</h4>
		<div class="d-flex approval-container justify-content-between">
			<a data-eve-reg="click,toggleModal" class='plain'
				data-url="./trader-signup">Trader Approval <i
				class="fa-solid fa-arrow-up-right-from-square"></i></a> <a
				data-eve-reg="click,toggleModal" class='plain'>Company Profile
				Approval <i class="fa-solid fa-arrow-up-right-from-square"></i>
			</a> <a data-eve-reg="click,toggleModal" class='plain'>Document
				Approval <i class="fa-solid fa-arrow-up-right-from-square"></i>
			</a> <a data-eve-reg="click,toggleModal" class='plain'>SubUser
				Approval <i class="fa-solid fa-arrow-up-right-from-square"></i>
			</a>
		</div>
	</div>
	<div class="d-flex mt-4">
		<div id="spreadsheet"></div>
	</div>
</div>

<script src="../javascript/UserPanel.js" type="module"></script>
