package com.khrd.handler.admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class ReservationSalesCahrtHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			ReservationDAO rsvDao = ReservationDAO.getnInstance();
			RoomDAO rmDao = RoomDAO.getInstance();
			RoomNameDAO rmnDao = RoomNameDAO.getInstance();
			
			List<Reservation> rsvList = rsvDao.selectSalesInfo(conn);
			List<String> rmnList = new ArrayList<>();
			System.out.println("예약 정보 리스트 : " + rsvList);

//			for(Reservation r : rsvList) {
//				int rnNo = r.getRoom().getRoomName().getRnNo(); //객실이름번호
//				String rmName = rmnDao.selectRoomNameByNo(conn, rnNo).getRnName(); //객실이름
//				rmnList.add(rmName);
//			}
			
			//int rnNo = r.getRoom().getRoomName().getRnNo(); //객실이름번호
			
			List<RoomName> rmNameList = rmnDao.selectRoomNameList(conn);
			for(RoomName rmn : rmNameList) {
				rmnList.add(rmn.getRnName());
			}
			
			System.out.println("모든 객실 이름 리스트 : " + rmnList);
			
			req.setAttribute("rsvList", rsvList);
			req.setAttribute("rmnList", rmnList);
			return "/WEB-INF/view/admin/salesChart.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}	
		return null;
	}

}
