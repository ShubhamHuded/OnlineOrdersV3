import Form from "./Form.js";
import CustomError from "./CustomError.js";
import Dialoge from "./dialoge.js";
import Hash from "./hash.js";
import AjaxUtil from "./AjaxUtil.js";
import Util from "./Util.js";
import Spin from "./SpinClass.js";


class CreateAccount extends Form {

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
			// first I have to send the otp to the user when it's sucess then open the modal.
			let spinObj = new Spin("spinid");
			spinObj.launch();
   
			AjaxUtil.PostData("/auth/generate-otp", { "email": this.email })
				.then(response => {
					if (response.ok) {
						spinObj.stop();
						let d = new Dialoge({ src: "/auth/otp" })
						Hash.set("dO", d);
						d.showModal();
					}
				})
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
		let termsAndConditionsModal = new Dialoge({ src: "/terms-condition" })
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

