package com.khrd.handler.notice;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dao.NoticeDAO;
import com.khrd.dto.Notice;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class NoticeDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int nNo = Integer.parseInt(req.getParameter("no"));
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			Notice notice = dao.selectNoticeByNNo(conn, nNo);
			req.setAttribute("n", notice);
			
			//아이디 체크(관리자/사용자)
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			MemberDao daoM = MemberDao.getInstance();
			int admin = daoM.AdminIDCheck(conn, mId);
			req.setAttribute("admin", admin);
			
			return "/WEB-INF/view/notice/noticeDetail.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
