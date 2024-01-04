/**
SelectorUtil Class represents a utility methods to be used in the DOM based on 
Id,Class,Attributes,Name,Inputs.

 */

export default class SelectorUtil {
	constructor() {

	}
	
	/**
	This method return a Node Element based on given Id 
	@param {string} id, a unique Id of node Elment.
	@retun {Element} Element, a node Element in DOM.
	*/
	 static getById(id) {
		return document.getElementById(id);
	}
	
	
	
	/**
	This method returns an array-like object based on given classname 
	@param {String} name, A String representing the class name.
		
	@retun {array} array, A live HTMLCollection of found element.
	*/
	static getByClassName(name) {
		let resu = document.getElementByClassName(name);
		return  Array.from(resu);
	}
	
	/**
	This method returns a static NodeList based on given group of Selector
	@param {String} selector, A String representing the queryselector.
		
	@retun {query} query, A non-live NodeList containing one Element.
	*/
	static getByqureySelector(query) {
		return document.querySelectorAll(query);
	}

}