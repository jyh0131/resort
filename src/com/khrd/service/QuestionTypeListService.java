package com.khrd.service;

import java.sql.Connection;
import java.util.List;

import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionTypeListService {
	private QuestionDAO dao = QuestionDAO.getInstance();
	private int size = 10; //한 페이지에 보일 게시글 수
	
	public QuestionPage getQuestionPage(String qType, int pageNum) { //유형, 페이지 번호
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			int total = dao.selectCountQuestionByQType(conn, qType);
			List<Question> list = dao.selectDescListQuestionByQType(conn, qType, (pageNum -1)*size, size);
			QuestionPage questionPage = new QuestionPage(total, pageNum, size, list);
			return questionPage;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return null;
	}
	
}
