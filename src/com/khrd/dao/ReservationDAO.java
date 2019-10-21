package com.khrd.dao;

public class ReservationDAO {
	private static final ReservationDAO dao = new ReservationDAO();
	
	public static ReservationDAO getnInstance() {
		return dao;
	}
	
	private ReservationDAO() {
		
	}
	
	// 예약 조회
	
}
