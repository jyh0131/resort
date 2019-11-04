package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberWithdrawHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/member/withdrawMember.jsp";	
		}else if(request.getMethod().equalsIgnoreCase("post")) {

			Connection conn = null;							
			
			HttpSession session = request.getSession();
			
			String Auth = (String)session.getAttribute("Auth");
			String password = request.getParameter("password");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				dao.WithdrawMember(conn,Auth,password);	
				
//				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("member", member);				
				
/*				request.setAttribute("result", result);
				if(member == null){
					request.setAttribute("result", true);
					return "/WEB-INF/view/member/withdraw.jsp";
				}else if(member != null){
					request.setAttribute("result", false);
					return "/WEB-INF/view/member/withdrawMember.jsp";
				}
*/
				return "/WEB-INF/view/member/withdraw.jsp";
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}	
		}	 
		return null; 
	}
}
