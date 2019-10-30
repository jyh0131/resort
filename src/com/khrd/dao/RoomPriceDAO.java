package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomPrice;
import com.khrd.jdbc.JDBCUtil;

public class RoomPriceDAO {
private static final RoomPriceDAO dao = new RoomPriceDAO();
	
	public static RoomPriceDAO getInstance() {
		return dao;
	}
	
	private RoomPriceDAO() {}
	
	public int insertRoomPrice(Connection conn, RoomPrice rp) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_price values(null,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rp.getRoomName().getRnNo());
			pstmt.setString(2, rp.getRpSeason());
			pstmt.setInt(3, rp.getRpBase());
			pstmt.setString(4, rp.getRpDetail());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public ArrayList<RoomPrice> selectRoomPriceList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_price left join room_name using(rn_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomPrice> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomPrice rp = new RoomPrice(rs.getInt("rp_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
									rs.getString("rp_season"),
									rs.getInt("rp_base"),
									rs.getString("rp_detail"));
				list.add(rp);
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
	
	public int deleteRoomPrice(Connection conn, int rpNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_price where rp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rpNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int updateRoomConfiguration(Connection conn, RoomPrice rp) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_price set rn_no = ?, rp_season = ?, rp_base = ?, rp_detail = ? where rp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rp.getRoomName().getRnNo());
			pstmt.setString(2, rp.getRpSeason());
			pstmt.setInt(3, rp.getRpBase());
			pstmt.setString(4, rp.getRpDetail());
			pstmt.setInt(5, rp.getRpNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public RoomPrice selectRoomPriceByNo(Connection conn, int rpNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_price left join room_name using(rn_no) where rp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rpNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomPrice rp = new RoomPrice(rs.getInt("rp_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
									rs.getString("rp_season"),
									rs.getInt("rp_base"),
									rs.getString("rp_detail"));
				return rp;
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
