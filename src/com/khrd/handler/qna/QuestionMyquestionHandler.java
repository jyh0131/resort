package com.khrd.handler.qna;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionMyquestionHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String mId = (String) session.getAttribute("Auth");
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();
			List<Question> list = dao.selectMyQuestionListByMId(conn, mId);
			req.setAttribute("list", list);
			return "/WEB-INF/view/qna/question/myQuestion.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
