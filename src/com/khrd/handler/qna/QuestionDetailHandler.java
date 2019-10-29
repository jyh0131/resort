package com.khrd.handler.qna;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dao.MemberDao;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Answer;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionDetailHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int qNo = Integer.parseInt(req.getParameter("no"));
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			//질문
			QuestionDAO daoQ = QuestionDAO.getInstance();
			Question question = daoQ.selectQuestionByQNo(conn, qNo);
			req.setAttribute("q", question);
			
			//답변
			AnswerDAO daoA = AnswerDAO.getInstance();
			Answer answer = daoA.selectAnswerByQNo(conn, qNo);
			req.setAttribute("a", answer);
			
			//아이디 체크(관리자/사용자)
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			MemberDao daoM = MemberDao.getInstance();
			int admin = daoM.AdminIDCheck(conn, mId);
			req.setAttribute("admin", admin);
			System.out.println("detail admin 값 확인 ******************** " + admin);    
			
			return "/WEB-INF/view/qna/question/questionDetail.jsp";   
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
