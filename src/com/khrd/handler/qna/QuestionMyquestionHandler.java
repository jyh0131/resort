package com.khrd.handler.qna;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.AnswerDAO;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.khrd.util.PageMaker;

public class QuestionMyquestionHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String mId = (String) session.getAttribute("Auth");
		int size = 5;  //한 페이지에 보일 게시글 수	
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();
			
			//답변 유무 확인
			AnswerDAO daoA = AnswerDAO.getInstance();
			List<Integer> qNoList = daoA.selectListQNo(conn);
			req.setAttribute("qNoList", qNoList);
			
			//페이징
			String pageNoVal = req.getParameter("pageNo");
			int pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			int total = dao.selectCountQuestionByMId(conn, mId);
			List<Question> list = dao.selectDescListQuestionByMid(conn, mId, (pageNo -1)*size, size);
			PageMaker page = new PageMaker(total, pageNo, size);
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			req.setAttribute("size", size);
			return "/WEB-INF/view/qna/question/myQuestion.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
