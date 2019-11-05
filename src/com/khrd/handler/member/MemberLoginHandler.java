package com.khrd.handler.member;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

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
				Member member2 = dao.withdrawCheck(conn, id);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member2", member2);
				
				HttpSession session = request.getSession();
/*				String Auth = (String)session.getAttribute("Auth");
				if(Auth == null) {
					request.setAttribute("Auth", true);
					return "/home.do";
				}	*/		
				if(member == null){
					request.setAttribute("login", true);				
					return "/WEB-INF/view/member/login.jsp";
				}else if(member2 != null) {
					request.setAttribute("withdraw", true);
					return "/WEB-INF/view/member/login.jsp";
				} else {		 		
					session.setAttribute("Auth", member.getmId());				
					response.sendRedirect(request.getContextPath()+"/home.do");
				}
				return null;
				
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
