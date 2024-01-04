import Util from "./Util.js";
import Ajax from "./AjaxUtil.js";
import Form from "./Form.js";
import Hash from "./hash.js";
import Timer from "./Timer.js";

class CreateAccountOfOtp extends Form {
	url = "/Online-Orders/auth/subit-new-account";
	constructor(formdata) {
		super(formdata);
	}

	submitData() {
		let obj = JSON.parse(Util.getSessionStorageData("caie"));
		Ajax.PostDataInJSON(this.url, obj)
			.then(response => {
				if (response.ok) {
					console.log("submitted successfully")
					response.text().then(data => {
						Swal.fire({
							icon: 'success',
							title: data,
							text: 'page is located to the login page',
						}).then(result => {
							if (result.isConfirmed) {
								let c = window.frameElement.parentNode;
								window.parent.location.href = "/Online-Orders/app/login";
								c.close();
							}
						})
					})
				} else {
					response.text().then(errorMessage => {
						Swal.fire({
							icon: 'error',
							text: errorMessage,
						})
					});
				}
			})
	}

	submitForm(e, ele) {
		e.preventDefault();
		console.log("inside the submit function otp verification");
		let d = super.getAllInputElementsObject();
		let otp = "";
		for (let key in d) {
			if (d.hasOwnProperty(key) && key.length > 0)
				otp += d[key];
		}
		let obj = JSON.parse(Util.getSessionStorageData("caie"));
		console.log(obj["userEmailId"]);
		this.sendOtp(otp, obj["userEmailId"])
			.then(res => {
				if (res.ok) {
					this.submitData();
				} else {
					if (res.status === 400) {
						Swal.fire({
							icon: 'error',
							text: 'otp was wrong',
						})
					} else {
						Swal.fire({
							icon: 'error',
							text: 'internal server error',
						})
					}
				}
			})
	}

	sendOtp(otp, email) {
		let d = Util.generateUrlEncodedData({ "otp": otp, "email": email });
		return Ajax.PostData("/Online-Orders/auth/verifyOtp", d);
	}

	enableButton() {
		let btn = document.getElementById('resendOtp');
		setTimeout(function() {
			btn.disabled = false;
		}, 3 * 60 * 1000);
	}

	resendotp(e, ele) {
		let obj = JSON.parse(Util.getSessionStorageData("caie"));
		let email = obj["userEmailId"];
		Ajax.PostData("/Online-Orders/auth/generate-otp", { "email": email })
			.then(response => {
				if (response.ok) {
					let btn = document.getElementById('resendOtp');
					response.text().then(data => {
						Swal.fire({
							icon: 'success',
							text: data,
						})
						btn.disabled = true;
						let timer = new Timer(3, 0, "countdowntimer");
						timer.start();
						this.enableButton();
					})
				} else {
					Swal.fire({
						icon: 'error',
						text: 'Something wrong try after some time',
					})
				}
			})
	}

	func = {
		submit: this.submitForm,
		resendotp: this.resendotp,
	}
}

let formData = document.getElementById("otpform")
let acc = new CreateAccountOfOtp(formData);


window.onload = function() {
	let timer = new Timer(3, 0, "countdowntimer");
	timer.start();
	acc.enableButton();
}