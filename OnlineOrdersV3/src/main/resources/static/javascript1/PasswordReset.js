import Ajax from "./AjaxUtil.js";
import Form from "./Form.js";
import Util from "./Util.js";

class PasswordReset extends Form {
	subid = document.getElementById("forgot-submit");
	value;
	constructor(id) {
		super(document.getElementById(id));
	}

	checkpassword(e, ele) {
		e.preventDefault();
		let url = "/Online-Orders/verify-old-pass";
		let pass = e.target.value;
		let data = Util.generateUrlEncodedData({ "oldpass": pass });
		Ajax.PostData(url, data)
			.then(res => {
				if (res.ok) {
					e.target.classList.contains("border-danger") ? e.target.classList.remove("border-danger") : "";
					e.target.classList.toggle("border-success");
					this.subid.disabled = false;
				} else {
					e.target.classList.contains("border-success") ? e.target.classList.remove("border-success") : "";
					e.target.classList.toggle("border-danger");
					this.subid.disabled = true;
				}
			})
	}

	validatepassword(e, ele) {
		e.preventDefault();
		super.validatePassword(e, ele);
	}

	comparepassword(e, ele) {
		e.preventDefault();
	}

	submit(e, ele) {
		e.preventDefault(e, ele);
		super.submit()
			.then(res => {
				if (res.ok) {
					Swal.fire({
						icon: 'success',
						text:  'Passwrord Updated.',
					})
				}
			})
	}

	func = {
		checkpassword: this.checkpassword,
		validatepassword: this.validatepassword,
		comparepassword: this.comparepassword,
		submit: this.submit,
	}
}

let passwordReset = new PasswordReset("passwordReset");