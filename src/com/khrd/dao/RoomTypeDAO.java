package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.RoomType;
import com.khrd.jdbc.JDBCUtil;

public class RoomTypeDAO {
	private static final RoomTypeDAO dao = new RoomTypeDAO();
	
	public static RoomTypeDAO getInstance() {
		return dao;
	}
	
	private RoomTypeDAO() {}
	
	public int insertRoomType(Connection conn,RoomType rt) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_type values(null,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, rt.getRtName());
			
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
				RoomType rt = new RoomType(rs.getInt("rt_no"), rs.getString("rt_name"));
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
	
	public int deleteRoomType(Connection conn, int rtNo) {
		PreparedStatement pstmt =  null;
		
		try {
			String sql = "delete from room_type where rt_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rtNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public int updateRoomType(Connection conn, RoomType rt) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_type set rt_name = ? where rt_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, rt.getRtName());
			pstmt.setInt(2, rt.getRtNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public int selectCountRoomType(Connection conn) {//페이지 개수를 구하기 위한 전체 게시글 개수를 구하기 위한 메서드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from room_type";
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
	
	public List<RoomType> selectRoomType(Connection conn,int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from room_type order by rt_no desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<RoomType> result = new ArrayList<>();
			while(rs.next()) {
				RoomType rt = new RoomType(rs.getInt("rt_no"),
										rs.getString("rt_name"));
				
				result.add(rt);
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
