package com.khrd.handler.reservation;

import java.sql.Connection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class UpdateReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			
			int rsvNo = Integer.parseInt(request.getParameter("no"));

			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao = ReservationDAO.getnInstance();
				Reservation rsv = dao.selectReserveByNo(conn, rsvNo);
				request.setAttribute("rsv", rsv);
				
				return "/WEB-INF/view/reservation/updateReserveA.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}

		} else if (request.getMethod().equalsIgnoreCase("post")) {

			int rsvNo = Integer.parseInt(request.getParameter("rsv_no"));
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			int count = Integer.parseInt(request.getParameter("count"));
			int price = Integer.parseInt(request.getParameter("price"));
			int cancel = Integer.parseInt(request.getParameter("cancel"));

			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao = ReservationDAO.getnInstance();
				
				Reservation rsv = new Reservation(rsvNo, name, phone, count, price, new Date(), new Date(), new Date(), cancel, new Member(), new Room());
				dao.updateReserve(conn, rsv);
				
				// 세션 Auth가 admin일 경우에 --> Auth값이 아닌 관리자 여부에 따라 판단하도록,
//				HttpSession session = request.getSession();
//				String Auth = (String)session.getAttribute("Auth");
				
				int Auth = 1;
				
				if(Auth == 1) {
					response.sendRedirect(request.getContextPath() + "/reservation/listA.do");
				} else {
					response.sendRedirect(request.getContextPath() + "/reservation/list.do");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}

		return null;
	}

}
