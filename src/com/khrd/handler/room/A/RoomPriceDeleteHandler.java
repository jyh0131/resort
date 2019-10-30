package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomPriceDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomPriceDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("rpNo");
		int rpNo = Integer.parseInt(sNo);
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			RoomPriceDAO dao = RoomPriceDAO.getInstance();
			dao.deleteRoomPrice(conn, rpNo);
			
			conn.commit();
			
			response.sendRedirect(request.getContextPath() + "/roomPrice/list.do");
			
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
