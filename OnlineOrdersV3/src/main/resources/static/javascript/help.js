/**
 * 
 */
import Form from "./Form.js";

class Help extends Form {

	submit(e, ele) {
		e.preventDefault();
		super.submit()
			.then(res => {
				if (res.ok) {
					Swal.fire({
						icon: 'success',
						title: 'Your query is updated, will reach you in a short time',
					})
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Something went wrong',
						text: 'sorry for inconvinece, try after sometimes',
					})
				}
			})
	}
	func = {
		submit: this.submit,
	}
}

let formdata = document.getElementById("help");
let help = new Help(formdata);