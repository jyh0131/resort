package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomConfigurationListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RoomConfigurationDAO dao = RoomConfigurationDAO.getInstance();
			List<RoomConfiguration> list = dao.selectRoomConfigurationList(conn);
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/room/configuration/rcList.jsp";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
