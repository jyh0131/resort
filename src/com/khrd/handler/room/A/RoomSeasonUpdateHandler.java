package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomSeasonDAO;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomSeason;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomSeasonUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("rsNo");
			int rsNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomSeasonDAO dao = RoomSeasonDAO.getInstance();
				RoomSeason rs = dao.selectRoomSeasonByNo(conn, rsNo);
				List<RoomSeason> list = dao.selectRoomSeasonList(conn);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, rs.getRoomName().getRnNo());
								
				request.setAttribute("rs", rs);
				request.setAttribute("list", list);
				request.setAttribute("rn", rn);
				return "/WEB-INF/view/room/season/rsUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNo = request.getParameter("rsNo");
			int rsNo = Integer.parseInt(sNo);
			String sNoRn = request.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			String rsSeason = request.getParameter("rsSeason");
			String rsDetail = request.getParameter("rsDetail");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, roomName);
				
				RoomSeasonDAO dao = RoomSeasonDAO.getInstance();
				RoomSeason rs = new RoomSeason(rsNo,
									rn,
									rsSeason,
									rsDetail);
				dao.updateRoomSeason(conn, rs);
				
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomSeason/list.do");
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
