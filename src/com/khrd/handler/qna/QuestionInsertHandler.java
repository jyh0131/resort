package com.khrd.handler.qna;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QuestionInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/qna/question/questionInsertForm.jsp";
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
			String qTitle = multi.getParameter("title");
			String qType = multi.getParameter("type");
			String qContent= multi.getParameter("content");
			String qFile = multi.getFilesystemName("file");
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				QuestionDAO dao = QuestionDAO.getInstance();
				Question question = new Question(0, qTitle, qType, qContent, qFile, null, mId);
				dao.insertQuestion(conn, question);
				res.sendRedirect(req.getContextPath()+"/question/list.do");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}
}
