package com.khrd.handler.room.A;

import java.io.File;
import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomImgDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.RoomImg;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RoomImgInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomNameDAO dao = RoomNameDAO.getInstance();
				List<RoomName> rn = dao.selectRoomNameList(conn);
				
				request.setAttribute("rn", rn);
				
				return "/WEB-INF/view/room/img/riInsertForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String roomImages = request.getRealPath("roomimages");
			File dir = new File(roomImages);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			System.out.println(roomImages);
			
			int size = 10*1024*1024;
			MultipartRequest multi = new MultipartRequest(request,
													roomImages,
													size,
													"UTF-8",
													new DefaultFileRenamePolicy());
			
			String sNoRn = multi.getParameter("roomName");
			int roomName = Integer.parseInt(sNoRn);
			String riFile = multi.getFilesystemName("riFile");
			//이미지 파일 이름은 반드시 getFilesystemName으로 가져와야 한다...!@!!!!!!!!!!!!!
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				RoomNameDAO rnDao = RoomNameDAO.getInstance();
				RoomName rn = rnDao.selectRoomNameByNo(conn, roomName);
				RoomImgDAO dao = RoomImgDAO.getInstance();
				RoomImg ri = new RoomImg(0, rn, riFile);
				
				System.out.println(riFile);
				
				dao.insertRoomImg(conn, ri);
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/roomImg/list.do");
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
