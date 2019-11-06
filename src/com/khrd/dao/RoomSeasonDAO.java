package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.RoomName;
import com.khrd.dto.RoomSeason;
import com.khrd.jdbc.JDBCUtil;

public class RoomSeasonDAO {
private static final RoomSeasonDAO dao = new RoomSeasonDAO();
	
	public static RoomSeasonDAO getInstance() {
		return dao;
	}
	
	private RoomSeasonDAO() {}
	
	public int insertRoomSeason(Connection conn, RoomSeason rs) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_season values(null,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rs.getRoomName().getRnNo());
			pstmt.setString(2, rs.getRsSeason());
			pstmt.setString(3, rs.getRsDetail());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public ArrayList<RoomSeason> selectRoomSeasonList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_season left join room_name using(rn_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomSeason> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomSeason rs2 = new RoomSeason(rs.getInt("rs_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
									rs.getString("rs_season"),
									rs.getString("rs_detail"));
				list.add(rs2);
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
	
	public int deleteRoomSeason(Connection conn, int rsNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_season where rs_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int deleteRoomSeasonByRnNo(Connection conn, int rnNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_season where rn_no = ?";
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
	
	public int updateRoomSeason(Connection conn, RoomSeason rs) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_season set rn_no = ?, rs_season = ?, rs_detail = ? where rs_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rs.getRoomName().getRnNo());
			pstmt.setString(2, rs.getRsSeason());
			pstmt.setString(3, rs.getRsDetail());
			pstmt.setInt(4, rs.getRsNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public RoomSeason selectRoomSeasonByNo(Connection conn, int rsNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_season left join room_name using(rn_no) where rs_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomSeason rs2 = new RoomSeason(rs.getInt("rs_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
									rs.getString("rs_season"),
									rs.getString("rs_detail"));
				return rs2;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}
	
	public int selectCountRoomSeason(Connection conn) {//페이지 개수를 구하기 위한 전체 게시글 개수를 구하기 위한 메서드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from room_season";
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
	
	public List<RoomSeason> selectRoomSeason(Connection conn,int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from room_season left join room_name using(rn_no) order by rs_no desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<RoomSeason> result = new ArrayList<>();
			while(rs.next()) {
				RoomSeason rs2 = new RoomSeason(rs.getInt("rs_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"), rs.getString("rn_eng_name")),
									rs.getString("rs_season"),
									rs.getString("rs_detail"));
				
				result.add(rs2);
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
