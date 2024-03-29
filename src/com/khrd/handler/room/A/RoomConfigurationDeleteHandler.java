package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomConfigurationDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("rcNo");
		int rcNo = Integer.parseInt(sNo);
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			RoomConfigurationDAO dao = RoomConfigurationDAO.getInstance();
			dao.deleteRoomConfiguration(conn, rcNo);
			
			conn.commit();
			
			response.sendRedirect(request.getContextPath() + "/roomConfiguration/list.do");
			
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
