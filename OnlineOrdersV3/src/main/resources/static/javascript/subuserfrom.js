import FormTable from "./FormTable.js";
import Util from "./Util.js";
import CreateElement from "./CreateElement.js";
import Ajax from "./AjaxUtil.js";
import Spin from "./SpinClass.js";

export default class SubuserForm extends FormTable {
	#formData;
	constructor(formdata) {
		super(formdata);
		this.#formData = formdata;
		this.defaultDisableInput();
	}

	validateEmailInDataBase(e, ele) {
		this.email = ele.value;
		if (Util.regexValidator(this.email, this.enumss["emailRegex"])) {
			Ajax.PostData("/Online-Orders/auth/verify-email", { "email": ele.value })
				.then(response => {
					if (response.ok) {
						this.globeResult["emailFlag"] = false;
						Swal.fire({
							text: "there is already an account associated with this email",
						})
					} else {
						this.globeResult["emailFlag"] = true;
					}
				})
		} else {
			this.globeResult["emailFlag"] = false;
			Swal.fire({
				text: "invalid email format",
			})
		}
	}

	mobileNumberValidate(e, ele) {
		if (Util.regexValidator(ele.value, this.enumss["mobilRegex"])) {
			Ajax.PostData("/Online-Orders/auth/verify-mobile", { "email": ele.value })
				.then(response => {
					if (response.ok) {
						this.globeResult["mobileFlag"] = false;
						Swal.fire({
							text: "there is already an account associated with this mobile",
						})
					} else {
						this.globeResult["mobileFlag"] = true;
					}
				})
		} else {
			this.globeResult["mobileFlag"] = false;
			Swal.fire({
				text: "invalid mobile format",
			})
		}
	}

	subuserFroms(e, ele) {
		console.log(e);
		e.preventDefault();
		let label = e.target.getAttribute("data-label");
		if (label === "row-add") {
			super.addRowAtTheEnd(e);
		} else if (label === "editOrDelet") {
			super.editRow(e);
		} else if (label === "submit") {
			super.submit(e);
		}
	}

	addNewRow(e) {
		e.preventDefault();
		super.addRowAtTheEnd(e);
	}

	defaultDisableInput() {
		let count = 0;
		Object.values(this.#formData).forEach(ele => {
			if (ele.hasAttribute("data-check"))
				count++;
			ele.disabled = true;
		})
		if (count == 3) {
			this.globeResult["emailFlag"] = true;
			this.globeResult["mobileFlag"] = true;
			this.globeResult["password"] = true;
		}
	}

	submitData(e) {
		e.preventDefault();
		let leng = super.checkMandatoryFields();
		if (leng > 0) return;
		this.#formData
		let spinObj = new Spin("spinid");
		if (this.globeResult["emailFlag"] && this.globeResult["mobileFlag"] && this.globeResult["password"]) {
			spinObj.launch();
			Object.values(this.#formData).forEach(ele => {
				ele.disabled = true;
			})
			super.submit(e)
				.then(response => {
					spinObj.stop();
					if (response.ok) {
						Swal.fire({
							icon: 'success',
							title: "you're data is submited successfully",
						})
					} else {
						Swal.fire({
							icon: 'error',
							title: "some internal error, try after some time",
						})
					}
				})
		} else {
			Swal.fire({
				icon: 'error',
				title: "some data is not according to the requirements",
			})
		}
	}

	closeModal(e, ele) {
		let c = document.getElementById(e.target.getAttribute("data-ref"));
		c.close();
	}

	callback() {
		if (true) {
			let id = document.getElementById("subForm");
			let data = Util.getSessionStorageData("tableData");
			let obj = null;
			try {
				obj = JSON.parse(data);
			} catch {
				console.log("error while parsing the json data")
			}
			id ? Util.parseJSONtoInput(obj, subUser) : "";
			Object.values(id).forEach(ele => {
				ele.disabled = true;
			})
		}
	}

	editForm() {
		Object.values(this.#formData).forEach(ele => {
			if((ele.id === "userEmailId" && ele.value.length > 0) || (ele.id === "userPassword" && ele.value.length > 0)) return;
				ele.disabled = false;
		})
		let table = Array.from(document.getElementById("subTable").children)[1];
		let trs = Array.from(table.children);
		trs.forEach(tr => {
			let tds = Array.from(tr.children);
			for (let i = 0; i <= 2; i++) {
				if (i == 0) {
					let _name = "currency";
					let select = CreateElement.createDropDownElement("/Online-Orders/get" + _name, _name);
					select.value = tds[i].textContent;
					tds[i].textContent = "";
					tds[i].appendChild(select);
				} else {
					let input = CreateElement.createInputElemet("text", tds[i].textContent);
					tds[i].textContent = "";
					tds[i].appendChild(input);
				}
			}
		})
	}

	validatePassword(e, ele) {
		e.preventDefault();
		if (!Util.regexValidator(ele.value, this.enumss["passwordRegex"])) {
			this.globeResult["password"] = false;
			Swal.fire({
				text: "Password should have at least 8 chacrater, One Capital and One Extra Character",
			})
		} else {
			this.globeResult["password"] = true;
		}
	}

	removeWarnigns(e, ele) {
		this.removeWarning(e, ele);
	}

	handleRowDelet(e, ele) {
		super.handleRowDelet(e);
	}

	func = {
		addRow: this.addNewRow,
		submit: this.submitData,
		close: this.closeModal,
		editForm: this.editForm,
		emailValidator: this.validateEmailInDataBase,
		mobileNoValidator: this.mobileNumberValidate,
		validatePassword: this.validatePassword,
		removeWarning: this.removeWarnigns,
		handleRowDelet: this.handleRowDelet,
	}
}

let subUser = null;
let id = document.getElementById("subForm");
if (id != null) subUser = new SubuserForm(id);

if (window.location.search !== "?new=true")
	subUser.callback();


