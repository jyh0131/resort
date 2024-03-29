package com.khrd.dto;

public class RoomName {
	private int rnNo;
	private String rnName;
	private RoomType roomType;
	private String rnDetail;
	private int rnPrice;
	private String rnEngName;
	private double ranking;

	public RoomName() {
		super();
	}

	public RoomName(int rnNo, String rnName) {
		super();
		this.rnNo = rnNo;
		this.rnName = rnName;
	}
	
	public RoomName(int rnNo, String rnName, String rnEngName) {
		super();
		this.rnNo = rnNo;
		this.rnName = rnName;
		this.rnEngName = rnEngName;
	}

	public RoomName(int rnNo, String rnName, RoomType roomType, String rnDetail, int rnPrice, String rnEngName) {
		super();
		this.rnNo = rnNo;
		this.rnName = rnName;
		this.roomType = roomType;
		this.rnDetail = rnDetail;
		this.rnPrice = rnPrice;
		this.rnEngName = rnEngName;
	}
	
	public RoomName(int rnNo, String rnName, RoomType roomType, String rnDetail, int rnPrice, String rnEngName,
			double ranking) {
		super();
		this.rnNo = rnNo;
		this.rnName = rnName;
		this.roomType = roomType;
		this.rnDetail = rnDetail;
		this.rnPrice = rnPrice;
		this.rnEngName = rnEngName;
		this.ranking = ranking;
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

	public String getRnEngName() {
		return rnEngName;
	}

	public void setRnEngName(String rnEngName) {
		this.rnEngName = rnEngName;
	}
	
	public double getRanking() {
		return ranking;
	}

	public void setRanking(double ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "RoomName [rnNo=" + rnNo + ", rnName=" + rnName + ", roomType=" + roomType + ", rnDetail=" + rnDetail
				+ ", rnPrice=" + rnPrice + ", rnEngName=" + rnEngName + ", indexNum=" + ranking + "]";
	}

}
