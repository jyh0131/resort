package com.khrd.util;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MainRoomReader implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RoomNameDAO dao = RoomNameDAO.getInstance();
			ArrayList<RoomName> list = dao.loadMainRoomInfo(conn);
			request.setAttribute("list", list);
			
			return "/home.jsp";
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
