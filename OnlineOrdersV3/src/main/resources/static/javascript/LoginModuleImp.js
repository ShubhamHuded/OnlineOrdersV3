import Login from "./LoginModule.js";
import Event from "./EventUtil.js";
import Selector from "./SelectorUtil.js";
import Ajax from "./AjaxUtil.js";
import Util from "./Util.js";

let login = new Login();

/**
	we have keep track of all values 
 */

document.addEventListener('change', () => {
	obj[eventFunctionArgsArray] = Selector.getById("user--email").value;
})

let obj = {
	id: "user--email",
	eventType: "blur",
	eventFunctionArgsArray: [Selector.getById("user--email").value],
	eventFunction: check,
}

Event.addEventListenerToElemById(obj);

function check(emails) {
	if (login.emailValidation(emails)) {
		Ajax.postDataWithUrlEncoded("/Online-Orders/verify-email", Util.urlParameterGenerator({"email":emails}))
	} else {
		Ajax.postDataWithUrlEncoded("/Online-Orders/verify-email", Util.urlParameterGenerator({"email":emails}))
	}
}

