class DIALOGUETEMPLET extends HTMLElement {
	constructor() {
		super();
	}

	connectedCallback() {
		this.innerHTML = `  
<dialog id="dialog">
  <div>
    <p>Registration-successfull</p>
    <p>Now you can login.</p>
  </div>
  <form method="dialog">
    <button value="cancel">Close dialog</button>
  </form>
</dialog> 
    `;
	}

}


customElements.define('dialogue-component', DIALOGUETEMPLET);

