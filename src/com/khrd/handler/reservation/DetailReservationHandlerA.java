package com.khrd.handler.reservation;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class DetailReservationHandlerA implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int rsvNo = Integer.parseInt(request.getParameter("rsv_no"));
		
		HttpSession session = request.getSession();
		String Auth = (String)session.getAttribute("Auth");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();
			
			conn.setAutoCommit(false);
			
			int result = dao.isAdmin(conn, Auth);
			String rtn = "";
			
			switch(result) {
			case 1:
				Reservation rsv = dao.selectReserveByNo(conn, rsvNo);
				request.setAttribute("rsv", rsv);
				rtn = "/WEB-INF/view/reservation/detailReserveA.jsp";
				break;
			case 0:
				rtn = "/WEB-INF/view/member/login.do";
				break;
			default:
				rtn = "/WEB-INF/index.jsp";
				break;
			}
			conn.commit();
						
			return rtn; 
			
		} catch(Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
