package com.khrd.handler.reservation;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dto.Reservation;
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

		} else if (request.getMethod().equalsIgnoreCase("get")) {

			int rsv_no = Integer.parseInt(request.getParameter("rsv_no"));
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			int rtNo = Integer.parseInt(request.getParameter("rtNo"));
			String rnName = request.getParameter("rnName");
			String rRoom = request.getParameter("rRoom");

			String Sdate = request.getParameter("start_date");
			String Edate = request.getParameter("end_date");

			SimpleDateFormat sdf = new SimpleDateFormat();

			Date start_date = sdf.parse(Sdate);
			Date end_date = sdf.parse(Edate);

			int count = Integer.parseInt(request.getParameter("count"));
			int price = Integer.parseInt(request.getParameter("price"));
			int cancel = Integer.parseInt(request.getParameter("cancel"));

			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao = ReservationDAO.getnInstance();
				
				response.sendRedirect(request.getContextPath() + "/reservation/list.do");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}

		return null;
	}

}
