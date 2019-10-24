package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomImgDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomImgDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("riNo");
		int riNo = Integer.parseInt(sNo);
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			RoomImgDAO dao = RoomImgDAO.getInstance();
			dao.deleteRoomImg(conn, riNo);
			
			conn.commit();
			
			response.sendRedirect(request.getContextPath() + "/roomImg/list.do");
			
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
