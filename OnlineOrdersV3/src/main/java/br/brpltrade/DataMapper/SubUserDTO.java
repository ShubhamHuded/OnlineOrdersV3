package br.brpltrade.DataMapper;

public class SubUserDTO {
	String userFirstName;
	String userLastName;
	String userEmailId;
	String userMobile;
	String userPassword;
	String allowTrading;
	String allowPending;
	String allowSales;
	String tableData;

	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getUserEmailId() {
		return userEmailId;
	}

	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getAllowTrading() {
		return allowTrading;
	}

	public void setAllowTrading(String allowTrading) {
		this.allowTrading = allowTrading;
	}

	public String getAllowPending() {
		return allowPending;
	}

	public void setAllowPending(String allowPending) {
		this.allowPending = allowPending;
	}

	public String getAllowSales() {
		return allowSales;
	}

	public void setAllowSales(String allowSales) {
		this.allowSales = allowSales;
	}

	public String getTableData() {
		return tableData;
	}

	public void setTableData(String tableData) {
		this.tableData = tableData;
	}
}
