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

public class MemberLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
				
			return "/WEB-INF/view/member/login.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			Connection conn = null;
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			try{
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = dao.SelectMemberIDPW(conn, id, password);
				
				if(member == null){
					request.setAttribute("login", true);
					
					return "/WEB-INF/view/member/login.jsp";
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("Auth", member.getmId());
				
				
				
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
