package com.khrd.handler.reservation;

import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class LoadReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sd = request.getParameter("start_date");
		String ed = request.getParameter("end_date");
		
		System.out.println(sd);
		System.out.println(ed);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date start_date = sdf.parse(sd);
		Date end_date = sdf.parse(ed);
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReservationDAO dao = ReservationDAO.getnInstance();
			ArrayList<Reservation> list = new ArrayList<>();
			list = dao.leftRoomCnt(conn, start_date, end_date);
			System.out.println(list);
			
			// object -> json string
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
						
			// 브라우저로 값 전달
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush(); // 브라우저로 내보냄
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
