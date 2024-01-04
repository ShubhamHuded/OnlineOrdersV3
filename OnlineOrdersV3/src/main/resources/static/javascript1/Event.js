import CustomError from "./CustomError.js";

export default class Event {
	#eventElements = [];

	constructor() {
		this.scanAndRegisterEvents();
	}


	registerGenericEvent() {

	}

	scanAndRegisterEvents() {
		let elements = document.querySelectorAll("[data-eve-reg]");
		let eleArray = Array.from(elements)
		eleArray.forEach(ele => {
			if (this.#eventElements.includes(ele)) return;
			this.#eventElements.push(ele);
			let [eventNames, fns] = ele.getAttribute("data-eve-reg").split(",");
			let eventArray = eventNames.split(" ");
			let functionArray = fns.split(" ");
			let arrgArray = ele.getAttribute("data-eve-args") ? ele.getAttribute("data-eve-args").split(",") : null;
			console.log(typeof arrgArray);
			for (let i = 0; i < eventArray.length; i++) {
				if (typeof this === undefined) {
					console.log("this is not defined");
					throw new CustomError("this is not there");
				}
				try {
					ele.addEventListener(eventArray[i], e => {
						this.func ? this.func[functionArray[i]].apply(this, arrgArray ? [e, ele].concat(arrgArray[i].split(" ")) : [e, ele]) : ""
					})
				} catch {
					console.log("error while registering event")
				}
			}
		})
	}

}