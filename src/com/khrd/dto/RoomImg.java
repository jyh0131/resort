package com.khrd.dto;

public class RoomImg {
	private int riNo;
	private RoomName roomName;
	private String riFile;

	public RoomImg() {
		super();
	}

	public RoomImg(int riNo, RoomName roomName, String riFile) {
		super();
		this.riNo = riNo;
		this.roomName = roomName;
		this.riFile = riFile;
	}

	public int getRiNo() {
		return riNo;
	}

	public void setRiNo(int riNo) {
		this.riNo = riNo;
	}

	public RoomName getRoomName() {
		return roomName;
	}

	public void setRoomName(RoomName roomName) {
		this.roomName = roomName;
	}

	public String getRiFile() {
		return riFile;
	}

	public void setRiFile(String riFile) {
		this.riFile = riFile;
	}

	@Override
	public String toString() {
		return "RoomImg [riNo=" + riNo + ", roomName=" + roomName + ", riFile=" + riFile + "]";
	}

}
