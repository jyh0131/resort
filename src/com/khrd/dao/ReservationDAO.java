package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.JDBCUtil;

public class ReservationDAO {
	private static final ReservationDAO dao = new ReservationDAO();

	public static ReservationDAO getnInstance() {
		return dao;
	}

	private ReservationDAO() {

	}

	// 회원아이디로 예약 조회
	// mId = 회원아이디
	public ArrayList<Reservation> selectReserveById(Connection conn, String mId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id) where m_id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			ArrayList<Reservation> list = new ArrayList<>();
			while (rs.next()) {
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"),
								new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
										new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
										rs.getString("rn_detail"), rs.getInt("rn_price"))));
				list.add(rsv);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}

		return null;
	}

	// 회원 이름으로 예약 조회
	// mName = 회원이름
	public ArrayList<Reservation> selectReserveByName(Connection conn, String mName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id) where m_name=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mName);
			rs = pstmt.executeQuery();
			ArrayList<Reservation> list = new ArrayList<>();
			while (rs.next()) {
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"),
								new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
										new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
										rs.getString("rn_detail"), rs.getInt("rn_price"))));
				list.add(rsv);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}

		return null;
	}

	// 예약번호로 예약 조회
	// rsvNo = 예약번호
	public ArrayList<Reservation> selectReserveByName(Connection conn, int rsvNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id) where rsv_no=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsvNo);
			rs = pstmt.executeQuery();
			ArrayList<Reservation> list = new ArrayList<>();
			while (rs.next()) {
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"),
								new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
										new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
										rs.getString("rn_detail"), rs.getInt("rn_price"))));
				list.add(rsv);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}

		return null;
	}

	// 예약 취소 (취소지만 취소기록을 남겨야 하기 때문에 update문을 이용함)
	// rsvNo = 예약번호
	public int cancelReserve(Connection conn, int rsvNo) {
		PreparedStatement pstmt = null;

		try {
			String sql = "update reservation set rsv_cancel = 1 where rsv_no = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsvNo);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;
	}

	// 예약 등록
	public int addReserve(Connection conn, Reservation rsv, String mId, int rNo) {
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into reservation values(0, ?, ?, ?, ?, ?, 0, ?, ?),";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsv.getRsvCount());
			pstmt.setInt(2, rsv.getRsvPrice());
			pstmt.setTimestamp(3, new Timestamp(rsv.getRsvStartDate().getTime()));
			pstmt.setTimestamp(4, new Timestamp(rsv.getRsvEndDate().getTime()));
			pstmt.setTimestamp(5, new Timestamp(rsv.getRsvPaymentDate().getTime()));
			pstmt.setString(6, mId);
			pstmt.setInt(7, rNo);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;
	}
}
