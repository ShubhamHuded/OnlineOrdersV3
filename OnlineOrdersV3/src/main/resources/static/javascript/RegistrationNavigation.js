class RegiNav extends HTMLElement {
	constructor() {
		super();
	}

	connectedCallback() {
		this.innerHTML = `
			<nav class = "nav--bar" style = "justify-content: none;">
		<div class = "d-flex nav--bar_baseLogin">
			<div class="nav--head"><a href ="http://localhost:8087/">BRPL | Online Trading</a></div>
		</div>
	</nav>
		`;
	}
}

customElements.define("registration-navigation", RegiNav);