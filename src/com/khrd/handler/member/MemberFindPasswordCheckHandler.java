package com.khrd.handler.member;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberFindPasswordCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/passwordFind.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			Connection conn = null;
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();	
				Member member = dao.FindMemberIdCheck(conn, name, phone);
				List<Member> list =  dao.FindMemberId(conn, name, phone);							
				request.setAttribute("list", list);
				if(member == null) {
					request.setAttribute("list", true);
					return "/WEB-INF/view/member/passwordFind.jsp";					
				}else if(member != null) {
					return "/WEB-INF/view/member/passwordFindResult.jsp";
				}
				
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
