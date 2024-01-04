let msgID = document.getElementById("infoMsg");
	let pswMsg = document.getElementById("pswMsg");
	let pswMsg2 = document.getElementById("pswMsg2");
	let submitButton = document.getElementById("formSubmit");
	let mainBase = document.getElementById("main--base");
	let emailBtn = document.getElementById("user--email");
	let userPass1 = document.getElementById("user-pass1");
	let userPass2 = document.getElementById("user-pass2");
	let userFirstName = document.getElementById("user-firstName");
	let userLastName = document.getElementById("user-LastName");
	let userMobileNo = document.getElementById("user--mobile");
	let ckeckBox = document.getElementById("checkbox");
	let userTitle = document.getElementById("userTitle"); 
	let otpBox = document.getElementById("otpBox"); 
	let otpMsg = document.getElementById("otpMsg"); 
	let verifyBtn = document.getElementById("verifyBtn"); 
	let wave = document.getElementById("wave--overlay");
	
	let userFirstNameValue, userLastNameValue,  userMobNoValue, userEmailValue, pass1Value, pass2Value;
	
	// eamil flag, need improment
	let emailFlag = true;
	
	/// update the value whenver some events happen in the document
	
	document.addEventListener('change', () => {
		console.log("changes happend");
		userFirstNameValue = document.getElementById("user-firstName").value;
		userLastNameValue =  document.getElementById("user-LastName").value;
		userMobNoValue = document.getElementById("user--mobile").value;
		userEmailValue = document.getElementById("user--email").value;
		pass1Value = document.getElementById("user-pass1").value;
		pass2Value = document.getElementById("user-pass2").value;
	})
	
	// async call to the server to check the email is old or new one
	emailBtn.addEventListener('blur', (e) => {
		let userEmail = document.getElementById("user--email");
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
	        'email': userEmail.value,
	    })		
		 if(validateEamil(userEmail.value)) {
				postData("/verify-email", data)
				 .then(resp => resp.json())
				 .then(data =>  {
					 console.log(data.Value);
					let result = data.Value;
					if(result) {
						msgID.innerHTML = "email already used";
						emailFlag = false;
					} else {
						msgID.innerHTML = "";
						emailFlag = true;
					}
				 });
		 } else {
			 msgID.innerHTML = "Please enter a valid email address";
		 }
		 e.preventDefault();
	});
	
	
	/// when submit button is cliked.
	submitButton.addEventListener('click', () => {
		console.log(userFirstNameValue);
		const inputFeilds = document.querySelectorAll("input");
		let eleArray = Array.from(inputFeilds);
		let empty_result = Array.from(inputFeilds).filter(ele => {
			let value = ele.value.trim();
			if(value=== "" || value === " ") {
				return ele;
			}
		});
		console.log(empty_result);
		if(empty_result.length > 0) {
			if(empty_result[0].classList.contains("otp-flag")) {
				empty_result = [];
			}
		}
		if(empty_result.length > 0) { 
			for(let i = 0; i < empty_result.length; i++) 
				empty_result[i].classList.add("input--alert");
		} else {
			if(validateEamil(userEmailValue) && validatePassword(pass1Value) && confirmPassword(pass1Value, pass2Value) && emailFlag) {
				wave.classList.remove("wave--overlay__hide");
				console.log("data submitted sucessfully");
				let data = new URLSearchParams({
			        'email': userEmailValue,
			    })
				postDataAsync("/verify-user", data)
				.then(resp => {
					if(resp.status === 200) {
						 wave.classList.add("wave--overlay__hide");
						 console.log("Message from server, it says Hi");
						 serverMsg.innerHTML  = "Otp is sent to you're registed email address"
						 setTimeout(disappearServerMsg, 5000);
						 submitButton.classList.add("hide--expand");
						 otpBox.classList.toggle("hide--expand");
						 otpMsg.innerHTML = "OTP is sent to you're registerd email"
					}
				})
				.catch(err => console.log(err));
			}
		}
		
	});
	
	// otp validaton
	verifyBtn.addEventListener('click', (e) => {
		let otptextBox = document.getElementById("otpTextBox");
		if(otptextBox.value.trim() === "" || otptextBox.value.trim() === " ") {
			otptextBox.classList.add("input--alert");
		} else {
			let data = new URLSearchParams({
		        'email': userEmailValue,
		        'otp' : otptextBox.value.trim(),
		    })
			postDataAsync("/verify-user", data)
			.then(resp => resp.json())
			.then(data => {
				console.log(data.value);
				if(data.value) {
					let datas = new URLSearchParams({
				        'email': userEmailValue,
				        'firstName' : userFirstNameValue,
				        'lastName' : userLastNameValue,
				        'userPass' : pass1Value,
				        'userMob' : userMobNoValue,
				    })
					postDataAsync("/subit-new-account", datas)
					.then(resp => resp.json())
					.then(data =>  {
						console.log("insidet yhe rfgj;dfsjg;ksdjg;klj")
						if(data.value) {
							 location.href = "#popup10";
						}
					})
				}
			})
			.catch(err => console.log(err));
		}
	})
	
	// settimeout function to disappear the message from the screen.
	function disappearServerMsg() {
		serverMsg.innerHTML  = "";
	}
	
	// it remove the red border 
	mainBase.addEventListener('change', (e) => {
		console.log(e.target.value);
		if(e.target.value.trim() !== "") {
			if(e.target.classList.contains("input--alert")) {
				e.target.classList.remove("input--alert")
			}
		}
	})
	
	// password validation events
	userPass1.addEventListener('blur', () => {
		let value = userPass1.value;
		let value2 = userPass2.value;
		validatePassword(value);
		if(value2 !== "") 
			confirmPassword(value, value2);
	})
	
	// confirm password events
	userPass2.addEventListener('blur', () => {
		let value1 = userPass1.value;
		let value2 = userPass2.value;
		confirmPassword(value1, value2);
	})
	
	
	
	// function for password validation check
	function validatePassword(password) {
		let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
		if(strongRegex.test(password)) {
			pswMsg.innerHTML = "";
			return true;
		} else {
			pswMsg.innerHTML = "password must contain at least 8 character, one upper and lower case, a number and speacil charater";
			return false;
		}
	}
	
	// function for confirm password check
	function confirmPassword(value1, value2) {
		if(value1.trim() === value2.trim()){
			pswMsg2.innerHTML = "";
			return true;
		} else {
			pswMsg2.innerHTML = "password does not mathched";
			return false;
		}
	}
	
	// function for email validation
	function validateEamil(email) {
		 let mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		 if(mailformat.test(email))
			 return true;
		 else 
			 return false;
	}
	
	// function to post async data to the server
			async function postDataAsync(url, data) {
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