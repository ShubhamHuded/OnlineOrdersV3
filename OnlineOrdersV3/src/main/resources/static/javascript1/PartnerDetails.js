import Form from "./Form.js";
import Util from "./Util.js";

class PartnerDetails extends Form {
	constructor(id) {
		super(document.getElementById(id));
	}

	submit(e, ele) {
		e.preventDefault();
		let status = false;
		super.submit()
			.then(res => {
				if (res.ok) {
					status = true;
				}
				return res.json();
			})
			.then(data => {
				if (status) {
					Swal.fire({
						icon: 'success',
						title: data["message"],
					}).then(result => {
						if (result.isConfirmed) {
							let c = window.frameElement.parentNode;
							window.parent.location.href = "/Online-Orders/create-company-profile";
							c.close();
						}
					})
				} else {
					Swal.fire({
						icon: 'error',
						title: data["msg"],
					}).then(result => {
						if (result.isConfirmed) {
							let c = window.frameElement.parentNode;
							window.parent.location.href = "/Online-Orders/create-company-profile";
							c.close();
						}
					})
				}
			})
			.then()
	}


	callback() {
		if (true) {
			let id = document.getElementById("partnerDetails");
			let data = Util.getSessionStorageData("partnerDetails");
			let obj = null;
			try {
				obj = JSON.parse(data);
			} catch {
				console.log("error while parsing the json data")
			}
			id ? Util.parseJSONtoInput(obj, pd) : "";
		}
	}

	func = {
		submit: this.submit,
	}
}

let pd = new PartnerDetails("partnerDetails");

if (window.location.search !== "?new=true")
	pd.callback();