class Modal extends HTMLElement {
	constructor() {
		super();
	}

	static get observedAttributes() {
		return ['width', 'modal-src', 'data-id', 'data-call-fun'];
	}
	connectedCallback() {
		this.innerHTML = `
	<div class="user-modal" style="display: none;">  
      <div class="user-overlay"></div>
     	 <div class="modal_content" style="width:${this.getAttribute(`width`)}px;height:${this.getAttribute(`height`) ? this.getAttribute(`height`): `inherit`}px" data-eve-reg="click,modalEventDelgation">
     	 <div id=${this.getAttribute(`data-id`) ? this.getAttribute(`data-id`) : "modal-content"} data-modal-src = ${this.getAttribute(`data-modal-src`)}></div>
        <button title="Close" class="close_modal" data-eve-reg="click,${this.getAttribute(`data-call-fun`)}" data-modal-view>  
         x
        </button>
      </div>
    </div>
		`;
	}
}


customElements.define("custom-modal", Modal);