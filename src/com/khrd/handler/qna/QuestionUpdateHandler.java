package com.khrd.handler.qna;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QuestionUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int qNo = Integer.parseInt(req.getParameter("no"));
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				QuestionDAO dao = QuestionDAO.getInstance();
				Question question = dao.selectQuestionByQNo(conn, qNo);
				String qContent = question.getqContent().replaceAll("<br>", "\r\n");
				question.setqContent(qContent);
				
				req.setAttribute("q", question);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return "/WEB-INF/view/qna/question/questionUpdateForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			int qNo = Integer.parseInt(req.getParameter("no"));
			String uploadPath = req.getRealPath("upload/question");
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
			qContent = qContent.replaceAll("\r\n", "<br>");
			String qFile = multi.getFilesystemName("file");
			
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				QuestionDAO dao = QuestionDAO.getInstance();
				if(qFile == null) { //새 파일 업로드 안 할 경우 기존 파일 그대로 넣기
					Question dbQuestion = dao.selectQuestionByQNo(conn, qNo);
					qFile = dbQuestion.getqFile();
				}
				Question question = new Question(qNo, qTitle, qType, qContent, qFile, null, null);
				dao.updateQuestion(conn, question);
				
				res.sendRedirect(req.getContextPath()+"/question/detail.do?no="+qNo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}
}
