import CustomError from "./CustomError.js";
import Event from "./Event.js";

export default class Dialoge extends Event {
	dialogSupported = false;
	dialog = null;
	configuration = {
		id: null,
		onLoad: false,
		src: null,
		width: window.innerWidth * .7+"px",
		height: window.innerHeight * .7 + "px",
		msg: "",
	};

	constructor(configure = {}) {
		super();
		this.configuration = Object.assign(this.configuration, configure);
		this.init();
		this.registerEvent();
	}

	init() {
		// check browser support for dialogu tag  
	    this.dialogSupported = typeof HTMLDialogElement === 'function'; 
		if (!this.dialogSupported) {
			alert("update you're brwoser for better compability");
			throw new CustomError("update brwoser for better page working");
		}
		let ids = (Math.round(Date.now())).toString(36);
		this.configuration['id'] = ids;
		this.dialog = document.createElement('dialog');
		this.dialog.role = 'dialog';
		this.dialog.setAttribute("id",  this.configuration.id);
		this.dialog.style.width = this.configuration.width;
		this.dialog.style.height = this.configuration.height;
		this.dialog.style.overflow = "clip"; 
		this.dialog.classList.add("make--center")
		this.dialog.classList.add("br--modal")
		this.dialog.innerHTML = `
			 <iframe src=${this.configuration.src} style="width:100%; height: 100%"></iframe>
			 <button class = "modal--close" data-ref=${this.configuration.id} data-eve-reg="click,close">X</button>
		`;
		document.body.appendChild(this.dialog)
		if(this.configuration.onLoad) {
			let d = document.getElementById(this.configuration.id);
			d.showModal();
		}
	}
	
	showModal() {
		let d = document.getElementById(this.configuration.id);
		d.showModal();
	}
	
	closeModal() {
		let c = document.getElementById(this.configuration.id);
		c.close();
	}
	
	getModalId() {
		return this.configuration.id;
	}
	
	registerEvent() {
		document.getElementById(this.getModalId()).addEventListener('click', e=>{  
			this.closeModal();
		})
	}
	
}