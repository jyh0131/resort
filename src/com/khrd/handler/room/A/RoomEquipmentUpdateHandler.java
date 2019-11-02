package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomEquipmentDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.RoomEquipment;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomEquipmentUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("reNo");
			int reNo = Integer.parseInt(sNo);
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				RoomEquipmentDAO dao = RoomEquipmentDAO.getInstance();
				RoomEquipment re = dao.selectRoomEquipmentByNo(conn, reNo);
				
				RoomTypeDAO rtDao = RoomTypeDAO.getInstance();
				List<RoomType> rt = rtDao.selectRoomTypeList(conn);
				
				request.setAttribute("rt", rt);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				List<RoomName> rn = rnDao.selectRoomNameList(conn);
								
				request.setAttribute("re", re);
				request.setAttribute("rn", rn);
				return "/WEB-INF/view/room/equipment/reUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String sNo = request.getParameter("reNo");
			int reNo = Integer.parseInt(sNo);
			String sNoRn = request.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			String reFurniture = request.getParameter("reFurniture");
			String reHomeAppliances = request.getParameter("reHomeAppliances");
			String reTableWare = request.getParameter("reTableWare");
			String reWash = request.getParameter("reWash");
			String reBedding = request.getParameter("reBedding");
			String reOther = request.getParameter("reOther");
			String reAmenity = request.getParameter("reAmenity");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, roomName);
				
				RoomEquipmentDAO dao = RoomEquipmentDAO.getInstance();
				RoomEquipment re = new RoomEquipment(reNo,
														rn,
														reFurniture,
														reHomeAppliances,
														reTableWare,
														reWash,
														reBedding,
														reOther,
														reAmenity);
				
				
				dao.updateRoomEquipment(conn, re);
				
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomEquipment/list.do");
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
