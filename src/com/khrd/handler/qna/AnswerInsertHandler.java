package com.khrd.handler.qna;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dto.Answer;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class AnswerInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {		
		if(req.getMethod().equalsIgnoreCase("get")) {
			int qNo = Integer.parseInt(req.getParameter("no"));
			req.setAttribute("no", qNo);

			//관리자 페이지 키 넘기기
			String key = req.getParameter("key");
			req.setAttribute("key", key);
			
			return "/WEB-INF/view/qna/answer/answerInsertForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			int qNo = Integer.parseInt(req.getParameter("no"));
			String aContent = req.getParameter("content");
			aContent = aContent.replaceAll("\r\n", "<br>"); 
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				AnswerDAO dao = AnswerDAO.getInstance();
				Answer answer =  new Answer(0, aContent, null, qNo, mId);
				dao.insertAnswer(conn, answer);
				
				//관리자 페이지 키 넘기기
				String key = req.getParameter("key");
				if(key != null && key.equals("admin")) {
					res.sendRedirect(req.getContextPath()+"/question/list.do?key=admin");
				}
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
