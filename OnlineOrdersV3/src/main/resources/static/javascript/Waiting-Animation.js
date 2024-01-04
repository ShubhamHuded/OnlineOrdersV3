class Waiting extends HTMLElement {
	constructor() {
		super();
	}

	connectedCallback() {
		this.innerHTML = `
	<div class="main-overlay animate-overlay" id="bodyoverlay">
		<section class="body--overlay">
			<span class="loadWords" style="color: #fff; font-weight: 659;">Generating
				OTP... Please Wait</span> <span class="loading__anim"
				style="position: absolute; top: 50%; left: 50%; margin-top: 1rem;"></span>
		</section>
	</div>
		`;
	}
}

customElements.define("waiting-animation", Waiting);