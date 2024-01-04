export default class Timer {
	id;
	constructor(minutes, seconds, id) {
		this.minutes = minutes;
		this.seconds = seconds;
		this.timer = null;
		this.id = id;
	}

	start() {
		this.timer = setInterval(() => {
			console.log(this.minutes + ":" + (this.seconds < 10 ? "0" : "") + this.seconds);
			document.getElementById(this.id).innerText = this.minutes + ":" + (this.seconds < 10 ? "0" : "") + this.seconds;
			if (this.seconds > 0) {
				this.seconds--;
			} else if (this.minutes > 0) {
				this.minutes--;
				this.seconds = 59;
			} else {
				this.stop();
				console.log("Timer has ended!");
			}
		}, 1000);
	}

	stop() {
		clearInterval(this.timer);
		this.timer = null;
	}
}

/*
const timer = new Timer(3, 0);
timer.start();

*/