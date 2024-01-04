import Form from "./Form.js";
import Util from "./Util.js";
import Ajax from "./AjaxUtil.js";
import CreateElement from "./CreateElement.js";
import FormFormTable from "./FormTable.js";

const formData = document.getElementById("form");
let form;
if (formData != null)
	form = new FormFormTable(formData);



 
// Registraion Form
const registraionForm = document.getElementById("registrationform");
if (registraionForm != null) {
	let formRegistraion = new Form(registraionForm);
	formRegistraion.setInvalidFormElemet();
	registraionForm.addEventListener('submit', (e) => {
		e.preventDefault();
		Util.checkMandatoryFields(formRegistraion.getArrayofInputElements());
		formRegistraion.getInvalidFormElement().forEach(ele => {
			ele.classList.add("input--alert");
		})
		if (formRegistraion.getInvalidFormElement().length == 0) {
			let data = Util.getUrlParamForFormData(formRegistraion.getArrayofInputElements());
			Ajax.PostData("/Online-Orders/subit-new-account", data);
			
		}

	})
}





