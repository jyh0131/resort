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

public class MemberUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			String id = request.getParameter("id");
					
			Connection conn = null;
			
			try {

				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = dao.SelectMemberByID(conn,id);
/*				request.setAttribute("password",member.getmPassword());
				request.setAttribute("number",member.getmPhone());
				request.setAttribute("email",member.getmEmail());
				request.setAttribute("date",member.getmRegdate());*/
				
				return "/WEB-INF/view/member/update.jsp";
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			Connection conn = null;
			
			String password = request.getParameter("password");
			String number = request.getParameter("number");
			String email = request.getParameter("email");
			String date = request.getParameter("date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date regDate = sdf.parse(date);
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = new Member(null, password, null, password, email, regDate, 0, 0);
				member.setmPassword(password);
				member.setmPhone(number);
				member.setmEmail(email);
				member.setmRegdate(regDate);
				dao.UpdateMember(conn, member);
								
				
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
