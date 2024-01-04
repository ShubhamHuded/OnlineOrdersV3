import Form from "./Form.js";
import Dialoge from "./dialoge.js";
import Util from "./Util.js";
import AjaxUtil from "./AjaxUtil.js";

class UploadCompanyProfile extends Form {
	constructor(id) {
		super(document.getElementById(id));
	}

	addPartnerDetails(e, ele) {
		e.preventDefault();
		let d = new Dialoge({ src: "/Online-Orders/partners-details", width: window.innerWidth * .5 + "px", height: window.innerHeight * .7 + "px", });
		d.showModal();
	}

	editCompanyDetails(e, ele) {
		e.preventDefault();
		super.getArrayofInputElements().forEach(ele => {
			if (ele.hasAttribute("data-editable-once") && ele.value.length > 0) {
				ele.disabled = true;
			} else {
				ele.disabled = false;
			}
		})
	}

	submitData(e, ele) {
		e.preventDefault();
		// sadgfasdf
		let leng = super.checkMandatoryFields();
		if (leng > 0) return;
		super.disableAllInput();
		super.submit()
			.then(response => {
				if (response.ok) {
					Swal.fire({
						icon: 'success',
						title: 'Your work has been saved',
					})
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Oops...',
						text: 'Something went wrong!',
					})
				}
			})
	}

	edit(e, ele) {
		e.preventDefault();
		this.editCompanyDetails(e, ele);
	}

	reload(e, ele) {
		e.preventDefault();
		this.getData();
	}

	getData() {
		fetch("/Online-Orders/submit-company-profile-data")
			.then(response => response.json())
			.then(commits => {
				Util.parseJSONtoInput(commits, uploadDocument)
			})
			.catch(err => console.log(err));
	}

	opendataRow(e, ele) {
		e.preventDefault();
		let row = e.target.closest("tr");
		let cells = Array.from(row.cells);
		alert(cells[0].textContent + " " + cells[1].textContent + " " + cells[2].textContent)
		console.log(cells[0]);
	}

	deletepartner(e, ele) {
		e.preventDefault();
		let trChildren = e.target.closest("tr").children;
		let array = Array.from(trChildren);
		let obj = {
			"pancard": array[4].textContent,
			"email": array[3].textContent,
		}
		AjaxUtil.PostData("/delet-partner-details", obj)
			.then(res => {
				if (res.ok) {
					Swal.fire({
						icon: 'success',
						title: 'Deleted SuccesFully',
					})
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Oops...',
						text: 'Something went wrong!',
					})
				}
			})
	}

	editpartnerNotusingRefrence(e, ele) {
		e.preventDefault();
		let nameArray = ["fname", "lname", "designation", "email", "pancard", "phone"];
		let obj = {};
		let trChildren = e.target.closest("tr").children;
		let array = Array.from(trChildren);

		for (let i = 0; i < array.length - 1; i++) {
			obj[nameArray[i]] = array[i].textContent;
		}

		let jsonObj = JSON.stringify(obj);

		Util.setSessioStorage("partnerDetails", "");
		Util.setSessioStorage("partnerDetails", jsonObj);
		let d = new Dialoge({ src: "/Online-Orders/partners-details", width: window.innerWidth * .5 + "px", height: window.innerHeight * .7 + "px", });
		d.showModal();
	}

	editpartner(e, ele) {
		e.preventDefault();
		let d = new Dialoge({ src: "/Online-Orders/partners-details", width: window.innerWidth * .5 + "px", height: window.innerHeight * .7 + "px", });
		d.showModal();
	}

	func = {
		addpartner: this.addPartnerDetails,
		submit: this.submitData,
		edit: this.edit,
		reload: this.reload,
		opendata: this.opendataRow,
		editpartner: this.editpartner,
		deletepartner: this.deletepartner
	}
}

let uploadDocument = new UploadCompanyProfile("companydetails")

window.addEventListener('load', (event) => {
	uploadDocument.getData();
});