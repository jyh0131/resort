package com.khrd.handler.notice;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dao.NoticeDAO;
import com.khrd.dto.Notice;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.khrd.util.PageMaker;

public class NoticeListHandler implements CommandHandler {	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sSize = req.getParameter("size");
		int size = 10;  //한 페이지에 보일 게시글 수	
		if(sSize != null) {
			size = Integer.parseInt(sSize);
		}		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			//아이디 체크(관리자/사용자)
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			MemberDao daoM = MemberDao.getInstance();
			int admin = daoM.AdminIDCheck(conn, mId);
			req.setAttribute("admin", admin);
			
			//페이징
			String pageNoVal = req.getParameter("pageNo");
			int pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			int total = dao.selectCountNotice(conn);
			List<Notice> list = dao.selectDescListNotice(conn, (pageNo -1)*size, size);
			PageMaker page = new PageMaker(total, pageNo, size);
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			req.setAttribute("size", size);
			
			//관리자 페이지
			String key = req.getParameter("key");
			if(key != null && key.equals("admin")) {
				return "/WEB-INF/view/notice/noticeManager.jsp";
			}
			return "/WEB-INF/view/notice/noticeList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
