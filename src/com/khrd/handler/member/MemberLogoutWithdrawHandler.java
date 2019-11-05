package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberLogoutWithdrawHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		Connection conn = null;										
		HttpSession session = request.getSession();
		
		String Auth = (String)session.getAttribute("Auth");
		String password = request.getParameter("password");
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao dao = MemberDao.getInstance();			
			dao.WithdrawMember1(conn, Auth, password);			
			return "/WEB-INF/view/member/withdrawResult.jsp";
/*			int withdraw = dao.WithdrawMember1(conn, Auth, password);
			
			if(withdraw == 1) {
				request.setAttribute("result", true);
				return "/WEB-INF/view/member/withdrawResult.jsp";
			}else {
				request.setAttribute("result", false);
				return "/WEB-INF/view/member/withdraw.jsp";
			}*/
					
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}		
		
		session.invalidate();
		return "/home.do";

	}
 
}
