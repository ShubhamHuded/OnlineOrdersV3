import Form from "./Form.js";
import CustomError from "./CustomError.js";
import Dialoge from "./dialoge.js";
import Hash from "./hash.js";
import AjaxUtil from "./AjaxUtil.js";
import Util from "./Util.js";
import Spin from "./SpinClass.js";



class CreateAccount extends Form {
	url = "/Online-Orders/auth/subit-new-account";
	email;
	constructor(formData) {

		super(formData);
	}

	validateEmailInDataBase(e, ele) {
		this.email = ele.value;
		console.log(this.email);
		this.globeResult["emailFlag"] = this.emailValidateAndCheckInDataBase(e, ele)
	}

	mobileNumberValidate(e, ele) {
		this.globeResult["mobileFlag"] = this.mobileNoCheckInDatabase(e, ele)
	}

	submitForm(e, ele) {
		e.preventDefault();
		let leng = super.checkMandatoryFields();
		if (leng > 0) return;
		if (this.globeResult["emailFlag"] && this.globeResult["mobileFlag"] && this.globeResult["pass1"] && this.globeResult["pass2"]) {
			let obj = super.getAllInputElementsObject();
			Util.setSessioStorage("caie", JSON.stringify(obj));
			// flow change based on who creating the accound Admin or Individual User.
			var selectedFlow = document.querySelector('input[name="data-flow"]:checked');
			if (  selectedFlow == null || selectedFlow.value === "with otp" ) {
				// first I have to send the otp to the user when it's sucess then open the modal.
				let spinObj = new Spin("spinid");
				spinObj.launch();
				AjaxUtil.PostData("/Online-Orders/auth/generate-otp", { "email": this.email })
					.then(response => {
						if (response.ok) {
							spinObj.stop();
							let d = new Dialoge({ src: "/Online-Orders/auth/otp" })
							Hash.set("dO", d);
							d.showModal();
						}
					})
			} else {
				let obj = JSON.parse(Util.getSessionStorageData("caie"));
				AjaxUtil.PostDataInJSON(this.url, obj)
					.then(response => {
						if (response.ok) {
							console.log("submitted successfully")
							response.text().then(data => {
								Swal.fire({
									icon: 'success',
									title: data,
									text: 'Data Submitted Succesfully',
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
		}
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

	closeModal(e, ele) {
		let c = document.getElementById(e.target.getAttribute("data-ref"));
		c.close();
	}

	openTermsAndCondition(e, ele) {
		let termsAndConditionsModal = new Dialoge({ src: "/Online-Orders/terms-condition" })
		termsAndConditionsModal.showModal();
	}

	func = {
		submit: this.submitForm,
		emailValidator: this.validateEmailInDataBase,
		mobileNoValidator: this.mobileNumberValidate,
		removeWarning: this.removeWarnigns,
		validatePassword: this.validatePasswords,
		comparePassswords: this.comparePasssword,
		close: this.closeModal,
		opens: this.openTermsAndCondition,
	}
}


let formData = document.getElementById("registrationform")

let createAccount = new CreateAccount(formData ? formData : new CustomError("form id is not set"));

