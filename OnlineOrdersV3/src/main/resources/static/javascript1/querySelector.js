

'use strict';
 function selectID(id) {
    return document.getElementById(id);
}

function getValueById(id) {
	return selectID(id).value;
}

function selectQuery(query) {
	return document.querySelectorAll(query);
}

export  {selectID,getValueById,selectQuery}