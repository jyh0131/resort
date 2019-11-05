package com.khrd.handler.room;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomConfigurationDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RoomEquipmentDAO;
import com.khrd.dao.RoomImgDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomSeasonDAO;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.Room;
import com.khrd.dto.RoomConfiguration;
import com.khrd.dto.RoomEquipment;
import com.khrd.dto.RoomImg;
import com.khrd.dto.RoomName;
import com.khrd.dto.RoomSeason;
import com.khrd.dto.RoomType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//객실 타입 리스트
			RoomTypeDAO rtDao = RoomTypeDAO.getInstance();
			List<RoomType> rtList = rtDao.selectRoomTypeList(conn);
			request.setAttribute("rtList", rtList);
			
			//객실 타입에 따른 객실 이름 리스트
			RoomNameDAO rnDao = RoomNameDAO.getInstance();
			List<RoomName> rnList = rnDao.selectRoomNameList(conn);
			request.setAttribute("rnList", rnList);
			
			//객실 이름에 따른 이미지 리스트
			RoomImgDAO riDao = RoomImgDAO.getInstance();
			List<RoomImg> riList = riDao.selectRoomImgList(conn);
			request.setAttribute("riList", riList);
			
			
			
			//객실 이름에 따른 방 번호
			RoomDAO rDao = RoomDAO.getInstance();
			List<Room> rList = rDao.selectRoomList(conn);
			request.setAttribute("rList", rList);
			
			//객실 구성 리스트
			RoomConfigurationDAO rcDao = RoomConfigurationDAO.getInstance();
			List<RoomConfiguration> rcList = rcDao.selectRoomConfigurationList(conn);
			request.setAttribute("rcList", rcList);
			
			//시즌 정보 리스트
			RoomSeasonDAO rsDao = RoomSeasonDAO.getInstance();
			List<RoomSeason> rsList = rsDao.selectRoomSeasonList(conn);
			request.setAttribute("rsList", rsList);
			
			//비품구성 리스트
			RoomEquipmentDAO reDao = RoomEquipmentDAO.getInstance();
			List<RoomEquipment> reList = reDao.selectRoomEquipmentList(conn);
			request.setAttribute("reList", reList);

			String sNo = request.getParameter("rnNo");
			if(sNo == null) {
				sNo = "1";
			}
			request.setAttribute("selectRnNo", sNo);
			
			int rnNo = Integer.parseInt(sNo);
			List<String> imgFile = riDao.selectRoomImgByRnNo(conn, rnNo);
			request.setAttribute("imgFile", imgFile);

			return "/WEB-INF/view/room/roomResort.jsp";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
