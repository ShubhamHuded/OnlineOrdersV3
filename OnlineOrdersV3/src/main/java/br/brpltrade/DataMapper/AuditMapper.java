package br.brpltrade.DataMapper;

import java.time.LocalDateTime;

public class AuditMapper {
	String action;
	String details;
	String timeStamp;

	public AuditMapper(String action, String details, String timeStamp) {
		super();
		this.action = action;
		this.details = details;
		this.timeStamp = timeStamp;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}

}
