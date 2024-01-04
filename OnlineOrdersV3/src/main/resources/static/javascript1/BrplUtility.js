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
	
	
	
	
	// function for email validation
	function validateEamil(email) {
		 let mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		 if(mailformat.test(email))
			 return true;
		 else 
			 return false;
	}
	

// function for password validation check
	function validatePassword(password) {
		let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
		if(strongRegex.test(password)) {
			pswMsg.innerHTML = "";
			return true;
		} else {
			pswMsg.innerHTML = "Password must contain at least 8 characters, one upper and lower case, a number and a special character";
			return false;
		}
	}
	
	// function for confirm password check
	function confirmPassword(value1, value2) {
		if(value1.trim() === value2.trim()){
			pswMsg2.innerHTML = "";
			return true;
		} else {
			pswMsg2.innerHTML = "Password does not match";
			return false;
		}
	}
	
//// function for phone number validation
	function validateMobileNumber(mobNum) {
		 let mobilenoformat = /^\d{10}$/;
		 if(mobilenoformat.test(mobileno))
			 return true;
else
		return false;
	}
//

	
