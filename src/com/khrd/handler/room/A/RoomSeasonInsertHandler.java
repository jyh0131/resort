package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomSeasonDAO;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomSeason;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomSeasonInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomNameDAO dao = RoomNameDAO.getInstance();
				List<RoomName> rn = dao.selectRoomNameList(conn);
				
				RoomTypeDAO rtDao = RoomTypeDAO.getInstance();
				List<RoomType> rt = rtDao.selectRoomTypeList(conn);
				
				request.setAttribute("rt", rt);
				
				request.setAttribute("rn", rn);
				
				return "/WEB-INF/view/room/season/rsInsertForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
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
				RoomSeason rs = new RoomSeason(0, rn, rsSeason, rsDetail);
				
				dao.insertRoomSeason(conn, rs);
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomSeason/list.do");
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
