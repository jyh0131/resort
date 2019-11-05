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

public class FindReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int type = Integer.parseInt(request.getParameter("find"));
		String text = request.getParameter("findtext");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();			
			
			conn.setAutoCommit(false);				
			
			if(type == 1) {
				int no = Integer.parseInt(text);
				ArrayList<Reservation> list = new ArrayList<>();
				Reservation rsv = dao.selectReserveByNo(conn, no);
				list.add(rsv);
				System.out.println(list);
				request.setAttribute("list", list);
			} else if(type == 2) {
				ArrayList<Reservation> list = dao.selectReserveByName(conn, text);
				System.out.println(list);
				request.setAttribute("list", list);
			} else if(type == 3) {
				ArrayList<Reservation> list = dao.selectReserveById(conn, text);
				System.out.println(list);
				request.setAttribute("list", list);
			}
			
			HttpSession session = request.getSession();
			String Auth = (String)session.getAttribute("Auth");
			
			int result = dao.isAdmin(conn, Auth);
			
			conn.commit();
			
			if(result == 1) {
				return "/WEB-INF/view/reservation/listReserveA.jsp";
			} else if(result == 0){
				return "/WEB-INF/view/reservation/listReserve.jsp";
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
