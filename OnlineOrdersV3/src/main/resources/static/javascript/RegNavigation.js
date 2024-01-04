class REGNAVIGATION extends HTMLElement {
	constructor() {
		super();
	}

	connectedCallback() {
		this.innerHTML = `
		
  `;
	}
}

customElements.define('navigation-bar', REGNAVIGATION);