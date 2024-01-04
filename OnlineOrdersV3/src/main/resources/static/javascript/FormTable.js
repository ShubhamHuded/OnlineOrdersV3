import Form from "./Form.js";
import CreateElement from "./CreateElement.js";
import CustomError from "./CustomError.js";
import Util from "./Util.js";
import Ajax from "./AjaxUtil.js";

export default class FormTable extends Form {
	formData;
	tableElment;
	rowChildren = [];
	deletData = {};
	constructor(formData) {
		super(formData);
		if (formData != null) {
			this.tableElment = formData.querySelector("table[data-form-table]");
			this.formdata = formData;
		}
	}

	addRowAtTheEnd(e, ele, value = {}) {
		e ? e.preventDefault() : "";
		let tableBody = this.tableElment.querySelector("[data-table-body]");
		let newRow = this.tableElment.insertRow(-1);
		let colType = [];
		let thead = Object.values(this.tableElment.children)[0];
		let tr = Object.values(thead.children);
		let cells = tr[0].cells;
		let children = [];
		for (let i = 0; i < cells.length; i++) {
			let arr = [];
			cells[i].getAttribute("data-col-name") ? arr.push(cells[i].getAttribute("data-col-name")) : (function() { throw new CustomError("colum name is requied") })();
			cells[i].getAttribute("data-col-type") ? arr.push(cells[i].getAttribute("data-col-type")) : (function() { throw new CustomError("colum type is requied") })();
			cells[i].getAttribute("data-col-child") ? arr.push(cells[i].getAttribute("data-col-child").split(" ")) : arr.push(1);
			colType.push(arr);
		}
		for (let i = 0; i < colType.length; i++) {
			let arr = colType[i];
			let _type = arr[1].toLowerCase(), _name = arr[0], _child = arr[2];
			if (_type === "select") {
				let select = CreateElement.createDropDownElement("/Online-Orders/get" + _name, _name);
				if (value[_name])
					select.value = value[_name];
				children.push(select);
				newRow.insertCell().appendChild(select);
			}
			if (_type === "input") {
				let inpu;
				let newTd = newRow.insertCell();
				let isChild = arr[2] === 1 ? false : true;
				if (isChild) {
					for (let j = 0; j < _child.length; j++) {
						inpu = CreateElement.createInputElemet("text");
						if (value[_name])
							inpu.value = value[_name];
						newTd.appendChild(inpu);
						children.push(inpu);
					}
				} else {
					inpu = CreateElement.createInputElemet(_type);
					if (value[_name])
						inpu.value = value[_name];
					newTd.appendChild(inpu);
					children.push(inpu);
				}
				newRow.appendChild(newTd);
			}
			if (_type === "button") {
				let input;
				let newTd = newRow.insertCell();
				let isChild = arr[2] === 1 ? false : true;
				if (isChild) {
					for (let j = 0; j < _child.length; j++) {
						input = CreateElement.createInputElemet("button", _child[j]);
						input.setAttribute("data-label", "editOrDelet")
						this.#deleteRow(input);
						newTd.appendChild(input);
						children.push(input);
					}
				} else {
					input = CreateElement.createInputElemet(_type, _type,);
					input.setAttribute("data-label", "editOrDelet")
					newTd.appendChild(input)
					children.push(input);
				}
				newRow.appendChild(newTd);
			}

		}
		this.rowChildren.push(children);
		tableBody.appendChild(newRow);
		if (Object.entries(value).length !== 0) {
			let arr = this.rowChildren;
			this.disableInputfeilds(arr);
		}
	}

	editRow(e) {
		if (e.target.type.toLowerCase() === "button" && e.target.value.toLowerCase() === "delete") {
			let tr = e.target.closest("tr");
			let cur = this.deletData["deletCurrecny"] === undefined ? tr.querySelector("select").value : this.deletData["deletCurrecny"] + "." + tr.querySelector("select").value;
			this.deletData["deletCurrecny"] = cur;
			console.log(this.deletData["deletCurrecny"]);
			let index = tr.rowIndex;
			this.rowChildren.splice(index - 1, 1)
			tr.remove();
			let arr = this.rowChildren;
			this.disableInputfeilds(arr);
		}

		if (e.target.type.toLowerCase() === "button" && e.target.value.toLowerCase() === "edit") {
			let tr = e.target.closest("tr");
			let index = tr.rowIndex;
			console.log(this.rowChildren)
			this.enableInput(this.rowChildren[--index])
		}

	}

	getTableHead() {
		return document.querySelectorAll("[data-table-head]");
	}

	getForm() {
		return this.formdata;
	}

	submit(e) {
		e.preventDefault();
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-success',
				cancelButton: 'btn btn-danger'
			},
			buttonsStyling: false
		})
		let arr = this.rowChildren;
		this.disableInputfeilds(arr);
		let url = this.formdata.action;
		this.data = Util.getUrlParamForFormData(this.getArrayofInputElements());
		this.data['tableData'] = JSON.stringify(this.tableDataContructor());
		this.data['deletCurrecny'] = (this.deletData['deletCurrecny']);
		console.log(this.data);
		return Ajax.PostData("/Online-Orders/subuser-profile-data", this.data)
	}

	func = {
		addRow: this.addRowAtTheEnd,
		editRow: this.editRow,
		submit: this.submit,
	}

	disableInputfeilds(arr) {
		for (let i = 0; i < arr.length; i++) {
			if (i % 2 == 0) {
				let a = arr[i];
				a.forEach(ele => {
					if (ele.type === "button") return;
					ele.classList.add("submitbtnspan");
					ele.style.backgroundColor = "#ECE9E9";
				})
			} else {
				let a = arr[i];
				a.forEach(ele => {
					if (ele.type === "button") return;
					ele.classList.add("submitbtnspan");
					ele.style.backgroundColor = "#cccaca";
				})
			}
		}

	}

	enableInput(arr) {
		for (let i = 0; i < arr.length; i++) {
			let a = arr;
			a.forEach(ele => {
				if (ele.type === "button") return;
				ele.classList.remove("submitbtnspan");
				ele.style.backgroundColor = "#fff";
				ele.style.border = "none";
			})
		}
	}

	clearRowChildren() {
		this.rowChildren = [];
	}

	tableDataContructor() {
		let tableLength = this.tableElment.rows.length;
		let tableDatas = [];
		for (let i = 1; i < tableLength; i++) {
			let childreanArray = Object.values(this.tableElment.rows[i].children);
			console.log(typeof childreanArray)
			let row = []
			for (let j = 0; j < childreanArray.length; j++) {
				if ((childreanArray[j].children)[0].type !== "button") {
					row[j] = Object.values(childreanArray[j].children)[0].value;
				}
			}
			tableDatas[i - 1] = row;
		}
		console.log(tableDatas);
		return tableDatas;
	}

	functionbeforeClose() {
		this.clearRowChildren();
		this.getForm().reset();
		let collection = Object.values(this.getForm().querySelector("[data-table-body]").children);
		collection.forEach(ele => {
			ele.remove();
		})
		this.deletData["deletCurrecny"] = undefined;
	}

	handleRowDelet(e) {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-success',
				cancelButton: 'btn btn-danger'
			},
			buttonsStyling: false
		})
		let tr = e.target.closest("tr");
		let commodity = Array.from(tr.firstChild.nextSibling.children)[0].value;
		// let data = JSON.parse(Util.getSessionStorageData("tableData"));
		//	let indTemObj = data.tableData.findIndex((obj) => {
		//		return obj.currency == commodity
		//	})
		//	delete data.tableData[indTemObj];
		swalWithBootstrapButtons.fire({
			title: 'Are you sure?',
			text: "You won't be able to revert this!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: 'Yes, delete it!',
			cancelButtonText: 'No, cancel!',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				Ajax.PostData("/Online-Orders/delete-row", { "email": document.getElementById("userEmailId").value, "commidity": commodity })
					.then(response => {
						if (response.ok) {
							// Util.setSessioStorage("tableData", JSON.stringify(data));
							//		ans = true;
							tr.remove();
							swalWithBootstrapButtons.fire(
								'Deleted!',
								'Data has been deleted.',
								'success'
							)
						} else {
							//ans = false;
							swalWithBootstrapButtons.fire(
								'Cancelled',
								'Some internal Error, Your Data is safe.',
								'error'
							)
						}
					})
			} else if (result.dismiss === Swal.DismissReason.cancel) {
				swalWithBootstrapButtons.fire(
					'Cancelled',
					'Your Data is safe.',
					'error'
				)
			}
		})

	}

	editText(e, ele) {
		let tableCell = e.target;
		var txt = tableCell.innerText || tableCell.textContent;
		tableCell.innerText = tableCell.textContent = "";
		var input = document.createElement("input");
		input.type = "text";
		tableCell.appendChild(input);
		input.value = txt;
		input.focus();
		input.onblur = function() {
			tableCell.innerText = input.value;
			tableCell.textContent = input.value;
		}
	}


	#deleteRow(element) {
		element.addEventListener('click', this.handleRowDelet);
	}
}