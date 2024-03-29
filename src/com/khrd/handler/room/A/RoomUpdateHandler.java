package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.Room;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("rNo");
			int rNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomDAO dao = RoomDAO.getInstance();
				Room r = dao.selectRoomByNo(conn, rNo);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				List<RoomName> rn = rnDao.selectRoomNameList(conn);
				
				request.setAttribute("rn", rn);
				
				
				request.setAttribute("r", r);
				
				return "/WEB-INF/view/room/rUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNoR = request.getParameter("rNo");
			int rNo = Integer.parseInt(sNoR);
			
			String sNoRr = request.getParameter("rRoom");
			int rRoom = Integer.parseInt(sNoRr);
			
			String sNoRn = request.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				RoomDAO dao = RoomDAO.getInstance();
				RoomNameDAO rnDAO = RoomNameDAO.getInstance();
				RoomName rn = rnDAO.selectRoomNameByNo(conn, roomName);
				
				dao.updateRoom(conn, new Room(rNo, rRoom, rn));
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/room/list.do");
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
