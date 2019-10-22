package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.khrd.dto.Question;
import com.khrd.jdbc.JDBCUtil;

public class QuestionDAO {
	private static final QuestionDAO dao = new QuestionDAO();
	
	private QuestionDAO() {}
	
	public static QuestionDAO getInstance() {
		return dao;
	}
	
	public int insertQuestion(Connection conn, Question question) {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into question values (null, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, question.getqTitle());
			pstmt.setString(2, question.getqContent());
			pstmt.setString(3, question.getmId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//insertQuestion
}
