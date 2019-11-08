package com.khrd.handler.reservation;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			dao.cancelReserve(conn, rsvNo);			
			response.sendRedirect(request.getContextPath() + "/reservation/list.do");
			
		} catch(Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			JDBCUtil.close(conn);
		}		
		
		return null;
	}

}
