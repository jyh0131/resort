package com.khrd.handler.qna;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class AnswerDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int aNo = Integer.parseInt(req.getParameter("no"));
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			AnswerDAO dao = AnswerDAO.getInstance();
			dao.deleteAnswer(conn, aNo);
			
			//관리자 페이지
			String key = req.getParameter("key");
			if(key != null && key.equals("admin")) {
				res.sendRedirect(req.getContextPath()+"/question/list.do?key=admin");
			}
			res.sendRedirect(req.getContextPath()+"/question/list.do");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}
}
