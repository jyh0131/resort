package com.khrd.handler.reservation;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
		System.out.println(type);
		String text = request.getParameter("findtext");
		
		HttpSession session = request.getSession();
		String Auth = (String)session.getAttribute("Auth");
		
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
				System.out.println("type : " + type);
				System.out.println("list : " + list);
				System.out.println("size : " + list.size());
				request.setAttribute("list", list);
			} else if(type == 2) {
				ArrayList<Reservation> list = dao.selectReserveByName(conn, text);
				System.out.println("type : " + type);
				System.out.println("list : " + list);
				System.out.println("size : " + list.size());
				request.setAttribute("list", list);
			} else if(type == 4) {
				String sStart_date = request.getParameter("start_date");
				String sEnd_date = request.getParameter("end_date");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				Date start_date = sdf.parse(sStart_date);
				Date end_date = sdf.parse(sEnd_date);
				
				ArrayList<Reservation> list = dao.selectByDate(conn, Auth, start_date, end_date);
				System.out.println("type : " + type);
				System.out.println("list : " + list);
				System.out.println("size : " + list.size());
				request.setAttribute("list", list);
			}
						
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
