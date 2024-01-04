
'use strict';

function validatePassword(password) {
	const passwordRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
	if (passwordRegex.test(password)) {
		return true;
	} else {
		return false;
	}
}

function conformBothPassword(value1, value2) {
	if(value1.trim() === value2.trim())
		return true;
	else
		return false;	
}

function validateEamil(email) {
	const mailformat =  new RegExp("/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/");
	if (mailformat.test(email))
		return true;
	else
		return false;
}

export {validatePassword, conformBothPassword, validateEamil}

