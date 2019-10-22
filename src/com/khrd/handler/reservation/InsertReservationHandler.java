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

public class InsertReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/reservation/insertReserve.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			
			String mId = request.getParameter("mId");
			int rNo = Integer.parseInt(request.getParameter("rNo"));
			int rsvCount = Integer.parseInt(request.getParameter("count"));
			int rsvPrice = Integer.parseInt(request.getParameter("price"));
			
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			String payment_date = request.getParameter("payment_date");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date rsv_start_date = sdf.parse(start_date);
			Date rsv_end_date = sdf.parse(end_date);
			Date rsv_payment_date = sdf.parse(payment_date);
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao = ReservationDAO.getnInstance();
				Member member = new Member();
				member.setmId(mId);
				Room room = new Room();
				room.setrNo(rNo);
				Reservation rsv = new Reservation(0, rsvCount, rsvPrice, rsv_start_date, rsv_end_date,
													rsv_payment_date, 0, member, room);
				dao.addReserve(conn, rsv, mId, rNo);
				response.sendRedirect(request.getContextPath()+"/reservation/list.do");
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}		
			
		}		
		return null;
	}

}
