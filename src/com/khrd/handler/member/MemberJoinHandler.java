package com.khrd.handler.member;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date regDate = sdf.parse(date);
			
			try {
				conn = ConnectionProvider.getConnection();

				MemberDao dao = MemberDao.getInstance();
				Member member = new Member(id, password, name, number, email, regDate, 0, 0);
				int result = dao.InsertMember(conn, member);
				request.setAttribute("result", result);
				
				return "/WEB-INF/view/member/joinResult.jsp";
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
		}
			
		return null;
	}

}
