package com.khrd.util;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MainRoomReader implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String Auth = (String)session.getAttribute("Auth");
		
		String url = "";
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao m = MemberDao.getInstance();
			conn.setAutoCommit(false);
			
			// 로그인을 하지 않았을 때
			if(Auth == null) {
				url = "/home.jsp";
			} else { // 로그인을 했을 때 
				int res = m.AdminIDCheck(conn, Auth);
				if(res == 0) { // 회원일 경우
					url = "/home.jsp";
				} else if (res == 1) { // 관리자일 경우
					url = "/homeA.jsp";
				} else {
					System.out.println("AdminIdCheck에서 에러");
					return null;
				}
			} 		
			
			RoomNameDAO dao = RoomNameDAO.getInstance();
			ArrayList<RoomName> list = dao.loadMainRoomInfo(conn);
			request.setAttribute("list", list);
			
			conn.commit();
			
			return url;
			
		} catch(Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
