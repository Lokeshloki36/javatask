package com.java_task.payload;

import java.util.Date;

public class ErrorDetails {
	
	public ErrorDetails(Date timeStamp, String message, String details) {
		this.timeStamp= timeStamp;
		this.message= message;
		this.details= details;
	}

	private Date timeStamp;
	
	private String message;
	
	private String details;

	public Date getTimeStamp() {
		return timeStamp;
	}

	public String getMessage() {
		return message;
	}

	public String getDetails() {
		return details;
	}
	
	
}
