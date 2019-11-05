package com.khrd.dto;

import java.util.Date;

public class Notice {
	private int nNo; //번호
	private String nTitle; //제목
	private String nContent; //내용
	private String nFile; //첨부파일
	private Date nDate; //작성일
	private int nViews; //조회수
	private String mId; //작성자
	
	public Notice() {}
	
	public Notice(int nNo, String nTitle, String nContent, String nFile, Date nDate, int nViews, String mId) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nFile = nFile;
		this.nDate = nDate;
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

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnFile() {
		return nFile;
	}

	public void setnFile(String nFile) {
		this.nFile = nFile;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
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
		return "\n Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nFile=" + nFile + ", nDate="
				+ nDate + ", nViews=" + nViews + ", mId=" + mId + "]";
	}	
}
