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
		String Auth = (String)session.getAttribute("Auth");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();
			
			conn.setAutoCommit(false);		
			
			// 세션 Auth가 admin일 경우에 --> Auth값이 아닌 관리자 여부에 따라 판단하도록,
			int result = dao.isAdmin(conn, Auth);
			String rtn = "";
			ArrayList<Reservation> list = new ArrayList<>();
			
			switch(result) {
			case 0:
				list = dao.selectReserveById(conn, Auth);
				request.setAttribute("list", list);
				rtn = "/WEB-INF/view/reservation/listReserve.jsp";
			case 1:
				list = dao.selectReserve(conn);
				request.setAttribute("list", list);
				rtn = "/WEB-INF/view/reservation/listReserveA.jsp";
			default:
				rtn = request.getContextPath() + "/member/login.do";
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
