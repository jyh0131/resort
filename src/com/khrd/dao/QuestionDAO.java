package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Question;
import com.khrd.jdbc.JDBCUtil;

public class QuestionDAO {
	private static final QuestionDAO dao = new QuestionDAO();
	
	private QuestionDAO() {}
	
	public static QuestionDAO getInstance() {
		return dao;
	}
	
	public List<Question> selectListQuestion(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Question> list = new ArrayList<>();
			while (rs.next()) {
				Question question = new Question(
									rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_type"), 
									rs.getString("q_content"),
									rs.getString("q_File"), 
									rs.getDate("q_date"),
									rs.getString("m_id"));
				list.add(question);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectListQuestion
	
	public Question selectQuestionByQNo(Connection conn, int qNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question where q_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Question question = new Question(
									rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_type"), 
									rs.getString("q_content"),
									rs.getString("q_File"), 
									rs.getDate("q_date"),
									rs.getString("m_id"));
				return question;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectQuestionByQNo
	
	public List<Question> selectMyQuestionListByMId(Connection conn, String mId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			List<Question> list = new ArrayList<>();
			while (rs.next()) {
				Question question = new Question(
									rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_type"), 
									rs.getString("q_content"),
									rs.getString("q_File"), 
									rs.getDate("q_date"),
									rs.getString("m_id"));
				list.add(question);
			}			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectMyQuestionListByMId
	
	public List<Question> selectQuestionListByQType(Connection conn, String qType){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question where q_type=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qType);
			rs = pstmt.executeQuery();
			List<Question> list = new ArrayList<>();
			while (rs.next()) {
				Question question = new Question(
									rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_type"), 
									rs.getString("q_content"),
									rs.getString("q_File"), 
									rs.getDate("q_date"),
									rs.getString("m_id"));
				list.add(question);
			}			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectQuestionListByQType
	
	public int selectCountQuestion(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from question";
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
	}//selectCountQuestion
	
	public List<Question> selectDescListQuestion(Connection conn, int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question order by q_no desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Question> list = new ArrayList<>();
			while (rs.next()) {
				Question question = new Question(
									rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_type"), 
									rs.getString("q_content"),
									rs.getString("q_File"), 
									rs.getDate("q_date"),
									rs.getString("m_id"));
				list.add(question);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectDescListQuestion
	
	public List<Question> selectDescListQuestionByQType(Connection conn, String qType, int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question where q_type=? order by q_no desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qType);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			rs = pstmt.executeQuery();
			List<Question> list = new ArrayList<>();
			while (rs.next()) {
				Question question = new Question(
									rs.getInt("q_no"),
									rs.getString("q_title"),
									rs.getString("q_type"), 
									rs.getString("q_content"),
									rs.getString("q_File"), 
									rs.getDate("q_date"),
									rs.getString("m_id"));
				list.add(question);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectDescListQuestionByQType
	
	//--------------------- select 끝
	
	public int insertQuestion(Connection conn, Question question) {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into question values (null, ?, ?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, question.getqTitle());
			pstmt.setString(2, question.getqType());
			pstmt.setString(3, question.getqContent());
			pstmt.setString(4, question.getqFile());
			pstmt.setString(5, question.getmId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//insertQuestion
	
	public int updateQuestion(Connection conn, Question question) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update question set q_title=?, q_type=?, q_content=?, q_file=? where q_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, question.getqTitle());
			pstmt.setString(2, question.getqType());
			pstmt.setString(3, question.getqContent());
			pstmt.setString(4, question.getqFile());
			pstmt.setInt(5, question.getqNo());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateQuestion
	
	public int updateQuestionFile(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update question set q_file=null where q_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateQuestionFile
	
	public int deleteQuestion(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from question where q_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//deleteQuestion
}
