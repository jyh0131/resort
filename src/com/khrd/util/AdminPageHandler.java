package com.khrd.util;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class AdminPageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String Auth = (String) session.getAttribute("Auth");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao dao = MemberDao.getInstance();
			int result = dao.AdminIDCheck(conn, Auth);
			
			if(result == 1) {
				return "/homeA.do";
			} else {
				return "/home.do";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
