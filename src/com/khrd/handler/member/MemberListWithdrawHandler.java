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

public class MemberListWithdrawHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao dao = MemberDao.getInstance();
			List<Member> list = dao.SelectMemberWithdraw(conn);
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/member/listWithdraw.jsp";
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		
		
		return null;
	}

}
