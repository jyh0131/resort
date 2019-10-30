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

public class MemberWithdrawCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			Connection conn = null;			
			String id = request.getParameter("id");
/*			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String email = request.getParameter("email");					
			String date = request.getParameter("date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date regDate = sdf.parse(date);
						*/
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				List<Member> list = dao.withdrawCheck(conn, id);
				
				request.setAttribute("list", list);
				
				return "/WEB-INF/view/member/login.jsp";			
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
