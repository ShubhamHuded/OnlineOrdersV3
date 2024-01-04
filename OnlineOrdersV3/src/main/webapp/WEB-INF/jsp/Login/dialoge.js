import CustomError from "./CustomError.js";
import Event from "./Event.js";

export default class Dialoge extends Event {
	dialogSupported = false;
	dialog = null;
	configuration = {
		onLoad: false,
		src: null,
		width: "70%",
		height: "70%",
	};

	constructor(configure = {}) {
		super();
		this.configuration = Object.assign(this.configuration, configure);
		this.init();
	}

	init() {
		// check browser support for dialogu tag
	    this.dialogSupported = typeof HTMLDialogElement === 'function'; 
		if (!this.dialogSupported) {
			alert("update you're brwoser for better compability");
			throw new CustomError("update brwoser for better page working");
		}
		this.dialog = document.createElement('dialog');
		this.dialog.role = 'dialog';
		this.dialog.setAttribute("id", this.configuration.id ? this.configuration.id : new CustomError("update brwoser for better page working"));
		this.dialog.style.width = this.configuration.width;
		this.dialog.style.height = this.configuration.height;
		this.dialog.style.overflow = "clip"; 
		this.dialog.classList.add("make--center")
		this.dialog.classList.add("br--modal")
		this.dialog.innerHTML = `
			 <iframe src=${this.configuration.src} style="width:100%; height: 100%" id = ${this.configuration.src}></iframe>
			 <button class = "modal--close" data-ref=${this.configuration.id} data-eve-reg="click,close">X</button>
		`;
		document.body.appendChild(this.dialog)
		if(this.configuration.onLoad) {
			let d = document.getElementById(this.configuration.id);
			d.showModal();
		}
	}
	
}