package com.khrd.dto;

import java.util.Date;

public class Question {
	private int qNo; //질문 번호
	private String qTitle; //질문 제목
	private String qType; //질문 유형
	private String qContent; //질문 내용
	private String qFile; //첨부파일
	private Date qDate; //등록 날짜
	private String mId; //아이디
	private int qTypeCnt; //유형별 질문 개수
	
	public Question() {}
	
	public Question(String qType, int qTypeCnt) {
		super();
		this.qType = qType;
		this.qTypeCnt = qTypeCnt;
	}

	public Question(int qNo, String qTitle, String qType, String qContent, String qFile, Date qDate, String mId) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qType = qType;
		this.qContent = qContent;
		this.qFile = qFile;
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

	public String getqType() {
		return qType;
	}

	public void setqType(String qType) {
		this.qType = qType;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqFile() {
		return qFile;
	}

	public void setqFile(String qFile) {
		this.qFile = qFile;
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

	public int getqTypeCnt() {
		return qTypeCnt;
	}

	public void setqTypeCnt(int qTypeCnt) {
		this.qTypeCnt = qTypeCnt;
	}

	@Override
	public String toString() {
		return "\n Question [qNo=" + qNo + ", qTitle=" + qTitle + ", qType=" + qType + ", qContent=" + qContent
				+ ", qFile=" + qFile + ", qDate=" + qDate + ", mId=" + mId + ", qTypeCnt=" + qTypeCnt + "]";
	}	
}
