package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.RoomName;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.JDBCUtil;

public class RoomNameDAO {
	private static final RoomNameDAO dao = new RoomNameDAO();
		
	public static RoomNameDAO getInstance() {
		return dao;
	}
	
	private RoomNameDAO() {}
	
	public int insertRoomName(Connection conn, RoomName rn) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_name values(null,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rn.getRnName());
			pstmt.setInt(2, rn.getRoomType().getRtNo());
			pstmt.setString(3, rn.getRnDetail());
			pstmt.setInt(4, rn.getRnPrice());
			pstmt.setString(5, rn.getRnEngName());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public ArrayList<RoomName> selectRoomNameList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_name left join room_type using(rt_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomName> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomName rn = new RoomName(rs.getInt("rn_no"),
											rs.getString("rn_name"),
											new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
											rs.getString("rn_detail"),
											rs.getInt("rn_price"),
											rs.getString("rn_eng_name"));
				list.add(rn);
			}
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
	}
	
	public int deleteRoomName(Connection conn, int rnNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_name where rn_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int updateRoomName(Connection conn, RoomName rn) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_name set rn_name = ?, rn_detail = ?, rn_price = ?, rn_eng_name = ? where rn_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rn.getRnName());
			pstmt.setString(2, rn.getRnDetail());
			pstmt.setInt(3, rn.getRnPrice());
			pstmt.setString(4, rn.getRnEngName());
			pstmt.setInt(5, rn.getRnNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public RoomName selectRoomNameByNo(Connection conn, int rnNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_name left join room_type using(rt_no) where rn_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomName rn = new RoomName(rs.getInt("rn_no"),
											rs.getString("rn_name"),
											new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
											rs.getString("rn_detail"),
											rs.getInt("rn_price"),
											rs.getString("rn_eng_name"));
				return rn;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}
	
	public List<RoomName> selectRoomNameByRoomType(Connection conn, int rtNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select rn_no, rn_name from room_name where rt_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rtNo);
			rs = pstmt.executeQuery();
			
			List<RoomName> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomName rn = new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"));
				list.add(rn);
				
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}
	
	public ArrayList<RoomName> loadMainRoomInfo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select *, @rowname := @rowname + 1 as ranking from room_type rt left join room_name rn using(rt_no) " + 
					"left join room_img ri using(rn_no) join (select @rowname := 0) r order by ranking"; 
			pstmt = conn.prepareStatement(sql);
			ArrayList<RoomName> list = new ArrayList<>();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RoomName rn = new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
											new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
											rs.getString("rn_detail"), rs.getInt("rn_price"),
											rs.getString("rn_eng_name"), rs.getDouble("ranking"));
				list.add(rn);
			}
			return list;
			
		} catch(Exception e) {
			
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		
		return null;
	}
	
	public int selectCountRoomName(Connection conn) {//페이지 개수를 구하기 위한 전체 게시글 개수를 구하기 위한 메서드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from room_name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public List<RoomName> selectRoomName(Connection conn,int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from room_name left join room_type using(rt_no) order by rn_no desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<RoomName> result = new ArrayList<>();
			while(rs.next()) {
				RoomName rn = new RoomName(rs.getInt("rn_no"),
						rs.getString("rn_name"),
						new RoomType(rs.getInt("rt_no"), rs.getString("rt_name")),
						rs.getString("rn_detail"),
						rs.getInt("rn_price"),
						rs.getString("rn_eng_name"));
				
				result.add(rn);
			}
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}
	
}
