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

public class RoomPriceUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("rpNo");
			int rpNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomPriceDAO dao = RoomPriceDAO.getInstance();
				RoomPrice rp = dao.selectRoomPriceByNo(conn, rpNo);
				List<RoomPrice> list = dao.selectRoomPriceList(conn);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, rp.getRoomName().getRnNo());
								
				request.setAttribute("rp", rp);
				request.setAttribute("list", list);
				request.setAttribute("rn", rn);
				return "/WEB-INF/view/room/price/rpUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNo = request.getParameter("rpNo");
			int rpNo = Integer.parseInt(sNo);
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
