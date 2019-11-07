package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Notice;
import com.khrd.jdbc.JDBCUtil;

public class NoticeDAO {
	private static final NoticeDAO dao = new NoticeDAO();
	
	private NoticeDAO() {}
	
	public static NoticeDAO getInstance() {
		return dao;
	}
	
	public List<Notice> selectListNotice(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Notice> list = new ArrayList<>();
			while (rs.next()) {
				Notice notice = new Notice(
									rs.getInt("n_no"),
									rs.getString("n_title"),
									rs.getString("n_content"),
									rs.getString("n_File"), 
									rs.getDate("n_date"),
									rs.getInt("n_views"),
									rs.getInt("n_check"),
									rs.getString("m_id"));
				list.add(notice);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectListNotice
	
	public Notice selectNoticeByNNo(Connection conn, int nNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from notice where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Notice notice = new Notice(
									rs.getInt("n_no"),
									rs.getString("n_title"),
									rs.getString("n_content"),
									rs.getString("n_File"), 
									rs.getDate("n_date"),
									rs.getInt("n_views"),
									rs.getInt("n_check"),
									rs.getString("m_id"));

				return notice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectNoticeByNNo
	
	public int selectNoticeNCheck(Connection conn, int nNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select n_check from notice where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				return rs.getInt("n_check");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//selectNoticeNCheck
	
	/* 페이지을 위한 전체 행의 개수 */
	public int selectCountNotice(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from notice";
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
	}//selectCountNotice
	
	/* 페이징을 위한 n_no 내림차순 정렬, 단 n_check의 값이 1인 행들을 가장 위로 정렬*/
	public List<Notice> selectDescListNotice(Connection conn, int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from notice order by n_check=0, n_no desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Notice> list = new ArrayList<>();
			while (rs.next()) {
				Notice notice = new Notice(
									rs.getInt("n_no"),
									rs.getString("n_title"),
									rs.getString("n_content"),
									rs.getString("n_File"), 
									rs.getDate("n_date"),
									rs.getInt("n_views"),
									rs.getInt("n_check"),
									rs.getString("m_id"));
				
				list.add(notice);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectDescListNotice
	
	public int insertNotice(Connection conn, Notice notice){
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into notice values(null, ?, ?, ?, now(), 0, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getnTitle());
			pstmt.setString(2, notice.getnContent());
			pstmt.setString(3, notice.getnFile());
			pstmt.setInt(4, notice.getnCheck());
			pstmt.setString(5, notice.getmId());
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//insertNotice
	
	public int updateNotice(Connection conn, Notice notice){
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update notice set n_title=?, n_content=?, n_file=?, n_check=? where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getnTitle());
			pstmt.setString(2, notice.getnContent());
			pstmt.setString(3, notice.getnFile());
			pstmt.setInt(4, notice.getnCheck());
			pstmt.setInt(5, notice.getnNo());
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateNotice

	/* 첨부파일 삭제 */
	public int updateNoticeFile(Connection conn, int nNo){
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update notice set n_file=null where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateNoticeFile
	
	/* 조회 수 증가 */
	public int updateNoticeViews(Connection conn, int nNo){
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update notice set n_views = n_views + 1 where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateNoticeViews
	
	/* 공지 등록 및 해제 */
	public int updateNoticeCheck(Connection conn, int nCheck, int nNo){
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update notice set n_check=? where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nCheck);
			pstmt.setInt(2, nNo);
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateNoticeCheck
	
	public int deleteNotice(Connection conn, int nNo){
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from notice where n_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//deleteNotice
	
	
	
	
	
	
	
	
	
	
	
	
	
}
