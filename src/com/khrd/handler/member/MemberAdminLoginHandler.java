package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
 
public class MemberAdminLoginHandler implements CommandHandler {
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/member/adminLogin.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			Connection conn = null;
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member memberAdmin = dao.AdminMemberLogin(conn,id,password);
				
				if(memberAdmin == null){
					request.setAttribute("login", true);
					
					return "/WEB-INF/view/member/adminLogin.jsp";
				}	
				
				HttpSession session = request.getSession();
				session.setAttribute("Auth", memberAdmin.getmId());
	
				response.sendRedirect(request.getContextPath()+"/homeA.do");
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
					 
			return null;
		}

		return null;
	}

}
