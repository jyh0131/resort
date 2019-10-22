package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomTypeUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("rtNo");
			int rtNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomTypeDAO dao = RoomTypeDAO.getInstance();
				RoomType rt = dao.selectRoomTypeByNo(conn, rtNo);
				
				request.setAttribute("rt", rt);
				
				return "/WEB-INF/view/room/type/rtUpdateForm.jsp";
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNo = request.getParameter("rtNo");
			int rtNo = Integer.parseInt(sNo);
			String rtName = request.getParameter("rtName");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				RoomTypeDAO dao = RoomTypeDAO.getInstance();
				dao.updateRoomType(conn, new RoomType(rtNo, rtName));
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
