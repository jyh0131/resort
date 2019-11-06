package com.khrd.handler.room.A;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomSeasonDAO;
import com.khrd.dto.RoomSeason;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.khrd.util.PageMaker;

public class RoomSeasonListHandler implements CommandHandler {
	private int size = 5;//한 페이지에 보일 게시물의 개수
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RoomSeasonDAO dao = RoomSeasonDAO.getInstance();
			
			//페이징
			String pageNoVal = request.getParameter("pageNo");
			int pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			int total = dao.selectCountRoomSeason(conn);
			List<RoomSeason> list = dao.selectRoomSeason(conn, (pageNo -1)*size, size);
			PageMaker page = new PageMaker(total, pageNo, size);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			
			return "/WEB-INF/view/room/season/rsList.jsp";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
