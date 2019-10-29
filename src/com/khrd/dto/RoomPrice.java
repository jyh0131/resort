package com.khrd.dto;

public class RoomPrice {
	private int rpNo; //객실 요금 안내 번호
	private RoomName roomName;// 객실 이름에 따른 정보 
	private String rpSeason; //시즌 종류
	private int rpBase; // 기본요금
	private String rpDetail; //시즌 설명

	public RoomPrice() {
		super();
	}

	public RoomPrice(int rpNo, RoomName roomName, String rpSeason, int rpBase, String rpDetail) {
		super();
		this.rpNo = rpNo;
		this.roomName = roomName;
		this.rpSeason = rpSeason;
		this.rpBase = rpBase;
		this.rpDetail = rpDetail;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public RoomName getRoomName() {
		return roomName;
	}

	public void setRoomName(RoomName roomName) {
		this.roomName = roomName;
	}

	public String getRpSeason() {
		return rpSeason;
	}

	public void setRpSeason(String rpSeason) {
		this.rpSeason = rpSeason;
	}

	public int getRpBase() {
		return rpBase;
	}

	public void setRpBase(int rpBase) {
		this.rpBase = rpBase;
	}

	public String getRpDetail() {
		return rpDetail;
	}

	public void setRpDetail(String rpDetail) {
		this.rpDetail = rpDetail;
	}

	@Override
	public String toString() {
		return "RoomPrice [rpNo=" + rpNo + ", roomName=" + roomName + ", rpSeason=" + rpSeason + ", rpBase=" + rpBase
				+ ", rpDetail=" + rpDetail + "]";
	}

}
