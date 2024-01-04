import Util from "./Util.js";
import Ajax from "./AjaxUtil.js";
import CreateElement from "./CreateElement.js";
import Event from "./Event.js";
import CustomError from "./CustomError.js";

/**
	all task related to the form done here.
 */

export default class Form extends Event {
	formdata = "";
	arraysOfInputElement = [];
	invalidFormElement = [];
	url = "";
	globeResult = {};

	enumss = {
		"emailRegex": "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
			+ "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$",
		"mobilRegex": "^[6-9]\\d{9}$",
		"GSTRegex": "^([A-Za-z0-9_-]+)*/^\d{13}$/",
		"passwordRegex": "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})",
	}

	/**
		constructor takes formArgs as formData
		@argument formdata
		@throws Exception 

 */
	constructor(formdata) {
		super();
		if (formdata === null || formdata === undefined) throw new CustomError("form data not defined");
		this.formdata = formdata; 
		this.arraysOfInputElement = Array.from(new Set(Object.values(this.formdata.elements)));
		this.setOnChangeEvent(this.arraysOfInputElement);
		this.registerEvent(this.arraysOfInputElement);
		if (!formdata.hasAttribute("action")) throw new CustomError("Form action is mandatory");
		this.url = formdata.action;
	}
	
	getFormData() {
		return this.formdata;
	}

	getArrayofInputElements() {
		return this.arraysOfInputElement;
	}

	getInvalidFormElement() {
		return this.invalidFormElement;
	}

	setInvalidFormElemet() {
		this.invalidFormElement = [];
	}

	compareTwoInput(inputType) {
		let array = Util.getElementBysameType(inputType, this.arraysOfInputElement);
		return array;
	}

	warnInputElement(elements = []) {
		elements.forEach(ele => {
			ele.classList.add("input--alert");
		})
	}

	setOnChangeEvent(inputElement) {
		inputElement.forEach(ele => {
			if (ele.hasAttribute("data-change")) {
				let [isEnabled, fn] = ele.getAttribute("data-change").split(" ");
				ele.addEventListener('change', e => {
					this.func[fn].apply(this, [ele])
				})
			}
		})
	}

	registerEvent(inputElement) {
		inputElement.forEach(ele => {
			if (ele.hasAttribute("data-event")) {
				let [eventNames, fns] = ele.getAttribute("data-event").split(",");
				let eventArray = eventNames.split(" ");
				let functionArray = fns.split(" ");
				for (let i = 0; i < eventArray.length; i++) {
					ele.addEventListener(eventArray[i], e => {
						this.func[functionArray[i]].apply(this, [e, ele])
					})
				}
			}
		})
	}

	checkMandatoryFields() {
		let fields = this.arraysOfInputElement;
		let filterArr = fields.filter(ele => {
			let val = "";
			if (ele.hasAttribute("data-mandatory") && (ele.getAttribute("data-mandatory") === "true")) {
				if (ele.type == "checkbox") {
					val = ele.checked;
					if (!val) return ele;
				}
				val = ele.value.trim();
				if (val == "" || val == " ") return ele;
			}
		})
		filterArr.forEach(ele => {
			ele.classList.add("input--alert");
			this.invalidFormElement.push(ele);
		})

		return filterArr.length;
	}

	emailValidator(value) {
		return Util.regexValidator(value, this.enumss["emailRegex"]);
	}

	emailValidateAndCheckInDataBase(e, ele) {
		this.globeResult["emailFlag"] = false;
		if (this.emailValidator(ele.value)) {
			Ajax.PostData("/Online-Orders/auth/verify-email", { "email": ele.value })
				.then(response => {
					if (response.ok) {
						this.globeResult["emailFlag"] = false;
						CreateElement.createWarningElement("span", "Email already used", "-12%", "1%", ele, "div");
						this.invalidFormElement.push(ele);
						this.warnInputElement([ele]);
					} else {
						this.globeResult["emailFlag"] = true;
					}
				})
		} else {
			this.globeResult["emailFlag"] = false;
			CreateElement.createWarningElement("span", "Invalid Email Format", "c", "1%", ele, "div");
			this.invalidFormElement.push(ele);
			this.warnInputElement([ele]);

		}
		return this.globeResult["emailFlag"];
	}

	mobileNoValidator(mobileNumber) {
		return Util.regexValidator(mobileNumber, this.enumss["mobilRegex"])
	}

	mobileNoCheckInDatabase(e, ele) {
		this.globeResult["mobileFlag"] = false;
		if (this.mobileNoValidator(ele.value)) {
			Ajax.PostData("/Online-Orders/auth/verify-mobile", { "user_mobile": ele.value })
				.then(response => {
					if (response.ok) {
						this.globeResult["mobileFlag"] = false;
						CreateElement.createWarningElement("span", "Mobile Number Already Used", "-12%", "1%", ele, "div");
						this.invalidFormElement.push(ele);
						this.warnInputElement([ele]);
					} else {
						this.globeResult["mobileFlag"] = true;
					}
				})

		} else {
			CreateElement.createWarningElement("span", "Invalid Phone Number Format", "-12%", "1%", ele, "div");
			this.invalidFormElement.push(ele);
			this.warnInputElement([ele]);


		}
		return this.globeResult["mobileFlag"];

	}

	removeWarning(e, ele) {
		let index = this.invalidFormElement.indexOf(ele);
		if (index > -1)  
			this.invalidFormElement.splice(index, 1)
		Util.removeCssClass("input--alert", ele);
		CreateElement.removeElement("span", true, "div", ele);
	}



	//		 mobileNumberValidate(ele) {
	//			if (!Util.regexValidator(ele.value, this.enumss["mobilRegex"])) {
	//				CreateElement.createWarningElement("span", "Write a proper mobile number", "70%", "2%", ele, "div");
	//				this.invalidFormElement.push(ele);
	//				this.warnInputElement([ele]);
	//			}
	//		}



	comparePassswords(e, ele) {
		let flag = false;
		let [pass1, pass2] = document.querySelectorAll("[data-pass]");
		if (pass1.value !== pass2.value) {
			flag = false;
			this.warnInputElement([ele]);
			CreateElement.createWarningElement("span", "password does not match", "-11%", "35%", ele, "div");
		} else flag = true;
		return flag;
	}

	validatePassword(e, ele) {
		let flag = true;
		if (!Util.regexValidator(ele.value, this.enumss["passwordRegex"])) {
			flag = false;
			CreateElement.createWarningElement("span", "password should contain one upper case, small case, extra character and number ", "-11%", "35%", ele, "div");
			this.invalidFormElement.push(ele);
			return flag;
		}
		return flag;
	}

	submit(e) {
		let obj = {};
		this.arraysOfInputElement.forEach(ele => {
			obj[ele.name] = ele.value;
		})
		let data = Util.generateUrlEncodedData(obj)
		return Ajax.PostData(this.url, data);
	}
	
	submitInJSON(e) {
		let obj = {};
		this.arraysOfInputElement.forEach(ele => {
			obj[ele.name] = ele.value;
		})
		let data = Util.generateUrlEncodedData(obj)
		return Ajax.PostDataInJSON(this.url, data )
	}

	getAllInputElementsObject(e) {
		let obj = {};
		this.arraysOfInputElement.forEach(ele => {
			obj[ele.name] = ele.value;
		})
		return obj;
	}
	
	getALLEditableOnceElement(){
		let a = [];
		a = this.arraysOfInputElement.filter(ele => {
			if(ele.hasAttribute("data-editable-once")) return ele;
		})
		return a;
	}
	
	disableAllInput() {
		let list = this.getArrayofInputElements();
		list.forEach(ele => {
			ele.disabled = true;
		})
	}
	
	getRefrence() {
		return this;
	}
}

