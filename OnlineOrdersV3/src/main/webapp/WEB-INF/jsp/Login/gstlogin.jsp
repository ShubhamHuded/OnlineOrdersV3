<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="maipl.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ page errorPage="Error.jsp" %>  
<!DOCTYPE>
<html>
<head>
<title>BRPL Order Login</title>
<script src="jquery.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"
	async defer></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="/cookie-script"></script>
<link rel="stylesheet" type="text/css"
	href="admin/StyleSheet/formstyle.css" />
<link rel="stylesheet" type="text/css"
	href="admin/StyleSheet/menustyle.css" />
<link rel="stylesheet" type="text/css"
	href="admin/StyleSheet/controlstyle.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<title>Log In Form</title>
 <link rel="icon" type="image/x-icon" href="images/favicon.jpg">
</head>
<style>
</style>
<body>
	<div class="login--body">
		<div class="login--container">
			<div class="company--logo">
				<img src="/images/logo.gif" />
			</div>
			<h3 class="login-title">Login</h3>
			<form name="FrmDesign" class="login" id="FrmDesign"
				action="#" method="post" autocomplete="off">
				<div class="input--group">
					<label for="SubuserLogInEmail">GST NO :</label> <input
						type="text" name="SubuserLogInEmail" id="traderGst"
						class="TXT" value="" required autocomplete="false" />
				</div>
				<span id="info-msg"
					style="color: red; margin-bottom: .2rem; font-size: .9rem;"></span>
				<div class="input--group hide--expand" id="otp">
					<label for="user_pass">OTP :</label> <input
						type="password" name="Password" id="Password"
						class="TXT" value="" required autocomplete="false" />
				</div>
				<div
					style="display: flex; justify-content: space-between;">
					<div class="login--button">
						<input type="submit" name="login" id="login"
							value="send otp" style="padding: .2rem;" />
					</div>
					<div class="login--button">
						<input type="submit"
							formaction="gstotpauthenticate" value="login"
							style="border: none; background: transparent;"
							id="loginBtn" class="hide--expand">
					</div>
				</div>
			</form>
			<p id="formID"
				style="margin-top: 1rem; text-align: center;"
				class="hide--expand">
				<a href="#">Download, </a>this form and send it to the <br />
		     	<span style="text-align: center;"><u>coins@banglorerefinery.com</u></span>
		     	</p>
		</div>
	</div>
	<script>
		let logBtn = document.getElementById("login");
		let otpInp = document.getElementById("otp");
		let TraderGstNo = document.getElementById("traderGst");
		let FrmDesign = document.getElementById("FrmDesign");
		let infoMsg = document.getElementById("info-msg");
		let loginBtn = document.getElementById("loginBtn");
		let formID = document.getElementById("formID");
		logBtn.disabled = true;
		TraderGstNo.addEventListener('change', () => {
			if(TraderGstNo.value != "") 
				logBtn.disabled = false;
		})
 		logBtn.addEventListener('click', (e) => {
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
			let data = new URLSearchParams({
		        'gstNum': TraderGstNo.value
		    })
			postData("gstauthenticate", data)
			 .then(resp => {
				if( resp.status === 200) {
					 console.log("it's working");
					 FrmDesign.action = "gstotpauthenticate";
					 otpInp.classList.remove("hide--expand");
					 loginBtn.classList.remove("hide--expand");
					 logBtn.value = "re-send otp"; 
					 console.log(document.cookie)
					 console.log(getCookie("resp"));
					 infoMsg.innerHTML = "OTP is sent to "+getCookie("resp").substr(0,3)+"*****@"+getCookie("resp").split("@")[1];
					 formID.classList.add("hide--expand");
				 } else {
					 console.log("It's not working");
					 infoMsg.innerHTML = "No User Associated with given GST";
					 formID.classList.remove("hide--expand");
				 }
			 });
			 e.preventDefault();
		}); 
		
		
		//cookies
		function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i <ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}
	</script>


</body>
</html>