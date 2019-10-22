package com.khrd.dto;

import java.util.Date;

public class Question {
	private int qNo;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String mId;
	
	public Question() {}
	
	public Question(int qNo, String qTitle, String qContent, Date qDate, String mId) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.mId = mId;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate=" + qDate + ", mId="
				+ mId + "]";
	}
}
