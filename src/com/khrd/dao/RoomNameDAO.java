package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	
	
	
	
	
	
	
	
}
