package com.khrd.handler.notice;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.NoticeDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class NoticeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int nNo = Integer.parseInt(req.getParameter("no"));
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			dao.deleteNotice(conn, nNo);
			String key = req.getParameter("key");
			if(key != null && key.equals("admin")) {
				res.sendRedirect(req.getContextPath()+"/notice/list.do?key=admin");
			}
			res.sendRedirect(req.getContextPath()+"/notice/list.do");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}
}
