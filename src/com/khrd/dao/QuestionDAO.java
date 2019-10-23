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
	
	public Question selectQuestionByMId(Connection conn, String mId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
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
	}//selectQuestionByMId
	
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
}
