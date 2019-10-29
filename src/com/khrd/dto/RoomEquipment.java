package com.khrd.dto;

public class RoomEquipment {
	private int reNo; // 비품구성 번호
	private RoomName roomName; //객실 정보
	private String reFurniture; //가구류
	private String reHomeAppliances; //가전류
	private String reTableWare; //식기류
	private String reWash; //세면류 
	private String reBedding; //침구류
	private String reOther; // 기타
	private String reAmenity; //어메니티 (호텔정용)

	public RoomEquipment() {
		super();
	}

	public RoomEquipment(int reNo, RoomName roomName, String reFurniture, String reHomeAppliances, String reTableWare,
			String reWash, String reBedding, String reOther, String reAmenity) {
		super();
		this.reNo = reNo;
		this.roomName = roomName;
		this.reFurniture = reFurniture;
		this.reHomeAppliances = reHomeAppliances;
		this.reTableWare = reTableWare;
		this.reWash = reWash;
		this.reBedding = reBedding;
		this.reOther = reOther;
		this.reAmenity = reAmenity;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public RoomName getRoomName() {
		return roomName;
	}

	public void setRoomName(RoomName roomName) {
		this.roomName = roomName;
	}

	public String getReFurniture() {
		return reFurniture;
	}

	public void setReFurniture(String reFurniture) {
		this.reFurniture = reFurniture;
	}

	public String getReHomeAppliances() {
		return reHomeAppliances;
	}

	public void setReHomeAppliances(String reHomeAppliances) {
		this.reHomeAppliances = reHomeAppliances;
	}

	public String getReTableWare() {
		return reTableWare;
	}

	public void setReTableWare(String reTableWare) {
		this.reTableWare = reTableWare;
	}

	public String getReWash() {
		return reWash;
	}

	public void setReWash(String reWash) {
		this.reWash = reWash;
	}

	public String getReBedding() {
		return reBedding;
	}

	public void setReBedding(String reBedding) {
		this.reBedding = reBedding;
	}

	public String getReOther() {
		return reOther;
	}

	public void setReOther(String reOther) {
		this.reOther = reOther;
	}

	public String getReAmenity() {
		return reAmenity;
	}

	public void setReAmenity(String reAmenity) {
		this.reAmenity = reAmenity;
	}

	@Override
	public String toString() {
		return "RoomEquipment [reNo=" + reNo + ", roomName=" + roomName + ", reFurniture=" + reFurniture
				+ ", reHomeAppliances=" + reHomeAppliances + ", reTableWare=" + reTableWare + ", reWash=" + reWash
				+ ", reBedding=" + reBedding + ", reOther=" + reOther + ", reAmenity=" + reAmenity + "]";
	}

}
