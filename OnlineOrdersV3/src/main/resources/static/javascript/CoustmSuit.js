import  { jSuites }  from "./jsuit.js";

export default class CoustomSuits {
	modalId;
	
	constructor(modal) {
		this.modalId = 	modal;
	}
	openModal() {
		jSuites.modal(document.getElementById(this.modalId), {
			width: '600px',
			height: '480px',
			closed: true,
		});
	}
}