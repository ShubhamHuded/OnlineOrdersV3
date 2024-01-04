import Event from "./Event.js"
import Util from "./Util.js";
import Dialoge from "./dialoge.js";
import Hash from "./hash.js";
import AjaxUtil from "./AjaxUtil.js";

export default class Subuser extends Event {
	modal = null;
	subuserModalForm;
	constructor() {
		super();
	}

	openModal(e) {
		console.log("it's working")
		let otpModal = new Dialoge({ src: "/Online-Orders/add-subuser?subEmail=addnewuser"})
		otpModal.showModal();
	}

	openEditPage(e) {
		e.preventDefault();
		let d = e.target.closest("tr");
		let email = (d.children)[2].textContent;
		let src = "/Online-Orders/add-subuser?subEmail=";
		src += email ? email : "addnewuser";
		let otpModal = new Dialoge({ src: src })
		otpModal.showModal();
	}

	closeModal(e, ele) {
		let c = document.getElementById(e.target.getAttribute("data-ref"));
		c.close();
	}

	subuserWarning() {
		Swal.fire({
			icon: 'error',
			title: 'Access Denied',
			text: 'Profile is Still Not approved',
		})
	}

	deleteSubUser(e, ele) {
		e.preventDefault();
		let d = e.target.closest("tr");
		let email = (d.children)[2].textContent;
		AjaxUtil.PostData("/Online-Orders/delet-subuser", { "email": email })
			.then(res => {
				if (res.ok) {
					d.remove();
					res.text().then(data => {
						Swal.fire({
							icon: 'success',
							title: data,
						})
					})
				} else {
					res.text().then(data => {
						Swal.fire({
							icon: 'error',
							title: data,
						})
					})
				}
			})
	}

	func = {
		openmodal: this.openModal,
		close: this.closeModal,
		openedit: this.openEditPage,
		warningSub: this.subuserWarning,
		delete: this.deleteSubUser,
	}
}

let subUser = new Subuser();

let list = Array.from(document.getElementsByClassName("password-td"));
list.forEach(ele => {
	var passwordText = ele.innerText;
	var maskedText = '*'.repeat(passwordText.length);
	ele.innerText = maskedText;
})



