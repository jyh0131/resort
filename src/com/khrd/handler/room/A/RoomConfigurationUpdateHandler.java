package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomConfigurationUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("rcNo");
			int rcNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomConfigurationDAO dao = RoomConfigurationDAO.getInstance();
				RoomConfiguration rc = dao.selectRoomConfigurationByNo(conn, rcNo);
				
				request.setAttribute("rc", rc);
				
				return "/WEB-INF/view/room/configuration/rcUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNo = request.getParameter("rcNo");
			int rcNo = Integer.parseInt(sNo);
			String sNoRn = request.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			String rcArea = request.getParameter("rcArea");
			String rcType = request.getParameter("rcType");
			String sNoT = request.getParameter("rcTypeCount");
			int rcTypeCount = Integer.parseInt(sNoT);
			String rcInterior = request.getParameter("rcInterior");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, roomName);
				
				RoomConfigurationDAO dao = RoomConfigurationDAO.getInstance();
				RoomConfiguration rc = new RoomConfiguration(rcNo,
															rn,
															rcArea, 
															rcType, 
															rcTypeCount, 
															rcInterior);
				dao.updateRoomConfiguration(conn, rc);
				
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomConfiguration/list.do");
				return null;
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
		}
		return null;
	}

}
