package com.khrd.handler.reservation;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class CancelReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String sNo = request.getParameter("no");
		int rsvNo = Integer.parseInt(sNo);
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();
			
			conn.setAutoCommit(false);			
			
			dao.cancelReserve(conn, rsvNo);
			
			// 세션 Auth가 admin일 경우에
			HttpSession session = request.getSession();
			String Auth = (String)session.getAttribute("Auth");
			
			int result = dao.isAdmin(conn, Auth);
			
			conn.commit();
			
			if(result == 1) {
				response.sendRedirect(request.getContextPath() + "/reservation/listA.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/member/login.do");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			JDBCUtil.close(conn);
		}		
		
		return null;
	}

}
