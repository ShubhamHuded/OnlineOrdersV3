import Form from "./Form.js";

export default class NewResetPassword extends Form {
	constructor(formid) {
		super(formid);
	}

	submit(e, ele) {
		e.preventDefault();
		let leng = super.checkMandatoryFields();
		if (leng > 0) return;
		super.submit()
			.then(response => {
				if (response.ok) {
					Swal.fire({
						icon: 'success',
						showCancelButton: true,
						confirmButtonText: 'Login',
						preConfirm: () => {
							window.location.href = "/Online-Orders/app/login";
						},
					});
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Oops...',
						text: 'Something went wrong!',
					})
				}
			})
	}

	removeWarnigns(e, ele) {
		this.removeWarning(e, ele);
	}

	validatePasswords(e, ele) {
		this.globeResult["pass1"] = this.validatePassword(e, ele);
	}

	comparePasssword(e, ele) {
		this.globeResult["pass2"] = this.comparePassswords(e, ele);
	}

	func = {
		submit: this.submit,
		removeWarning: this.removeWarnigns,
		validatePassword: this.validatePasswords,
		comparePassswords: this.comparePasssword,
	}
}


let fomr = document.getElementById("newpassword");
let n = new NewResetPassword(fomr);

const urlParams = new URLSearchParams(window.location.search);
const token = urlParams.get('token');
document.getElementById("token").value = token;
