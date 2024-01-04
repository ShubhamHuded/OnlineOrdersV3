/** 
 Util class represents a utility methoods to be used in the codebase.
 
 */

export default class Util {

	constructor() {

	}

	/** 
	 This method is for validating the given input based on given regex.
	 @param {string} data, to be validated.
	 @param {string} regex, the regex patten.
	 @returns {boolean} result, result is data compared against the given regex.
	 
	 */
	static regexValidator(data, regex) {
		let sregex = new RegExp(regex);
		if (sregex.test(data))
			return true;
		return false;
	}

	/**
		 This method is to compare the given passwords (password = confirm password)
		 @param {string} password, password entered.
		   @param {string} confirmPassword, confirm password should be equal to the password.
		 @returns {boolean} result, result is the comparision of two passwords.
	 
	 */
	static passwordCompare(password, confirmPassword) {
		if (password.trim() === confirmPassword.trim())
			return true;
		return false;
	}

	/**
		this function cheak mandatory element before submit.
		if there any it add waring sign to those fields and return a length, number of fileds not enterd
		
		@param fields, input arrray elements.
		@returns len, number of empty elements.
	 */
	static checkMandatoryFields(fields = []) {
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
		})

		return filterArr.length;
	}

	/**
	 function to create an url encoded string to send data to the sever.
	 */

	static generateUrlEncodedData(dataObject) {
		let datas = new URLSearchParams(dataObject);
		return datas;
	}

	static removeCssClass(className, elementName) {
		if (elementName.classList.contains(className)) {
			elementName.classList.remove(className)
		}
	}

	/**
	 function used to get the same element,
	 @param elementTypes, type of element, <input type = "text" /> type is text here.
	 @param elements, array of element
	 @returns result, array of same element.
		
	 */
	static getElementBysameType(elementTypes = "", elements = []) {
		let filterdArray = elements.filter(ele => {
			if (ele.type === elementTypes) return ele;
		});

		return filterdArray;
	}

	/**
	this function create url param for form data
	
	 */
	static getUrlParamForFormData(inputElement = []) {
		let obj = {};
		inputElement.forEach(ele => {
			if (ele.type === "checkbox") { 
				if (ele.checked)
					obj[ele.name] = true;
				else
					obj[ele.name] = false;
			} else {
				obj[ele.name] = ele.value;
			}
		})
		return obj;

	}

	static setSessioStorage(key, value) {
		if (typeof (Storage) !== "undefined") {
			sessionStorage.setItem(key, value);
			return true;
		} else
			return false;
	}

	static getSessionStorageData(key) {
		if (sessionStorage.getItem(key) !== null)
			return sessionStorage.getItem(key);
		else
			return null;
	}

	static convertVectorStringToArray(data) {
		let d = data.replaceAll("[", "");
		d = d.replaceAll("]", "");
		let dd = d.split(",");
		let ddd = dd.map(ele => ele.trim());
		return ddd;

	}

	static parseJSONtoInput(jsonObj, table) {
		let inputElemtArray = table.getArrayofInputElements();
		Object.entries(jsonObj).forEach((entry) => {
			const [key, value] = entry;
			if (key === "tableData") Util.parseJSONtoTable(value, table);
			inputElemtArray.forEach(ele => {
				if (ele.name === key) ele.value = value;
			})
		});
	}

	static parseJSONtoTable(jsonObj, table) {
		jsonObj.forEach(ele => {
			table.addRowAtTheEnd("", "", ele);
		})
	}

	static getFormElement(formdID) {
		return formdID.formelements;
	}

}

