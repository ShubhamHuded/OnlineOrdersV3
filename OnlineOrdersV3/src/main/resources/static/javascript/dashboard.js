/**
 * 
 */

import Event from "./Event.js";

class DashBoard extends Event {
	#frameId = null;

	constructor() {
		super();
		this.#frameId = document.getElementById("frameid");
	}

	toggle(e, ele) {
		e.preventDefault();
		const a = e.target.closest("li");
		if(a.hasAttribute("data-frame")) {
			this.#frameId.src = a.getAttribute("data-frame");
		}
					  
	}
	func = {
		toggleFrame: this.toggle,
	}
}

let dashBoard = new DashBoard();

