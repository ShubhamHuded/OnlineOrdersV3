import Event from "./Event.js";
import AjaxUtil from "./AjaxUtil.js";

class UserPanel extends Event {
	data;
	constructor() {
		super();
		this.invokeTable();
	}

	toggleModal(e, ele) {
		e.preventDefault();
		this.openModal(e);
	}

	openModal(e) {
		let urlLocation
		if (e.target.hasAttribute("data-url")) {
			urlLocation = e.target.getAttribute("data-url");
		}
		let mainBoday = document.getElementById('modal');
		let modal = jSuites.modal(document.getElementById('modal'), {
			url: urlLocation,
			width: '800px',
			height: '480px',
			onopen: function() {
				var script = document.createElement('script');
				script.type = 'module';
				script.src = "http://localhost:8081/Online-Orders/javascript/CreateAccount.js";
				mainBoday.appendChild(script);
			}

		}).open();
	}

	loadExternalScript(url, body) {
		var script = document.createElement('script');
		script.type = 'module';
		script.src = url;
		body.appendChild(script);
	}


	invokeTable() {
		var sheets = [{
			sheetName: 'User',
			search: true,
			pagination: 10,
			filters: true,
			columns: [
				{ type: 'text', width: '200px', title: 'First Name', readOnly: true },
				{ type: 'text', width: '200px', title: 'Last Name', readOnly: true },
				{ type: 'text', width: '200px', title: 'Email', readOnly: true, color: "red" },
				{ type: 'text', width: '200px', title: 'Mobile Number', readOnly: true },
				{ type: 'text', width: '200px', title: 'Role', readOnly: true },
			],
			url: '../admin/users',
			toolbar: [
				{
					type: 'i',
					content: 'filter_alt_off',
					onclick: function() {
						table.resetFilters();
					}
				},
				{
					type: 'i',
					content: 'file_upload',
					onclick: function() {
						table.download();
					}
				},
			],
			contextMenu: function(el, x, y, e) {
				if (x == 2) {
					return [
						{
							title: 'View Details',
							onclick: function() {
								let url = "http://localhost:8081/Online-Orders/admin/users/"+encodeURIComponent(e.target.textContent);
								window.location.href = url;
							}
						},
					];
				} else {
					return [];
				}

			},

		}
		];
		let table = jspreadsheet.tabs(document.getElementById('spreadsheet'), sheets);
	}



	func = {
		toggleModal: this.toggleModal,
	}
}

let user = new UserPanel();