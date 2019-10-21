package com.khrd.dto;

public class Room {
	private int rNo;
	private int rRoom;
	private RoomName roomName;

	public Room() {
		super();
	}

	public Room(int rNo, int rRoom, RoomName roomName) {
		super();
		this.rNo = rNo;
		this.rRoom = rRoom;
		this.roomName = roomName;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getrRoom() {
		return rRoom;
	}

	public void setrRoom(int rRoom) {
		this.rRoom = rRoom;
	}

	public RoomName getRoomName() {
		return roomName;
	}

	public void setRoomName(RoomName roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "Room [rNo=" + rNo + ", rRoom=" + rRoom + ", roomName=" + roomName + "]";
	}

}
