package com.khrd.dto;

public class RoomSeason {
	private int rsNo; //객실 요금 안내 번호
	private RoomName roomName;// 객실 이름에 따른 정보 
	private String rsSeason; //시즌 종류
	private String rsDetail; //시즌 설명

	public RoomSeason() {
		super();
	}

	public RoomSeason(int rsNo, RoomName roomName, String rsSeason, String rsDetail) {
		super();
		this.rsNo = rsNo;
		this.roomName = roomName;
		this.rsSeason = rsSeason;
		this.rsDetail = rsDetail;
	}

	public int getRsNo() {
		return rsNo;
	}

	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}

	public RoomName getRoomName() {
		return roomName;
	}

	public void setRoomName(RoomName roomName) {
		this.roomName = roomName;
	}

	public String getRsSeason() {
		return rsSeason;
	}

	public void setRsSeason(String rsSeason) {
		this.rsSeason = rsSeason;
	}

	public String getRsDetail() {
		return rsDetail;
	}

	public void setRsDetail(String rsDetail) {
		this.rsDetail = rsDetail;
	}

	@Override
	public String toString() {
		return "RoomSeason [rsNo=" + rsNo + ", roomName=" + roomName + ", rsSeason=" + rsSeason
				+ ", rsDetail=" + rsDetail + "]";
	}

}
