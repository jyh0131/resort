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
			// 회원 이름과 전화번호 가져오기
//			HttpSession session = request.getSession();
//			String Auth = (String)session.getAttribute("Auth");
			
			// 임시 값 넣어보기
			String Auth = "abc123";
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao =  ReservationDAO.getnInstance();
				Member m = dao.MemberInfo(conn, Auth);
				request.setAttribute("member", m);
				
				return "/WEB-INF/view/reservation/insertReserve.jsp";
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}		
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			
			//HttpSession session = request.getSession();
			//String Auth = (String)session.getAttribute("Auth");
			
			// 임시 값 넣어보기
			String Auth = "abc123";
			
			// String mId = request.getParameter("mId");
			String rsvName = request.getParameter("name");
			String rsvPhone = request.getParameter("phone");
			int rsvCount = Integer.parseInt(request.getParameter("count"));
			int rsvPrice = Integer.parseInt(request.getParameter("price"));
			
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date rsv_start_date = sdf.parse(start_date);
			Date rsv_end_date = sdf.parse(end_date);
			
			int rt_no = Integer.parseInt(request.getParameter("rt_no"));
			int rn_no = Integer.parseInt(request.getParameter("rn_no"));
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				ReservationDAO dao = ReservationDAO.getnInstance();
				conn.setAutoCommit(false);
				
				int rNo = dao.findrNo(conn, rt_no, rn_no, rsv_start_date, rsv_end_date);
				
				Member member = new Member();
				member.setmId(Auth);
				Room room = new Room();
				room.setrNo(rNo);
				Reservation rsv = new Reservation(0, rsvName, rsvPhone, rsvCount, rsvPrice, rsv_start_date, rsv_end_date,
													new Date(), 0, member, room);
				dao.insertReserve(conn, rsv, Auth, rNo);
				
				conn.commit();
				response.sendRedirect(request.getContextPath()+"/reservation/list.do");
				
			} catch(Exception e) {
				e.printStackTrace();
				conn.rollback();
			} finally {
				JDBCUtil.close(conn);
			}		
			
		}		
		return null;
	}

}
