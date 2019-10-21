package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.khrd.dto.RoomType;
import com.khrd.jdbc.JDBCUtil;

public class RoomTypeDAO {
	private static final RoomTypeDAO dao = new RoomTypeDAO();
	
	public static RoomTypeDAO getInstance() {
		return dao;
	}
	
	private RoomTypeDAO() {}
	
	public int insertRoomType(Connection conn,RoomType room) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_type values(null,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, room.getRtName());
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	public ArrayList<RoomType> selectRoomTypeList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_type";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomType> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomType rt = new RoomType(rs.getInt("rt_no"), rs.getString("rt_name"));
				list.add(rt);
			}
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		
		return null;
	}

	public RoomType selectRoomTypeByNo(Connection conn, int rtNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_type where rt_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rtNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomType rt = new RoomType(rs.getInt("rtNo"), rs.getString("rtName"));
				return rt;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
