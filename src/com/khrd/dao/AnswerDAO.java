package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Answer;
import com.khrd.jdbc.JDBCUtil;

public class AnswerDAO {
	private static final AnswerDAO dao = new AnswerDAO();
	
	private AnswerDAO() {}
	
	public static AnswerDAO getInstance() {
		return dao;
	}
	
	public List<Answer> selectListAnswer(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from answer";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Answer> list = new ArrayList<>();
			while (rs.next()) {
				Answer answer = new Answer(
									rs.getInt("a_no"),
									rs.getString("a_content"), 
									rs.getDate("a_date"),
									rs.getInt("q_no"),
									rs.getString("m_id"));
				list.add(answer);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectListAnswer
	
	
	/*수정하기!!!!!!!!!!!!*/
	public Answer selectAnswerByQNo(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from answer";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Answer> list = new ArrayList<>();
			while (rs.next()) {
				Answer answer = new Answer(
									rs.getInt("a_no"),
									rs.getString("a_content"), 
									rs.getDate("a_date"),
									rs.getInt("q_no"),
									rs.getString("m_id"));
				return answer;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectAnswerQNo
}
