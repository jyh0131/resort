package com.khrd.dto;

public class RoomConfiguration {
	private int rcNo; //객실 구성 정보 번호
	private RoomName roomName; //객실 이름에 따른 정보
	private int rcArea; //면적
	private String rcType; //객실 구성 타입
	private int rcTypeCount; //객실 타입에 따른 객실 갯수
	private String rcInterior; //실내구성

	public RoomConfiguration() {
		super();
	}

	public RoomConfiguration(int rcNo, RoomName roomName, int rcArea, String rcType, int rcTypeCount,
			String rcInterior) {
		super();
		this.rcNo = rcNo;
		this.roomName = roomName;
		this.rcArea = rcArea;
		this.rcType = rcType;
		this.rcTypeCount = rcTypeCount;
		this.rcInterior = rcInterior;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	public RoomName getRoomName() {
		return roomName;
	}

	public void setRoomName(RoomName roomName) {
		this.roomName = roomName;
	}

	public int getRcArea() {
		return rcArea;
	}

	public void setRcArea(int rcArea) {
		this.rcArea = rcArea;
	}

	public String getRcType() {
		return rcType;
	}

	public void setRcType(String rcType) {
		this.rcType = rcType;
	}

	public int getRcTypeCount() {
		return rcTypeCount;
	}

	public void setRcTypeCount(int rcTypeCount) {
		this.rcTypeCount = rcTypeCount;
	}

	public String getRcInterior() {
		return rcInterior;
	}

	public void setRcInterior(String rcInterior) {
		this.rcInterior = rcInterior;
	}

	@Override
	public String toString() {
		return "RoomConfiguration [rcNo=" + rcNo + ", roomName=" + roomName + ", rcArea=" + rcArea + ", rcType="
				+ rcType + ", rcTypeCount=" + rcTypeCount + ", rcInterior=" + rcInterior + "]";
	}

}
