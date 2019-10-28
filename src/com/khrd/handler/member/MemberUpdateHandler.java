package com.khrd.handler.member;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/member/update.jsp";

		} else if (request.getMethod().equalsIgnoreCase("post")) {

			HttpSession session = request.getSession();
			String Auth = (String)session.getAttribute("Auth");
			
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
				Member member = new Member(Auth, password, null, number, email, regDate, 0, 0);
				member.setmPassword(password);
				member.setmPhone(number);
				member.setmEmail(email);
				member.setmRegdate(regDate);
				dao.UpdateMember(conn, member);

				request.setAttribute("member",member);
				
				return "/WEB-INF/view/member/updateResult.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}

			return null;
		}

		return null;
	}

}
