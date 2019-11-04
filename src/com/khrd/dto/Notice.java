package com.khrd.dto;

import java.util.Date;

public class Notice {
	private int nNo; //번호
	private String nTitle; //제목
	private Date nDate; //작성일
	private String nFile; //첨부파일
	private int nViews; //조회수
	private String mId; //작성자
	
	public Notice() {}
	
	public Notice(int nNo, String nTitle, Date nDate, String nFile, int nViews, String mId) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nDate = nDate;
		this.nFile = nFile;
		this.nViews = nViews;
		this.mId = mId;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public String getnFile() {
		return nFile;
	}

	public void setnFile(String nFile) {
		this.nFile = nFile;
	}

	public int getnViews() {
		return nViews;
	}

	public void setnViews(int nViews) {
		this.nViews = nViews;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "\n Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nDate=" + nDate + ", nFile=" + nFile + ", nViews="
				+ nViews + ", mId=" + mId + "]";
	}	
}
