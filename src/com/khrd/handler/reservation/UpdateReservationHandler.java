package com.khrd.handler.reservation;

import java.sql.Connection;
import java.text.SimpleDateFormat;
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
			int rNo = Integer.parseInt(request.getParameter("rNo"));
			int rtNo = Integer.parseInt(request.getParameter("rtNo"));
			String rnName = request.getParameter("rnName");
			int rRoom = Integer.parseInt(request.getParameter("rRoom"));

			String Sdate = request.getParameter("start_date");
			String Edate = request.getParameter("end_date");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date start_date = sdf.parse(Sdate);
			Date end_date = sdf.parse(Edate);

			int count = Integer.parseInt(request.getParameter("count"));
			int price = Integer.parseInt(request.getParameter("price"));
			int cancel = Integer.parseInt(request.getParameter("cancel"));

			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao = ReservationDAO.getnInstance();
				
				Room r = new Room();
				r.setrNo(rNo);
				
				Reservation rsv = new Reservation(rsvNo, name, phone, count, price, start_date, end_date, new Date(), cancel, new Member(), r);
				dao.updateReserve(conn, rsv, rtNo, rnName, rRoom);
				
				// 세션 Auth가 admin일 경우에
//				HttpSession session = request.getSession();
//				String Auth = (String)session.getAttribute("Auth");
				
				String Auth = "admin";
				
				if(Auth.equals("admin")) {
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
