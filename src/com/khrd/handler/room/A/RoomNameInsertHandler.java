package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomNameInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomTypeDAO dao = RoomTypeDAO.getInstance();
				List<RoomType> rt = dao.selectRoomTypeList(conn);
				
				request.setAttribute("rt", rt);
				
				return "/WEB-INF/view/room/name/rnInsertForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String rnName = request.getParameter("rnName");
			String sNoRt = request.getParameter("roomType");
			int roomType = Integer.parseInt(sNoRt);
			String rnDetail = request.getParameter("rnDetail");
			String sNo = request.getParameter("rnPrice");
			int rnPrice = Integer.parseInt(sNo);
			String rnEngName = request.getParameter("rnEngName");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				RoomNameDAO dao = RoomNameDAO.getInstance();
				RoomTypeDAO rtDao = RoomTypeDAO.getInstance();
				RoomType rt = rtDao.selectRoomTypeByNo(conn, roomType);
				RoomName rn = new RoomName(0, rnName, rt, rnDetail, rnPrice,rnEngName);
				
				dao.insertRoomName(conn, rn);
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomName/list.do");
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
