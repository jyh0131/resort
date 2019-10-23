package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.khrd.dto.RoomImg;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.JDBCUtil;

public class RoomImgDAO {
	private static final RoomImgDAO dao = new RoomImgDAO();
	
	public static RoomImgDAO getInstance() {
		return dao;
	}
	
	private RoomImgDAO() {}
	
	public int insertRoomImg(Connection conn, RoomImg ri) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into room_img values(null,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ri.getRoomName().getRnNo());
			pstmt.setString(2, ri.getRiFile());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public ArrayList<RoomImg> selectRoomImgList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_img left join room_name using(rn_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<RoomImg> list = new ArrayList<>();
			
			while(rs.next()) {
				RoomImg ri = new RoomImg(rs.getInt("ri_no"),
										new RoomName(rs.getInt("rn_no"),rs.getString("rn_name")),
										rs.getString("ri_file"));
				list.add(ri);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}