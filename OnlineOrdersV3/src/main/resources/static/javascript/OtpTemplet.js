class OTPELEMENT extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    this.innerHTML = `
<div class="otp-page-wrapper" id = "otp--wrapper">
<form class="otp otp-form" autocomplete="off" novalidate >
  <h2 class = "otp-head">Please enter a OTP, Sent to your Email/Phone number</h2>
   <p class = "otp-timing">OTP Is Only Valid For 8 Minutes</p>
    <fieldset class = "otp-fieldset">
    <span id = "otpMsg"></span>
     <div class="userInput" id = "otpsend">
			<input type="text" class = "otp-input" id='ist' maxlength="1" onkeyup="clickEvent(this,'sec')">
			<input type="text" class = "otp-input" id="sec" maxlength="1" onkeyup="clickEvent(this,'third')">
			<input type="text" class = "otp-input" id="third" maxlength="1" onkeyup="clickEvent(this,'fourth')">
			<input type="text" class = "otp-input" id="fourth" maxlength="1">
		</div>
    </fieldset>
  </form>
<a class="havent-received" onclick="resendEmail()">I haven't received a code?</a>
  
  <button class="submitButton" style="padding:0.4em" id="verifyBtnOtp">Submit</button>
</div>
    `;
  }
}

customElements.define('otp-component', OTPELEMENT);
