package com.khrd.handler.reservation;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class UpdateReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int rsv_no = Integer.parseInt(request.getParameter("rsv_no"));
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			ReservationDAO dao = ReservationDAO.getnInstance();
			
			
			response.sendRedirect(request.getContextPath()+"/reservation/list.do");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
