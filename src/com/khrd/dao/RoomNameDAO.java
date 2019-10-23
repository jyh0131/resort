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
			String sql = "insert into room_name values(null,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rn.getRnName());
			pstmt.setInt(2, rn.getRoomType().getRtNo());
			pstmt.setString(3, rn.getRnDetail());
			pstmt.setInt(4, rn.getRnPrice());
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
											rs.getInt("rn_price"));
				list.add(rn);
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
}