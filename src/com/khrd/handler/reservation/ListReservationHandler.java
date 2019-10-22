package com.khrd.handler.reservation;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class ListReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String auth = (String)session.getAttribute("Auth");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();
			ArrayList<Reservation> list = dao.selectReserveById(conn, auth);
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/reservation/listReserve.jsp";
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
