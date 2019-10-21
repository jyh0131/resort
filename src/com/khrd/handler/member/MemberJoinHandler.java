package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberJoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/member/insert.jsp";
			
		}else if(request.getMethod().equalsIgnoreCase("post")){
			request.setCharacterEncoding("utf-8");
			Connection conn = null;
			
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String email = request.getParameter("email");
			
			
			String date = request.getParameter("date");
			int out = Integer.parseInt("out");
			int admin = Integer.parseInt("admin");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = new Member(id, password, name, number, email, date, out, admin);
				
				int result = dao.insertMember(conn, member);
				
				request.setAttribute("result", result);
				
				return "WEB-INF/view/member/joinResult.jsp";
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
		}
			
		return null;
	}

}
