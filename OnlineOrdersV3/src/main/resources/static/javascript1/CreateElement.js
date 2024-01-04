import Ajax from "./AjaxUtil.js";
import Util from "./Util.js";
import CustomError from "./CustomError.js";
/**
this is an utility method to create a html element.

 */


export default class CreateElement {
	constructor() {

	}

	/**
	function create a simple element with a message,with relative to the appending element 
	 */
	static createWarningElement(elementName, text, x, y, ele, parentName) {
		let element = document.createElement(elementName);
		element.innerText = text;
		element.style.position = "absolute";
		element.style.top = x;
		element.style.left = y;
		element.style.color = "#D60000";
		element.style.fontSize = "10px";
		let div = ele.closest(parentName);
		console.log(div.querySelector(elementName));
		if (div.querySelector(elementName) == null) {
			div.appendChild(element);
			div.style.position = "relative";
		}

	}


	static removeElement(elementName, considerParent, parentName, childElement) {
		if (considerParent) {
			if (childElement != null) {
				let parent = childElement.closest(parentName);
				let removea = parent.querySelector(elementName);
				if (removea != null)
					removea.remove();
			}
		}
	}

	static createDropDownElement(url, key) {
		let data = [];
		if (Util.getSessionStorageData(key) !== null) {
			data = Util.getSessionStorageData(key);
			data = data.split(",")
			console.log(data);
		} else {
			let d = Ajax.GetData(url);
			d.then(k => k.json()) 
				.then(d => {
					data = d
					Util.setSessioStorage(key, data);
				})
		}
		if(data.length === 0)
		createDropDownElement(url, key);
		return CreateElement.createElementSelect(data);
	}

	static createElementSelect(data) {
		let select = document.createElement("SELECT");
		for (let i = 0; i < data.length; i++) { 
			let opt = document.createElement("option");
			opt.innerHTML = data[i];
			opt.value = data[i];
			select.appendChild(opt);
		}
		return select;
	}

	static createInputElemet(type, value, name, id) {
		let input = document.createElement("input");
		input.type = type ? type : "text";
		input.value = value ? value : "";
		input.name = name ? name : "";
		input.id = id ? id : "";
		return input;
	}

}