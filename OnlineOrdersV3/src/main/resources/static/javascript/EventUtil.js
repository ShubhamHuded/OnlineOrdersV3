/**
	// comment 
 */

export default class EventUtil {
	constructor() {

	}

	static addEventListenerToElemById(object) {
		var mouseEventAdded = false;
		console.log(object.id)
		var elem = document.getElementById(object.id);
		elem.addEventListener(object.eventType, function(e) {
			if (mouseEventAdded == false) {
				object.eventFunctionArgsArray.push(e);
				mouseEventAdded = true;
			};
			object.eventFunction.apply(this, object.eventFunctionArgsArray);
		}, false);
	}


	static addEventListenerByclass(object) {
		var mouseEventAdded = false;
		var elementsArrayForClass = document.querySelectorAll(object.className);
		for (i = 0; i < elementsArrayForClass.length; i++) {
			elementsArrayForClass[i].addEventListener(object.eventType, function(e) {
				if (mouseEventAdded == false) {
					object.eventFunctionArgsArray.push(e);
					mouseEventAdded = true;
				};
				object.eventFunction.apply(this, object.eventFunctionArgsArray);
			}, false);
		};
	}


	static addEventListerByIdElement(object) {
		var mouseEventAdded = false;
		object.element.addEventListener(object.eventType, function(e) {
			if (mouseEventAdded == false) {
				object.eventFunctionArgsArray.push(e);
				mouseEventAdded = true;
			};
			object.eventFunction.apply(this, object.eventFunctionArgsArray);
		}, false);
	}
}