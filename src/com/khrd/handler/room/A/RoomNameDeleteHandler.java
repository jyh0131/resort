package com.khrd.handler.room.A;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RoomEquipmentDAO;
import com.khrd.dao.RoomImgDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomSeasonDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomNameDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("rnNo");
		int rnNo = Integer.parseInt(sNo);
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			RoomConfigurationDAO rcDao = RoomConfigurationDAO.getInstance();
			rcDao.deleteRoomConfigurationByRnNo(conn, rnNo);
			
			RoomDAO rDao = RoomDAO.getInstance();
			rDao.deleteRoomByRnNo(conn, rnNo);
			
			RoomEquipmentDAO reDao = RoomEquipmentDAO.getInstance();
			reDao.deleteRoomEquipmentByRnNo(conn, rnNo);
			
			RoomImgDAO riDao = RoomImgDAO.getInstance();
			riDao.deleteRoomImgByRnNo(conn, rnNo);
			
			RoomSeasonDAO rsDao = RoomSeasonDAO.getInstance();
			rsDao.deleteRoomSeasonByRnNo(conn, rnNo);
			
			RoomNameDAO dao = RoomNameDAO.getInstance();
			dao.deleteRoomName(conn, rnNo);
			
			conn.commit();
			
			response.sendRedirect(request.getContextPath() + "/roomName/list.do");
			
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
