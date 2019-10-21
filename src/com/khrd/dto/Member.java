package com.khrd.dto;

import java.util.Date;

public class Member {

	private String mId;
	private String mPassword;
	private String mName;
	private String mPhone;
	private String mEmail;
	private Date mRegdate;
	private int mOut;
	private int mAdmin;
	
	public Member(String id, String password, String name, String number, String email, String date, int out, int admin) {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String mId, String mPassword, String mName, String mPhone, String mEmail, Date mRegdate, int mOut,
			int mAdmin) {
		super();
		this.mId = mId;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mRegdate = mRegdate;
		this.mOut = mOut;
		this.mAdmin = mAdmin;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getmRegdate() {
		return mRegdate;
	}

	public void setmRegdate(Date mRegdate) {
		this.mRegdate = mRegdate;
	}

	public int getmOut() {
		return mOut;
	}

	public void setmOut(int mOut) {
		this.mOut = mOut;
	}

	public int getmAdmin() {
		return mAdmin;
	}

	public void setmAdmin(int mAdmin) {
		this.mAdmin = mAdmin;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName + ", mPhone=" + mPhone
				+ ", mEmail=" + mEmail + ", mRegdate=" + mRegdate + ", mOut=" + mOut + ", mAdmin=" + mAdmin + "]";
	}

	
	
	
}
