package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Room;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.JDBCUtil;

public class RoomDAO {
	private static final RoomDAO dao = new RoomDAO();
	
	public static RoomDAO getInstance() {
		return dao;
	}
	
	private RoomDAO() {}
	
	public int insertRoom(Connection conn,Room room) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room values(null,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room.getrRoom());
			pstmt.setInt(2, room.getRoomName().getRnNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public ArrayList<Room> selectRoomList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room left join room_name using(rn_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Room> list = new ArrayList<>();
			
			while(rs.next()) {
				Room r = new Room(rs.getInt("r_no"),
									rs.getInt("r_room"),
									new RoomName(rs.getInt("rn_no"),rs.getString("rn_name"),
											rs.getString("rn_eng_name")));
				list.add(r);
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		
		
		return null;
	}
	
	public Room selectRoomByNo(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room left join room_name using(rn_no) where r_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Room r = new Room(rs.getInt("r_no"),
									rs.getInt("r_room"),
									new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
											rs.getString("rn_eng_name")));
				return r;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return null;
	}
	
	public int deleteRoom(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room where r_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int deleteRoomByRnNo(Connection conn, int rnNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room where rn_no = ?";
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
	
	public int updateRoom(Connection conn, Room r) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room set r_room = ?,rn_no = ? where r_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getrRoom());
			pstmt.setInt(2, r.getRoomName().getRnNo());
			pstmt.setInt(3, r.getrNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public int selectCountRoom(Connection conn) {//페이지 개수를 구하기 위한 전체 게시글 개수를 구하기 위한 메서드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from room";
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
	
	public List<Room> selectRoom(Connection conn,int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from room left join room_name using(rn_no) order by r_no desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Room> result = new ArrayList<>();
			while(rs.next()) {
				Room r = new Room(rs.getInt("r_no"),
						rs.getInt("r_room"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
								rs.getString("rn_eng_name")));
				
				result.add(r);
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
