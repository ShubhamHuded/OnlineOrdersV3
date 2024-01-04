package br.brpltrade.DataMapper;

public class ApiOrderDetailDTO {

	String commodityCode;
	String internalid;
	String ebizId;
	String orderId;
	double rate;
	double quantity;
	double marginUsed;
	String timeStamp;
	String orderStatus;

	public String getCommodityCode() {
		return commodityCode;
	}

	public void setCommodityCode(String commodityCode) {
		this.commodityCode = commodityCode;
	}

	public String getInternalid() {
		return internalid;
	}

	public void setInternalid(String internalid) {
		this.internalid = internalid;
	}

	public String getEbizId() {
		return ebizId;
	}

	public void setEbizId(String ebizId) {
		this.ebizId = ebizId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getMarginUsed() {
		return marginUsed;
	}

	public void setMarginUsed(double marginUsed) {
		this.marginUsed = marginUsed;
	}

	public String getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	String type;

}
