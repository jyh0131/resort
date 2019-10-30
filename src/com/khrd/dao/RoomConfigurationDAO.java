package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.JDBCUtil;

public class RoomConfigurationDAO {
	private static final RoomConfigurationDAO dao = new RoomConfigurationDAO();
	
	public static RoomConfigurationDAO getInstance() {
		return dao;
	}
	
	private RoomConfigurationDAO() {}
	
	public int insertRoomConfiguration(Connection conn, RoomConfiguration rc) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_configuration values(null,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rc.getRoomName().getRnNo());
			pstmt.setString(2, rc.getRcArea());
			pstmt.setString(3, rc.getRcType());
			pstmt.setInt(4, rc.getRcTypeCount());
			pstmt.setString(5, rc.getRcInterior());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public ArrayList<RoomConfiguration> selectRoomConfigurationList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_configuration left join room_name using(rn_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomConfiguration> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomConfiguration rc = new RoomConfiguration(rs.getInt("rc_no"),
														new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
														rs.getString("rc_area"),
														rs.getString("rc_type"),
														rs.getInt("rc_type_count"),
														rs.getString("rc_interior"));
				list.add(rc);
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
	
	public int deleteRoomConfiguration(Connection conn, int rcNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_configuration where rc_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int updateRoomConfiguration(Connection conn, RoomConfiguration rc) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_configuration set rn_no = ?, rc_area = ?, rc_type = ?, rc_type_count = ?, rc_interior = ? where rc_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rc.getRoomName().getRnNo());
			pstmt.setString(2, rc.getRcArea());
			pstmt.setString(3, rc.getRcType());
			pstmt.setInt(4, rc.getRcTypeCount());
			pstmt.setString(5, rc.getRcInterior());
			pstmt.setInt(6, rc.getRcNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public RoomConfiguration selectRoomConfigurationByNo(Connection conn, int rcNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_configuration left join room_name using(rn_no) where rc_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomConfiguration rc = new RoomConfiguration(rs.getInt("rc_no"),
								new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
								rs.getString("rc_area"),
								rs.getString("rc_type"),
								rs.getInt("rc_type_count"),
								rs.getString("rc_interior"));
				return rc;
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
