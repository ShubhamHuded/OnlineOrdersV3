import Form from "./Form.js";

class Login extends Form {
	constructor(id) {
		super(document.getElementById(id));
	}
}

let login = new Login();