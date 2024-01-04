import Event from "./Event.js";
import AjaxUtil from "./AjaxUtil.js";

class Reports extends Event {
	data;
	constructor() {
		super();
		this.invokeTable();
	}


	invokeTable() {
		var sheets = [{
			sheetName: 'Accepted Orders',
			search: true,
			pagination: 10,
			filters: true,
			columns: [
				{ type: 'text', width: '100px', title: 'Order Type', readOnly: true },
				{ type: 'text', width: '100px', title: 'Amount', readOnly: true},
				{ type: 'text', width: '100px', title: 'Price', readOnly: true },
				{ type: 'text', width: '100px', title: 'Doc-Id', readOnly: true },
				{ type: 'text', width: '100px', title: 'Qty', readOnly: true },
				{ type: 'text', width: '100px', title: 'Price', readOnly: true },
				{ type: 'text', width: '100px', title: 'Subuser', readOnly: true },
				{ type: 'text', width: '100px', title: 'Date', readOnly: true },
			],
			url: "http://localhost:8081/Online-Orders/accepted-orders",
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
								let url = "http://localhost:8081/Online-Orders/admin/users/" + encodeURIComponent(e.target.textContent);
								window.location.href = url;
							}
						},
					];
				} else {
					return [];
				}

			},

		},
		{
			sheetName: 'Pending Orders',
			search: true,
			pagination: 10,
			filters: true,
			columns: [
				{ type: 'text', width: '100px', title: 'No', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Id', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Date', readOnly: true},
				{ type: 'text', width: '100px', title: 'Commodity', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Type', readOnly: true },
				{ type: 'text', width: '100px', title: 'Qty', readOnly: true },
				{ type: 'text', width: '100px', title: 'Price', readOnly: true },
				{ type: 'text', width: '100px', title: 'Subuser', readOnly: true },
				{ type: 'text', width: '100px', title: 'Amount', readOnly: true },	
			],
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
								let url = "http://localhost:8081/Online-Orders/admin/users/" + encodeURIComponent(e.target.textContent);
								window.location.href = url;
							}
						},
					];
				} else {
					return [];
				}

			},

		},
		{
			sheetName: 'Rejected Orders',
			search: true,
			pagination: 10,
			filters: true,
			columns: [
				{ type: 'text', width: '100px', title: 'No', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Id', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Date', readOnly: true, color: "red" },
				{ type: 'text', width: '100px', title: 'Commodity', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Type', readOnly: true },
				{ type: 'text', width: '100px', title: 'Qty', readOnly: true },
				{ type: 'text', width: '100px', title: 'Price', readOnly: true },
				{ type: 'text', width: '100px', title: 'Subuser', readOnly: true },
				{ type: 'text', width: '100px', title: 'Amount', readOnly: true },
			],
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
								let url = "http://localhost:8081/Online-Orders/admin/users/" + encodeURIComponent(e.target.textContent);
								window.location.href = url;
							}
						},
					];
				} else {
					return [];
				}

			},

		},
		{
			sheetName: 'Orders History',
			search: true,
			pagination: 10,
			filters: true,
			columns: [
				{ type: 'text', width: '100px', title: 'No', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Id', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Date', readOnly: true, color: "red" },
				{ type: 'text', width: '100px', title: 'Commodity', readOnly: true },
				{ type: 'text', width: '100px', title: 'Order Type', readOnly: true },
				{ type: 'text', width: '100px', title: 'Qty', readOnly: true },
				{ type: 'text', width: '100px', title: 'Price', readOnly: true },
				{ type: 'text', width: '100px', title: 'Subuser', readOnly: true },
				{ type: 'text', width: '100px', title: 'Amount', readOnly: true },
			],
			url: "http://localhost:8081/Online-Orders/order-history",
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
								let url = "http://localhost:8081/Online-Orders/admin/users/" + encodeURIComponent(e.target.textContent);
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

let report = new Reports();