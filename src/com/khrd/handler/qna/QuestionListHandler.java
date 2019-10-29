package com.khrd.handler.qna;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dao.MemberDao;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.khrd.service.QuestionListService;
import com.khrd.service.QuestionPage;

public class QuestionListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {		
		Connection conn = null;    
		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();
			List<Question> list = dao.selectListQuestion(conn);
			req.setAttribute("list", list);
			
			//답변 유무 확인
			AnswerDAO daoA = AnswerDAO.getInstance();
			List<Integer> qNoList = daoA.selectListQNo(conn);
			req.setAttribute("qNoList", qNoList);
			
			//아이디 체크(관리자/사용자)
			HttpSession session = req.getSession();
			String mId = (String) session.getAttribute("Auth");
			MemberDao daoM = MemberDao.getInstance();
			int admin = daoM.AdminIDCheck(conn, mId);
			req.setAttribute("admin", admin);
			
//			//리스트 페이지
//			QuestionListService listService = new QuestionListService();
//			int pageNo = Integer.parseInt(req.getParameter("pageNo"));
//			QuestionPage page = listService.getQuestionPage(pageNo);
//			req.setAttribute("page", page);
			
			req.setAttribute("qNoList", qNoList); 
			return "/WEB-INF/view/qna/qnaList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
