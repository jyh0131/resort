package com.khrd.handler.room;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RoomImgDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dao.RoomTypeDAO;
import com.khrd.dto.Room;
import com.khrd.dto.RoomImg;
import com.khrd.dto.RoomName;
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
			
			
			return "/WEB-INF/view/room/roomResort.jsp";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
