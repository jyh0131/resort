package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.khrd.dto.Reservation;
import com.khrd.jdbc.JDBCUtil;

public class ReservationDAO {
	private static final ReservationDAO dao = new ReservationDAO();
	
	public static ReservationDAO getnInstance() {
		return dao;
	}
	
	private ReservationDAO() {
		
	}
	
	// 예약 조회
	// rsvNo = 예약번호, mId = 회원아이디
	public Reservation selectReserve(Connection conn, int rsvNo, String mName) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}	
		
		return null;
	}
	
}
