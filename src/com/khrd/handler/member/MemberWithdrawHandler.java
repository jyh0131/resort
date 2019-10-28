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

public class MemberWithdrawHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/member/update.jsp";	
		}else if(request.getMethod().equalsIgnoreCase("post")) {

			Connection conn = null;
					
			String Withdraw = request.getParameter("withdraw");
			int withdraw = Integer.parseInt(Withdraw);
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = new Member();	
				member.setmOut(withdraw);
				dao.WithdrawMember(conn, member);
									
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
