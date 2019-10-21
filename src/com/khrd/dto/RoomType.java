package com.khrd.dto;

public class RoomType {
	private int rtNo;
	private String rtName;

	public RoomType() {
		super();
	}

	public RoomType(int rtNo, String rtName) {
		super();
		this.rtNo = rtNo;
		this.rtName = rtName;
	}

	public int getRtNo() {
		return rtNo;
	}

	public void setRtNo(int rtNo) {
		this.rtNo = rtNo;
	}

	public String getRtName() {
		return rtName;
	}

	public void setRtName(String rtName) {
		this.rtName = rtName;
	}

	@Override
	public String toString() {
		return "RoomType [rtNo=" + rtNo + ", rtName=" + rtName + "]";
	}

}
