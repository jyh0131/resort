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

public class RoomNameUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("rnNo");
			int rnNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomNameDAO dao = RoomNameDAO.getInstance();
				RoomName rn = dao.selectRoomNameByNo(conn, rnNo);
				
				request.setAttribute("rn", rn);
				
				RoomTypeDAO rtDao = RoomTypeDAO.getInstance();
				List<RoomType> rt = rtDao.selectRoomTypeList(conn);
				
				request.setAttribute("rt", rt);
				
				return "/WEB-INF/view/room/name/rnUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNo = request.getParameter("rnNo");
			int rnNo = Integer.parseInt(sNo);
			String rnName = request.getParameter("rnName");
			String rnDetail = request.getParameter("rnDetail");
			String sNop = request.getParameter("rnPrice");
			int rnPrice = Integer.parseInt(sNop);
			String rnEngName = request.getParameter("rnEngName");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				RoomNameDAO dao = RoomNameDAO.getInstance();
				
				dao.updateRoomName(conn, new RoomName(rnNo,
														rnName,
														null,
														rnDetail,
														rnPrice,
														rnEngName));
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomName/list.do");
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
