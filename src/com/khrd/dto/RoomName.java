package com.khrd.dto;

public class RoomName {
	private int rnNo;
	private String rnName;
	private RoomType roomType;
	private String rnDetail;
	private int rnPrice;

	public RoomName() {
		super();
	}

	public RoomName(int rnNo, String rnName) {
		super();
		this.rnNo = rnNo;
		this.rnName = rnName;
	}

	public RoomName(int rnNo, String rnName, RoomType roomType, String rnDetail, int rnPrice) {
		super();
		this.rnNo = rnNo;
		this.rnName = rnName;
		this.roomType = roomType;
		this.rnDetail = rnDetail;
		this.rnPrice = rnPrice;
	}

	public int getRnNo() {
		return rnNo;
	}

	public void setRnNo(int rnNo) {
		this.rnNo = rnNo;
	}

	public String getRnName() {
		return rnName;
	}

	public void setRnName(String rnName) {
		this.rnName = rnName;
	}

	public RoomType getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}

	public String getRnDetail() {
		return rnDetail;
	}

	public void setRnDetail(String rnDetail) {
		this.rnDetail = rnDetail;
	}

	public int getRnPrice() {
		return rnPrice;
	}

	public void setRnPrice(int rnPrice) {
		this.rnPrice = rnPrice;
	}

	@Override
	public String toString() {
		return "RoomName [rnNo=" + rnNo + ", rnName=" + rnName + ", roomType=" + roomType + ", rnDetail=" + rnDetail
				+ ", rnPrice=" + rnPrice + "]";
	}

}
