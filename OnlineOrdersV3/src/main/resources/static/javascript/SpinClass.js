import { Spinner } from './spin.js';

export default class Spiner {
	#traget;
	#spinnerObj
	constructor(targetId, config = {}) {
		this.#traget = targetId;
		this.opts = Object.assign(this.opts, config);
	}

	opts = {
		lines: 12, // The number of lines to draw
		length: 0, // The length of each line
		width: 13, // The line thickness
		radius: 25, // The radius of the inner circle
		scale: 1, // Scales overall size of the spinner
		corners: 1, // Corner roundness (0..1)
		speed: 0.7, // Rounds per second
		rotate: 56, // The rotation offset
		animation: 'spinner-line-shrink', // The CSS animation name for the lines
		direction: 1, // 1: clockwise, -1: counterclockwise
		color: 'black', // CSS color or array of colors
		fadeColor: 'transparent', // CSS color or array of colors
		top: '50%', // Top position relative to parent
		left: '51%', // Left position relative to parent
		shadow: '10 0 1px transparent', // Box-shadow for the lines
		zIndex: 2000000000, // The z-index (defaults to 2e9)
		className: 'spinner', // The CSS class to assign to the spinner
		position: 'absolute', // Element positioning
	};

	launch() {
		let tar = document.getElementById(this.#traget);
		this.#spinnerObj = new Spinner(this.opts).spin(tar);
	}

	stop() {
		this.#spinnerObj.stop();
	}
}