import Selector from "./SelectorUtil.js";
import Event from "./EventUtil.js";

/**
This class is use for login and signup purpose

 */

//
//export default class LoginModule {
//	constructor() {
//
//	}
//	
//}



let object = {
	"element": Selector.getById("user-LastName"),
	"eventType" : "dblclick",
	"eventFunctionArgsArray":["prashant"],
	"eventFunction" : function () {
		console.log(`my name is ${object.eventFunctionArgsArray[0]}`)
	}
}

Event.addEventListerByIdElement(object);





import Selector from "./SelectorUtil.js";
import Event from "./EventUtil.js";
import Util from "./Util.js";
import AjaxCall from "./AjaxUtil.js";

/**
This class is use for login and signup purpose

 */
 
 const	enumss = {
		"emailRegex": "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
			+ "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$",
		"mobilRegex": " /^\d{10}$/",
		"GSTRegex": "^([A-Za-z0-9_-]+)*/^\d{13}$/",
		"passwordRegex": "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})",
	}
export default class LoginModule {
	  static  emailRegex = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
			+ "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
	constructor() { }

	/**
	This class is use for login and signup purpose
	
	 */

	
	/**
	This emailValidation method used for email validation 
	 */
	emailValidation(data) {
		if(Util.regexValidator(data, this.emailRegex))
			return true;
		return false;
	}
	
	/**
	This mobileValidation method used for check mobile number 
	 */
	 	mobileValidation(data) {
		if(Util.regexValidator(data, enumss[mobilRegex]))
			return true;
		return false;
	}
	
	/**
	This passwordValidation method used for check password 
	 */
	  	passwordValidation(data) {
		if(Util.regexValidator(data, enumss[passwordRegex]))
			return true;
		return false;
	}
	
	/** This method used for email duplication */
	
     verifydatavalidator(data, url){
	 let ret;
	 console.log("its me");
     AjaxUtil.PostData(data,url)
     .then(data => data.json())
     .then(data => {
	 ret = data;
});
return ret;
}
}

//let loginmodule = new LoginModule();
//
//
//if(loginmodule.emailValidation(Selector.getById("user-email")))
//	conosle.log("correct email")
//else 
//   console.log("wrong email")
 


