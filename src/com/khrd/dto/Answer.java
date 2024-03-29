package com.khrd.dto;

import java.util.Date;

public class Answer {
	private int aNo; //답변 번호
	private String aContent; //답변 내용
	private Date aDate; //등록 날짜
	private int qNo; //질문 번호
	private String mId; //아이디
	
	public Answer() {}
	
	public Answer(int aNo, String aContent, Date aDate, int qNo, String mId) {
		super();
		this.aNo = aNo;
		this.aContent = aContent;
		this.aDate = aDate;
		this.qNo = qNo;
		this.mId = mId;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "\n  Answer [aNo=" + aNo + ", aContent=" + aContent + ", aDate=" + aDate + ", qNo=" + qNo + ", mId=" + mId
				+ "]";
	}	
}
