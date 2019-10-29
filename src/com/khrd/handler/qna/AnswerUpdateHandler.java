package com.khrd.handler.qna;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dto.Answer;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class AnswerUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int qNo = Integer.parseInt(req.getParameter("no"));
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				AnswerDAO dao = AnswerDAO.getInstance();
				Answer answer = dao.selectAnswerByQNo(conn, qNo);
				String aContent = answer.getaContent().replaceAll("<br>", "\r\n");
				answer.setaContent(aContent);
				req.setAttribute("qNo", qNo);
				req.setAttribute("a", answer);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return "/WEB-INF/view/qna/answer/answerUpdateForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			int qNo = Integer.parseInt(req.getParameter("qNo"));
			int aNo = Integer.parseInt(req.getParameter("aNo"));
			String aContent = req.getParameter("content");
			aContent = aContent.replaceAll("\r\n", "<br>"); 
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				AnswerDAO dao = AnswerDAO.getInstance();
				Answer answer = new Answer(aNo, aContent, null, 0, null);
				dao.updateAnswer(conn, answer);
				res.sendRedirect(req.getContextPath()+"/question/detail.do?no="+qNo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}
}
