<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewSubUser</title>
</head>
<style>
.profile, .content {
	-webkit-transition: 0.5s ease;
	-moz-transition: 0.5s ease;
	transition: 0.5s ease;
}

.profile {
	position: absolute;
	bottom: auto;
	left: 0;
	right: 0;
	min-height: 100%;
	height: auto;
	width: 75%;
	margin: 20px auto;
	margin-bottom: 100px;
	background-color: #fff;
	border-top: 5px solid #EE7B10;
	border-radius: 0 0 5px 5px;
	box-shadow: 0 2.5px 5px #ccc;
}

.content {
	/* position: absolute; */
	min-height: 100%;
	height: 100%;
	width: 95%;
	margin: 2.5% auto;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	/*border: 1px solid #eee;*/
	/*background-color: yellow;*/
	overflow: hidden;
}

span.btn:hover {
	opacity: 1;
	color: #fff;
	background-color: rgba(57, 203, 88, 1);
	/* background-color: #39cb58; */
}

.profile:hover .btn {
	opacity: 1;
}

/*Input Fields Styles
=========================*/
fieldset textarea, input {
	font-family: Open Sans;
	font-size: 15px;
	color: #333;
	background-color: #fff;
	box-shadow: 0 0 0 1px #EE7B10;
	padding: 5px;
	width: 50%;
	margin: 5px auto;
	border: 0;
	border-radius: 2.5px;
	outline: 0;
	transition: 0.3s ease;
}

fieldset textarea {
	min-height: 40px;
	max-height: 60px;
}

.grid-35 {
	width: 35%;
	float: left;
	font-weight: 500;
	color: #333;
	/* text-align: left; */
}

.grid-65 {
	position: relative;
	width: 65%;
	float: right;
	font-family: Source Sans Pro;
	font-weight: 300;
	font-size: 17px;
}

/* #CLEARFIX HACK
=========================*/
.clear:after {
	content: " ";
	display: table;
	clear: both;
}

/* Edit View
======================*/
.content h1 {
	text-align: center;
	color: #555;
	font-family: Lato;
	font-size: 40px;
	font-weight: 200;
	margin: 5px auto 15px auto;
}

fieldset {
	text-align: center;
	/* background-color: rgba(0,0,0,0.01); */
	margin-bottom: 5px;
	padding: 5px;
	box-sizing: border-box;
	border-bottom: 1px solid rgba(0, 0, 0, 0.07);
}

input.Btn:hover {
	background-color: rgba;
}

.backColor {
	background-color: white;
}
</style>
<body>
	<div class="profile">
		<div class="content">
			<h1>Edit Profile</h1>
			<!--     <button id="editBtn">edit profile</button> -->
			<form action="">
				<fieldset>
					<div class="grid-35">
						<label for="fname">user email</label>
					</div>
					<div class="grid-65">
						<input type="email" id="email" tabindex="1" />
					</div>
				</fieldset>
				<fieldset>
					<div class="grid-35">
						<label for="lname">User Name</label>
					</div>
					<div class="grid-65">
						<input type="text" id="name" tabindex="2" />
					</div>
				</fieldset>

				<!-- Email -->
				<fieldset>
					<div class="grid-35">
						<label for="email">password</label>
					</div>
					<div class="grid-65">
						<input type="email" id="password" tabindex="3" />
					</div>
				</fieldset>

				<!-- Mobile Number -->
				<fieldset>
					<div class="grid-35">
						<label for="mobile">Mobile Numer</label>
					</div>
					<div class="grid-65">
						<input type="mobile" id="mobile" tabindex="4" />
					</div>
				</fieldset>
				<!-- Company Name -->
				<fieldset>
					<div class="grid-35">
						<label for="company">Trader</label>
					</div>
					<div class="grid-65">
						<input type="text" id="trader" tabindex="5" />
					</div>
				</fieldset>
				
					<fieldset>
					<div class="grid-35">
						<label for="Currency">Currency</label>
					</div>
					<div class="grid-65">
						<input type="text" id="currency" tabindex="6" />
					</div>
				</fieldset>
				
					<fieldset>
					<div class="grid-35">
						<label for="totalorderqtyperday">Total Order Qty Per Day</label>
					</div>
					<div class="grid-65">
						<input type=number id="totalorderqtyperday" tabindex="6" />
					</div>
				</fieldset>
				
					<fieldset>
					<div class="grid-35">
						<label for="maxorderqty">Max Order Qty</label>
					</div>
					<div class="grid-65">
						<input type="number" id="maxorderqty" tabindex="7"  />
					</div>
				</fieldset>
				
				
				<fieldset>
				<div class="grid-35">
						<label for="tradingEnabled"> Trading Enabled</label><br>
					</div>

					<div class="grid-65">
						<input type="checkbox" id="tradingEnabled" name="tradingEnabled" value="tradingEnabled">
				</div>
				
					<div class="grid-35">
						<label for="allowpendingorder"> Allow Pending Order</label><br>
					</div>

					<div class="grid-65">
						<input type="checkbox" id="allowpendingorder" name="allowpendingorder" value="allowpendingorder">
				</div>
				
						<div class="grid-35">
						<label for="allowsales"> Allow sales</label><br>
					</div>

					<div class="grid-65">
						<input type="checkbox" id="allowsales" name="allowsales" value="allowsales">
				</div>
				
				</fieldset>
				
			
				

				<fieldset>
					<button id="submitBtn" type="button" class="toggle-disabled">Submit</button>

				</fieldset>
			</form>
		</div>
	</div>

	<script>
	
	async function postData(url, data) {
		 const response = await fetch(url, {
			  method: 'POST',
			  mode: 'cors',
			  cache: 'no-cache',
			  credentials: 'same-origin',
			  headers: {
				  'Content-Type': 'application/x-www-form-urlencoded'
			    },
			    redirect: 'follow', 
			    referrerPolicy: 'no-referrer',
			    body: data 
		 });
		 return response;
	}

		
		
		 submitBtn.addEventListener("click", ()  => {
			    userEmail = document.getElementById("email");
				userName = document.getElementById("name");
				userMobile = document.getElementById("mobile");
				trader = document.getElementById("trader");
				userPassword = document.getElementById("password");
				//submitBtn = document.getElementById("submitBtn");
				
	         let data = new URLSearchParams({
	    	        'email': userEmail.value,
	    	        'name':userName.value,
	    	        'mobile':userMobile.value,
	    	        'password':userPassword.value,
	    	        'trader':trader.value,
	    	    
	    	    })
	         console.log(data);
	    	 postData("/Online-Orders/subuser-profile-data", data);
	     });
	     
		
	</script>


</body>
</html>