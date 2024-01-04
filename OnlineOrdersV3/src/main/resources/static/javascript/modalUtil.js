import hash from "./hash.js";

let ModalUtil = {

	toggleModal: function(modal) {
		var currentState = modal.style.display;
		// If modal is visible, hide it. Else, display it.
		if (currentState === 'none') {
			modal.style.display = 'block';
			hash.set("isopened", true);
		} else {
			modal.style.display = 'none';
			hash.set("isopened", false);
		}
	},

}

export { ModalUtil };
 
///   