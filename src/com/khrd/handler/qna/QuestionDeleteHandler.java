package com.khrd.handler.qna;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Answer;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int qNo = Integer.parseInt(req.getParameter("no"));
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			AnswerDAO daoA = AnswerDAO.getInstance();
			Answer answer = daoA.selectAnswerByQNo(conn, qNo);
			if(answer != null) {
				int aNo = answer.getaNo();
				daoA.deleteAnswer(conn, aNo); //답변 삭제
			}	
			
			QuestionDAO dao = QuestionDAO.getInstance();
			dao.deleteQuestion(conn, qNo); //질문 삭제			
			
			conn.commit();
			
			res.sendRedirect(req.getContextPath()+"/question/list.do");
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
