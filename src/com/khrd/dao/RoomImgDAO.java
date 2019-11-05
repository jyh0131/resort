package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
										new RoomName(rs.getInt("rn_no"),rs.getString("rn_name"),
												rs.getString("rn_eng_name")),
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
	
	public RoomImg selectRoomImgByNo(Connection conn, int riNo) {
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		try {
			String sql = "select * from room_img left join room_name using(rn_no) where ri_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, riNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomImg ri = new RoomImg(rs.getInt("ri_no"),
									new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
											rs.getString("rn_eng_name")),
									rs.getString("ri_file"));
				return ri;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return null;
	}

	public List<String> selectRoomImgByRnNo(Connection conn, int rnNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select ri_file from room_img where rn_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnNo);
			rs = pstmt.executeQuery();
			
			List<String> list = new ArrayList<>();
			
			while(rs.next()) {
				list.add(rs.getString("ri_file"));
			}
			
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		
		return null;
	}
	
	public int deleteRoomImg(Connection conn, int riNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_img where ri_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, riNo);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int deleteRoomImgByRnNo(Connection conn, int rnNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room_img where rn_no = ?";
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
	
	public int updateRoomImg(Connection conn, RoomImg ri) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room_img set ri_file=? where ri_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ri.getRiFile());
			pstmt.setInt(2, ri.getRiNo());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
	public int selectCountRoomImg(Connection conn) {//페이지 개수를 구하기 위한 전체 게시글 개수를 구하기 위한 메서드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from room_img";
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
	
	public List<RoomImg> selectRoomImg(Connection conn,int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from room_img left join room_name using(rn_no) order by ri_no desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<RoomImg> result = new ArrayList<>();
			while(rs.next()) {
				RoomImg ri = new RoomImg(rs.getInt("ri_no"),
						new RoomName(rs.getInt("rn_no"), rs.getString("rn_name"),
								rs.getString("rn_eng_name")),
						rs.getString("ri_file"));
				
				result.add(ri);
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
