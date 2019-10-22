package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomTypeInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/room/type/rtInsertForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String rtName = request.getParameter("rtName");
			
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				RoomTypeDAO dao = RoomTypeDAO.getInstance();
				RoomType rt = new RoomType(0, rtName);
				
				dao.insertRoomType(conn, rt);		
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomType/list.do");
				return null;
			}catch (Exception e) {
				e.printStackTrace();
				conn.rollback();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
