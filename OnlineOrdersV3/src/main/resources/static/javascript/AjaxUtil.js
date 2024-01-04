import Util from "./Util.js";

export default class AjaxUtil {
	constructor() {
	}


	/**
	post a data to a server in the x-www-form-urlencoded format.
	 */
	static async PostData(url, data) {
		const response = await fetch(url, {
			method: 'POST',
			mode: 'cors',
			cache: 'no-cache',
			credentials: 'same-origin',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			redirect: 'follow',
			eferrerPolicy: 'no-referrer',
			body: Util.generateUrlEncodedData(data),
		});
		return response;
	}

	/**
		post a data to a server in the jSON format....
		@param url, endpoint.
		@param data, in javascript Object format.
		@returns response, javascript promise.
 	*/
	static async PostDataInJSON(url, data) {
		const response = await fetch(url, {
			method: 'POST',
			mode: 'cors',
			cache: 'no-cache',
			credentials: 'same-origin',
			headers: {
				'Content-Type': 'application/json'
			},
			redirect: 'follow',
			eferrerPolicy: 'no-referrer',
			body: JSON.stringify(data)
		});
		return response;
	}

	/**
	get a data from the server.
	 */
	static async GetData(url) {
		const response = await fetch(url);
		return response;
	}
}


