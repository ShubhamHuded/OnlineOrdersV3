
export default catchChangeEvent = function(object, property, value) {
	document.addEventListener("change", (e) => {
		object[property] = value;
	})
}