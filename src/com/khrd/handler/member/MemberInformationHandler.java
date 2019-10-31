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

public class MemberInformationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			HttpSession session = request.getSession();
			String Auth = (String)session.getAttribute("Auth");
			
			try {					
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = dao.InforMationMember(conn, Auth);
				
				request.setAttribute("member", member);
	
				return "/WEB-INF/view/member/information.jsp";
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}		
		}

		return null;
	}

}
