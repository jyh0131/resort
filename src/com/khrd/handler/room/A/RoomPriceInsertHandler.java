package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomPriceDAO;
import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomPrice;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomPriceInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomNameDAO dao = RoomNameDAO.getInstance();
				List<RoomName> rn = dao.selectRoomNameList(conn);
				
				request.setAttribute("rn", rn);
				
				return "/WEB-INF/view/room/price/rpInsertForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNoRn = request.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			String rpSeason = request.getParameter("rpSeason");
			String rpDetail = request.getParameter("rpDetail");
			String sNoB = request.getParameter("rpBase");
			int rpBase = Integer.parseInt(sNoB);
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, roomName);
				
				RoomPriceDAO dao = RoomPriceDAO.getInstance();
				RoomPrice rp = new RoomPrice(0, rn, rpSeason, rpBase, rpDetail);
				
				dao.insertRoomPrice(conn, rp);
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomPrice/list.do");
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
