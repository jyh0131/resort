package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

	// 모든 예약 조회
	public ArrayList<Reservation> selectReserve(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id) order by rsv.rsv_no;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Reservation> list = new ArrayList<>();
			while (rs.next()) {
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getString("rsv_name"),
						rs.getString("rsv_phone"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"), new RoomName(rs.getInt("rn_no"),
								rs.getString("rn_name"), new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
								rs.getString("rn_detail"), rs.getInt("rn_price"), rs.getString("rn_eng_name"))));
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
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getString("rsv_name"),
						rs.getString("rsv_phone"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"), new RoomName(rs.getInt("rn_no"),
								rs.getString("rn_name"), new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
								rs.getString("rn_detail"), rs.getInt("rn_price"), rs.getString("rn_eng_name"))));
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

	// 예약자 이름으로 예약 조회
	// Name = 예약자 이름
	public ArrayList<Reservation> selectReserveByName(Connection conn, String Name) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id) where rsv_name=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Name);
			rs = pstmt.executeQuery();
			ArrayList<Reservation> list = new ArrayList<>();
			while (rs.next()) {
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getString("rsv_name"),
						rs.getString("rsv_phone"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"), new RoomName(rs.getInt("rn_no"),
								rs.getString("rn_name"), new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
								rs.getString("rn_detail"), rs.getInt("rn_price"), rs.getString("rn_eng_name"))));
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
	public Reservation selectReserveByNo(Connection conn, int rsvNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id) where rsv_no=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsvNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Reservation rsv = new Reservation(rs.getInt("rsv_no"), rs.getString("rsv_name"),
						rs.getString("rsv_phone"), rs.getInt("rsv_count"), rs.getInt("rsv_price"),
						rs.getTimestamp("rsv_start_date"), rs.getTimestamp("rsv_end_date"),
						rs.getTimestamp("rsv_payment_date"), rs.getInt("rsv_cancel"),

						new Member(rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"),
								rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
								rs.getInt("m_out"), rs.getInt("m_admin")),

						new Room(rs.getInt("r_no"), rs.getInt("r_room"), new RoomName(rs.getInt("rn_no"),
								rs.getString("rn_name"), new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
								rs.getString("rn_detail"), rs.getInt("rn_price"), rs.getString("rn_eng_name"))));
				return rsv;
			}

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
	public int insertReserve(Connection conn, Reservation rsv, String mId, int rNo) {
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into reservation values(0, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsv.getRsvName());
			pstmt.setString(2, rsv.getRsvPhone());
			pstmt.setInt(3, rsv.getRsvCount());
			pstmt.setInt(4, rsv.getRsvPrice());
			pstmt.setTimestamp(5, new Timestamp(rsv.getRsvStartDate().getTime()));
			pstmt.setTimestamp(6, new Timestamp(rsv.getRsvEndDate().getTime()));
			pstmt.setTimestamp(7, new Timestamp(rsv.getRsvPaymentDate().getTime()));
			pstmt.setString(8, mId);
			pstmt.setInt(9, rNo);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;
	}

	// 날짜에 해당되는 예약되지 않은 방의 갯수
	public ArrayList<Reservation> leftRoomCnt(Connection conn, Date start_date, Date end_date) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select rt.rt_name, rt.rt_no, rn.rn_name, rn.rn_no, rn_price, count(r.r_no) - count(rsv.r_no) as cnt "
					+ "from room r left join reservation rsv "
					+ "on (r.r_no = rsv.r_no and rsv.rsv_start_date >= ? and rsv.rsv_end_date <= ?) " 
					+ "left join room_name rn on r.rn_no = rn.rn_no "  
					+ "left join room_type rt on rn.rt_no = rt.rt_no "  
					+ "group by rn.rn_name order by rn_no;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, new Timestamp(start_date.getTime()));
			pstmt.setTimestamp(2, new Timestamp(end_date.getTime()));
			ArrayList<Reservation> list = new ArrayList<>();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				RoomType rt = new RoomType();
				rt.setRtNo(rs.getInt("rt_no"));
				rt.setRtName(rs.getString("rt_name"));				
				
				RoomName rn = new RoomName();
				rn.setRnNo(rs.getInt("rn_no"));
				rn.setRnName(rs.getString("rn_name"));
				rn.setRnPrice(rs.getInt("rn_price"));
				rn.setRoomType(rt);
				
				Room r = new Room();
				r.setRoomName(rn);
				
				Reservation rsv = new Reservation();
				rsv.setCnt(rs.getInt("cnt"));
				rsv.setRoom(r);
				
				list.add(rsv);
			}
			return list;			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
			JDBCUtil.close(rs);
		}
		
		return null;
	}
	
	// 예약 변경
		public int updateReserve(Connection conn, Reservation rsv) {
			PreparedStatement pstmt = null;

			try {
				String sql = "update room_type rt join room_name rn using(rt_no) join room r using (rn_no) join reservation rsv using(r_no) join member m using(m_id)"
						+ " set rsv.rsv_name = ?, rsv.rsv_phone = ?, rsv.rsv_start_date = ?, rsv.rsv_end_date = ?, rsv.rsv_count = ?, rsv.rsv_price = ?, rsv.rsv_cancel = ?"
						+ " where rsv.rsv_no = ?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rsv.getRsvName());
				pstmt.setString(2, rsv.getRsvPhone());
				pstmt.setTimestamp(3, new Timestamp(rsv.getRsvStartDate().getTime()));
				pstmt.setTimestamp(4, new Timestamp(rsv.getRsvEndDate().getTime()));
				pstmt.setInt(5, rsv.getRsvCount());
				pstmt.setInt(6, rsv.getRsvPrice());
				pstmt.setInt(7, rsv.getRsvCancel());
				pstmt.setInt(8, rsv.getRsvNo());
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt);
			}
			System.out.println("예약 수정 실패");
			return -1;
		}
	
	// 예약 등록을 위한 빈방의 가장 첫번째 인덱스 가져오기
		public int findrNo(Connection conn, int rt_no, int rn_no, Date start_date, Date end_date) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select r.r_no from room r left join room_name rn using(rn_no) " + 
							"left join room_type rt using(rt_no) " + 
							"left join reservation rsv " + 
							"on (rsv.r_no = r.r_no and rsv_start_date >= ? and rsv_end_date <= ?) " + 
							"where rn.rn_no = ? and rt.rt_no = ? and rsv_no is null order by r.r_no;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setTimestamp(1, new Timestamp(start_date.getTime()));
				pstmt.setTimestamp(2, new Timestamp(end_date.getTime()));
				pstmt.setInt(3, rn_no);
				pstmt.setInt(4, rt_no);
				
				int rNo = -1;
				System.out.println("하기 전");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					rNo = rs.getInt("r_no");
				}
				System.out.println("한 후" + rNo);
				return rNo;
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt);
				JDBCUtil.close(rs);
			}
			return -1;
		}
		
	// Member m_id를 통해 Member 정보 가져오기
		public Member MemberInfo(Connection conn, String m_id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select * from member where m_id = ?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					Member m = new Member();
					m.setmName(rs.getString("m_name"));
					m.setmPhone(rs.getString("m_phone"));
					return m;
				}				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt);
				JDBCUtil.close(rs);
			}
			
			return null;
		}
		
	// 관리자 여부 알아오기
		public int isAdmin(Connection conn, String m_id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select m_admin from member where m_id = ?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int result = rs.getInt("m_admin");
					return result;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt);
				JDBCUtil.close(rs);
			}
			
			return -1;
		}

	//예약된 날짜, 가격, 객실 이름 리스트 가져오기(월별 매출 그래프용)
		public List<Reservation> selectSalesInfo(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select rsv_payment_date, rsv_price, room.* from reservation left join room using(r_no)";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				List<Reservation> list = new ArrayList<>();
				
				while(rs.next()) {
					Reservation reservation = new Reservation(rs.getInt("rsv_price"), rs.getTimestamp("rsv_payment_date"),
							new Room(rs.getInt("r_no"), rs.getInt("r_room"),
									new RoomName(rs.getInt("rn_no"), null)));
					list.add(reservation);
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
}
