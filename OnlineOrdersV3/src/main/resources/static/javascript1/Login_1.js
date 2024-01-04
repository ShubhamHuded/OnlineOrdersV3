import Form from "./Form.js";
import Spin from "./SpinClass.js";
import AjaxUtil from "./AjaxUtil.js";

class Login extends Form {
	constructor(id) {
		super(document.getElementById(id));
	}

	submitForm(e, ele) {
		e.preventDefault();
		let number = super.checkMandatoryFields();
		if (number > 0) return;
		let spinObj = new Spin("spinid");
		spinObj.launch();
		super.submit()
			.then(res => {
				if (res.ok) {
					location.href = "/Online-Orders/home";
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Wrong Credential',
						text: 'either Email or Password is wrong...',
					})
				}
			})
	}

	removeWarning(e, ele) {
		e.preventDefault();
		super.removeWarning(e, ele);
	}

	forgotpassword(e, ele) {
		e.preventDefault();
		Swal.fire({
			title: 'Forgot Password',
			html: '<input type="email" id="email" class="swal-input" placeholder="Enter your email" style="overflow: hidden;">',
			showCancelButton: true,
			confirmButtonText: 'Reset Password',
			preConfirm: () => {
				const email = Swal.getPopup().querySelector('#email').value;
				console.log('User submitted email:', email);
				AjaxUtil.PostData("/Online-Orders/reset-password", { "email": email })
					.then(res => {
						if (res.ok) {
							Swal.fire({
								icon: 'success',
								title: 'Email Sent',
								text: 'We have sent an email with instructions to reset your password.',
							});
						} else {
							Swal.fire({
								icon: 'error',
								title: 'Oops...',
								text: 'Something went wrong!',
							})
						}
					})
			},
		});
	}

	func = {
		submit: this.submitForm,
		removeWarning: this.removeWarning,
		forgotpassword: this.forgotpassword,
	}
}

let l = new Login("mobileEmailLogin");