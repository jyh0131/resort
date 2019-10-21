package com.khrd.dto;

import java.util.Date;

public class Reservation {
	private int rsvNo;
	private int rsvCount;
	private int rsvPrice;
	private Date rsvStartDate;
	private Date rsvEndDate;
	private Date rsvPaymentDate;
	private int rsvCancel;
	// private Member member;
	// private Room room;
	
	public Reservation() {
		
	}
	
	/*public Reservation(int rsvNo, int rsvCount, int rsvPrice, Date rsvStartDate, Date rsvEndDate, Date rsvPaymentDate,
			int rsvCancel, Member member, Room room) {
		super();
		this.rsvNo = rsvNo;
		this.rsvCount = rsvCount;
		this.rsvPrice = rsvPrice;
		this.rsvStartDate = rsvStartDate;
		this.rsvEndDate = rsvEndDate;
		this.rsvPaymentDate = rsvPaymentDate;
		this.rsvCancel = rsvCancel;
		this.member = member;
		this.room = room;
	}*/

	public int getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}

	public int getRsvCount() {
		return rsvCount;
	}

	public void setRsvCount(int rsvCount) {
		this.rsvCount = rsvCount;
	}

	public int getRsvPrice() {
		return rsvPrice;
	}

	public void setRsvPrice(int rsvPrice) {
		this.rsvPrice = rsvPrice;
	}

	public Date getRsvStartDate() {
		return rsvStartDate;
	}

	public void setRsvStartDate(Date rsvStartDate) {
		this.rsvStartDate = rsvStartDate;
	}

	public Date getRsvEndDate() {
		return rsvEndDate;
	}

	public void setRsvEndDate(Date rsvEndDate) {
		this.rsvEndDate = rsvEndDate;
	}

	public Date getRsvPaymentDate() {
		return rsvPaymentDate;
	}

	public void setRsvPaymentDate(Date rsvPaymentDate) {
		this.rsvPaymentDate = rsvPaymentDate;
	}

	public int getRsvCancel() {
		return rsvCancel;
	}

	public void setRsvCancel(int rsvCancel) {
		this.rsvCancel = rsvCancel;
	}

	/*public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Override
	public String toString() {
		return "Reservation [rsvNo=" + rsvNo + ", rsvCount=" + rsvCount + ", rsvPrice=" + rsvPrice + ", rsvStartDate="
				+ rsvStartDate + ", rsvEndDate=" + rsvEndDate + ", rsvPaymentDate=" + rsvPaymentDate + ", rsvCancel="
				+ rsvCancel + "]";
	}*/
	
}
