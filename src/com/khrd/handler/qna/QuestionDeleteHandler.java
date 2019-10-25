package com.khrd.handler.qna;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Answer;
import com.khrd.dto.Question;
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
			
			QuestionDAO dao = QuestionDAO.getInstance();
			
			//작성자 확인(주소로 접근 막기)
			Question question = dao.selectQuestionByQNo(conn, qNo);
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			if(mId.equals(question.getmId()) == false){
				res.sendRedirect(req.getContextPath()+"/question/list.do"); //본인 아니면 리스트로 이동
				return null;
			}//
			
			AnswerDAO daoA = AnswerDAO.getInstance();
			Answer answer = daoA.selectAnswerByQNo(conn, qNo);
			int aNo = answer.getaNo();
			daoA.deleteAnswer(conn, aNo);
			dao.deleteQuestion(conn, qNo);
			conn.commit();
			
			res.sendRedirect(req.getContextPath()+"/question/myQ.do");
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
