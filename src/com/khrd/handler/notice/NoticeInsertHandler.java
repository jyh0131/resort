package com.khrd.handler.notice;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.NoticeDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/notice/noticeInsertForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String uploadPath = req.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			int size = 1024*1024*10;	
			MultipartRequest multi = new MultipartRequest(req,
														uploadPath,  
														size,
														"UTF-8",
														new DefaultFileRenamePolicy());
			String nTitle = multi.getParameter("title");
			String nContent= multi.getParameter("content");
			nContent = nContent.replaceAll("\r\n", "<br>"); 
			String nFile = multi.getFilesystemName("file");
			String nCheck = multi.getParameter("check");
			System.out.println("체크 박스 값 넘어오는 형식 확인 ::::::: " + nCheck);
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				NoticeDAO dao = NoticeDAO.getInstance();
//				Notice notice = new Notice(0, nTitle, nContent, nFile, null, 0, nCheck, mId);
//				dao.insertNotice(conn, notice);
				res.sendRedirect(req.getContextPath()+"/notice/list.do");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
