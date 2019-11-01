package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomEquipmentDAO;
import com.khrd.dao.RoomSeasonDAO;
import com.khrd.dto.RoomEquipment;
import com.khrd.dto.RoomSeason;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomEquipmentListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RoomEquipmentDAO dao = RoomEquipmentDAO.getInstance();
			List<RoomEquipment> list = dao.selectRoomEquipmentList(conn);
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/room/equipment/reList.jsp";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
