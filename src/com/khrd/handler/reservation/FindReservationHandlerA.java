package com.khrd.handler.reservation;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class FindReservationHandlerA implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int type = Integer.parseInt(request.getParameter("find"));
		String text = request.getParameter("findtext");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();			
			
			if(type == 1) {
				int no = Integer.parseInt(text);
				Reservation rsv = dao.selectReserveByNo(conn, no);
				System.out.println(rsv);
				request.setAttribute("list", rsv);
			} else if(type == 2) {
				ArrayList<Reservation> list = dao.selectReserveByName(conn, text);
				System.out.println(list);
				request.setAttribute("list", list);
			} else if(type == 3) {
				ArrayList<Reservation> list = dao.selectReserveById(conn, text);
				System.out.println(list);
				request.setAttribute("list", list);
			}
			return "/WEB-INF/view/reservation/listReserveA.jsp";
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
