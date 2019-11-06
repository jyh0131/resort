package com.khrd.handler.notice;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.NoticeDAO;
import com.khrd.dto.Notice;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int nNo = Integer.parseInt(req.getParameter("no"));
			String key = req.getParameter("key");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				NoticeDAO dao = NoticeDAO.getInstance();
				Notice notice = dao.selectNoticeByNNo(conn, nNo);
				String nContent = notice.getnContent().replaceAll("<br>", "\r\n");
				notice.setnContent(nContent);
				
				req.setAttribute("n", notice);
				req.setAttribute("key", key);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return "/WEB-INF/view/notice/noticeUpdateForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			int nNo = Integer.parseInt(req.getParameter("no"));
			String uploadPath = req.getRealPath("upload/notice");
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
			String nCheckVal = multi.getParameter("check");
			int nCheck = 0; //체크박스 미선택 시 0
			if(nCheckVal != null) { //체크박스 선택 시 1
				nCheck = 1;
			}
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				NoticeDAO dao = NoticeDAO.getInstance();
				if(nFile == null) { //새 파일 업로드 안 할 경우 기존 파일 그대로 넣기
					Notice dbNotice = dao.selectNoticeByNNo(conn, nNo);
					nFile = dbNotice.getnFile();
				}
				Notice notice = new Notice(nNo, nTitle, nContent, nFile, null, 0, nCheck, null);
				dao.updateNotice(conn, notice);
				
				String key = req.getParameter("key");
				if(key != null && key.equals("admin")) {
					res.sendRedirect(req.getContextPath()+"/notice/list.do?key=admin");
				}				
				res.sendRedirect(req.getContextPath()+"/notice/detail.do?no="+nNo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}
}
