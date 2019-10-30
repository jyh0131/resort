package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomConfigurationInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomNameDAO dao = RoomNameDAO.getInstance();
				List<RoomName> rn = dao.selectRoomNameList(conn);
				
				request.setAttribute("rn", rn);
				
				return "/WEB-INF/view/room/configuration/rcInsertForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
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
				RoomConfiguration rc = new RoomConfiguration(0, rn, rcArea, rcType, rcTypeCount, rcInterior);
				
				dao.insertRoomConfiguration(conn, rc);
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomConfiguration/list.do");
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
