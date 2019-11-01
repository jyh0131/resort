package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.khrd.dto.RoomEquipment;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.JDBCUtil;

public class RoomEquipmentDAO {
private static final RoomEquipmentDAO dao = new RoomEquipmentDAO();
	
	public static RoomEquipmentDAO getInstance() {
		return dao;
	}
	
	private RoomEquipmentDAO() {}
	
	public int insertRoomEquipment(Connection conn, RoomEquipment re) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_equipment values(null,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re.getRoomName().getRnNo());
			pstmt.setString(2, re.getReFurniture());
			pstmt.setString(3, re.getReHomeAppliances());
			pstmt.setString(4, re.getReTableWare());
			pstmt.setString(5, re.getReWash());
			pstmt.setString(6, re.getReBedding());
			pstmt.setString(7, re.getReOther());
			pstmt.setString(8, re.getReAmenity());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public ArrayList<RoomEquipment> selectRoomEquipmentList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_equipment left join room_name using(rn_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomEquipment> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomEquipment re = new RoomEquipment(rs.getInt("re_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
						rs.getString("re_furniture"),
						rs.getString("re_home_appliances"),
						rs.getString("re_tableware"),
						rs.getString("re_wash"),
						rs.getString("re_bedding"),
						rs.getString("re_other"),
						rs.getString("re_amenity"));
				list.add(re);
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
	
	public int deleteRoomEquipment(Connection conn, int reNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_equipment where re_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int updateRoomEquipment(Connection conn, RoomEquipment re) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_equipment set rn_no = ?, re_furniture = ?, re_home_appliances = ?,"
					+ " re_tableware = ?, re_wash = ? re_bedding = ?, re_other = ?, re_amenity = ? where re_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re.getRoomName().getRnNo());
			pstmt.setString(2, re.getReFurniture());
			pstmt.setString(3, re.getReHomeAppliances());
			pstmt.setString(4, re.getReTableWare());
			pstmt.setString(5, re.getReWash());
			pstmt.setString(6, re.getReBedding());
			pstmt.setString(7, re.getReOther());
			pstmt.setString(8, re.getReAmenity());
			pstmt.setInt(9, re.getReNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public RoomEquipment selectRoomEquipmentByNo(Connection conn, int reNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_equipment left join room_name using(rn_no) where re_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomEquipment re = new RoomEquipment(rs.getInt("re_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
						rs.getString("re_furniture"),
						rs.getString("re_home_appliances"),
						rs.getString("re_tableware"),
						rs.getString("re_wash"),
						rs.getString("re_bedding"),
						rs.getString("re_other"),
						rs.getString("re_amenity"));
				return re;
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
