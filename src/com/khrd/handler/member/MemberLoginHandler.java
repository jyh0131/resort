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
//				if(member2 != null) {
//					map.put("result","success");
//				} else {
//					map.put("result", "fail");
//				}
//				ObjectMapper om = new ObjectMapper();
//				String json = om.writeValueAsString(map);
//				response.setContentType("application/json;charset=utf-8");
//				PrintWriter out = response.getWriter();
//				out.println(json);
//				out.flush();	
				
				if(member == null){
					request.setAttribute("login", true);
					
					return "/WEB-INF/view/member/login.jsp";
				}else if(member2 != null) {
					request.setAttribute("withdraw", true);
					return "/WEB-INF/view/member/login.jsp";
				}			
				
				HttpSession session = request.getSession();
				session.setAttribute("Auth", member.getmId());
	
				if(session == null || session.getAttribute("Auth") == null) {
					HttpServletResponse response2 = (HttpServletResponse)response;
				}
				
				return "/WEB-INF/view/member/home.jsp";
					
				
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
