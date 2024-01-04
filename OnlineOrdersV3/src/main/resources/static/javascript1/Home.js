import Event from "./Event.js";
import { ModalUtil } from "./modalUtil.js";
import AjaxUtil from "./AjaxUtil.js";
import CreateElement from "./CreateElement.js";
import GlobalState from "./globalService.js";
import Dialoge from "./dialoge.js";
import Hash from "./hash.js";

export default class HomePageTable extends Event {
	modal;
	constructor() {
		super();
	}


	rowClicked(e, ele) {
		e.preventDefault();
		let isAllowed = e.target.hasAttribute("data-modal-view") ? true : false;
		let _type = e.target.getAttribute("data-user");
		if (_type === "Admin") {
			Swal.fire({
				icon: 'error',
				title: 'Permission Denied',
				text: 'Admins are not allowed to Order',
				// footer: '<a href="">Why do I have this issue?</a>'
			})
		} else {
			this.modal = document.querySelector('.type--modal .user-modal');
			let modalContent = document.getElementById("modal-content");
			let src = modalContent.getAttribute("data-modal-src");
			AjaxUtil.PostData(src, { "type": e.target.getAttribute("data-type") })
				.then(data => data.json())
				.then(data => {
					if (data.length === 0) {
						Swal.fire({
							icon: 'error',
							title: 'Permission Denied',
							text: "it's not possible to order on this commodity right now",
						})
					} else {
						GlobalState.setPropertyValue("commid", e.target.getAttribute("data-type"));
						GlobalState.setPropertyValue("type", e.target.getAttribute("data-trade-type"));
						GlobalState.setPropertyValue("buyrate", e.target.textContent);
						let f = e.target.classList.contains("close_modal");
						if (f) {
							ModalUtil.toggleModal(this.modal);
							return;
						}
						let select = CreateElement.createElementSelect(data);
						let btn = CreateElement.createInputElemet("button", "select", "select", "typeID");
						btn.setAttribute("data-eve-reg", "click,openModal");
						btn.classList.add("company--profile__btn");
						btn.setAttribute("data-modal-view", "");
						select.classList.add("type--select")
						if (modalContent.hasChildNodes()) {
							modalContent.removeChild(modalContent.children[0]);
						}
						modalContent.innerHTML = "Select Type";
						modalContent.append(select);
						modalContent.append(btn);
						ModalUtil.toggleModal(this.modal);
					}
				});
		}
	}


	openTradingModal(e, ele) {
		if (e.target.type === 'button') {
			let selectedValue = "";
			let childNodes = e.target.parentNode.children;
			for (let sib of childNodes) {
				if (sib.tagName === "SELECT") {
					selectedValue = sib.value;
					console.log(e.target);
					GlobalState.setPropertyValue("select-type", selectedValue)
					ModalUtil.toggleModal(this.modal);
					this.modal = document.querySelector('.trading > .modal');
					let commodity = GlobalState.getPropertyByName("commid");
					let rate = GlobalState.getPropertyByName("buyrate");
					let type = GlobalState.getPropertyByName("type");
					AjaxUtil.PostData("/trading-status", { "commid": commodity })
						.then(response => {
							if (response.ok) {
								window.open("/openTradingWindow?commid=" + commodity + "&buyrate=" + rate + "&type=" + type + "&selectType=" + selectedValue + "&BooRepAll=0&oper=1&sview=1&detailview=1", "trading-view", "menubar=0,scrollbars=1,resizable=0,width=800,height=600,left=1000,top=0")
							} else {
								response.text()
									.then(data => {
										Swal.fire({
											icon: 'error',
											title: 'Something went wrong',
											text: data,
										})
									})
							}
						})
				}
			}
		}
	}

	openModaled(e, ele) {
		e.preventDefault();
		console.log(e.target);
		GlobalState.setPropertyValue("commid", e.target.getAttribute("data-type"));
		GlobalState.setPropertyValue("type", e.target.getAttribute("data-trade-type"));
		GlobalState.setPropertyValue("buyrate", e.target.textContent);
		let f = e.target.classList.contains("close_modal");
		if (f) {
			ModalUtil.toggleModal(this.modal);
			return;
		}
		let isAllowed = e.target.hasAttribute("data-modal-view") ? true : false;
		if (isAllowed) {
			this.modal = document.querySelector('.type--modal .modal');
			let modalContent = document.getElementById("modal-content");
			let src = modalContent.getAttribute("data-modal-src");
			AjaxUtil.PostData(src, { "type": e.target.getAttribute("data-type") })
				.then(data => data.json())
				.then(data => {
					let d = data[e.target.getAttribute("data-type")];
					console.log(CreateElement.createElementSelect(d))
					let select = CreateElement.createElementSelect(d);
					let btn = CreateElement.createInputElemet("button", "select", "select", "typeID");
					btn.setAttribute("data-eve-reg", "click,openModal");
					btn.classList.add("company--profile__btn");
					btn.setAttribute("data-modal-view", "");
					select.classList.add("type--select")
					if (modalContent.hasChildNodes()) {
						modalContent.removeChild(modalContent.children[0]);
					}
					modalContent.innerHTML = "Select Type";
					modalContent.append(select);
					modalContent.append(btn);
				});
			ModalUtil.toggleModal(this.modal);
		}
	}



	change(e, ele) {
		console.log(e);
		ele.style.color = "red";
	}

	focus() {
		console.log("jhkufgewr")
	}

	openOrder(e, ele) {
		e.preventDefault();
		let openOrder = new Dialoge({ src: "/get-order-details" })
		openOrder.showModal();
	}

	pendOrder(e, ele) {
		e.preventDefault();
		let pendingOrder = new Dialoge({ src: "/get-pending-details" })
		pendingOrder.showModal();

	}

	close(e) {
		e.preventDefault();
		let d = document.getElementById(e.target.getAttribute("data-ref"));
		d.close();
	}

	apiorderdeatils(e) {
		e.preventDefault();
		let apiorderdeatils = new Dialoge({ src: "/api/apiorderdeatils", width: "70%" })
		apiorderdeatils.showModal();
	}

	func = {
		rowClick: this.rowClicked,
		modalEventDelgation: this.openTradingModal,
		openModal: this.openModaled,
		openOrder: this.openOrder,
		pendOrder: this.pendOrder,
		apiorderdeatils: this.apiorderdeatils,
		close: this.close,
	}

}






