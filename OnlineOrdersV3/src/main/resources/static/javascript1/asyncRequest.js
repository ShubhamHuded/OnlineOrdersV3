/**
 * 
 */
'use strict';
 async function postData(url, data) {
	const response = await fetch(url, {
		method: 'POST',
		mode: 'cors',
		cache: 'no-cache',
		credentials: 'same-origin',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		redirect: 'follow',
		referrerPolicy: 'no-referrer',
		body: data
	});
	return response;
}

export  {postData}

