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

public class RoomInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomNameDAO dao = RoomNameDAO.getInstance();
				List<RoomName> rn = dao.selectRoomNameList(conn);
				
				request.setAttribute("rn", rn);
				
				return "/WEB-INF/view/room/rInsertForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			/*String sNoR = request.getParameter("rNo");
			int rNo = Integer.parseInt(sNoR);*/
			
			String sNoRr = request.getParameter("rRoom");
			int rRoom = Integer.parseInt(sNoRr);
			
			String sNoRn = request.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, roomName);
				
				RoomDAO dao = RoomDAO.getInstance();
				Room r = new Room(0, rRoom, rn);
				dao.insertRoom(conn, r);
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/room/list.do");
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
