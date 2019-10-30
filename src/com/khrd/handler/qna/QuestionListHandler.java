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
			
			//질문 유형 체크
//			String qType = req.getParameter("type");
//			System.out.println("qType Handler에 잘 넘어오는지 확인 !!! : " + qType); 
			
//			if(qType == null) {
				//질문 유형 미선택 시
				QuestionListService listService = new QuestionListService();
				String pageNoVal = req.getParameter("pageNo");
				int pageNo = 1;
				if(pageNoVal != null) {
					pageNo = Integer.parseInt(pageNoVal);
				}
				QuestionPage page = listService.getQuestionPage(pageNo);
				req.setAttribute("page", page);
//			}else {
//				//유형 선택 시
//				QuestionTypeListService listService = new QuestionTypeListService();
//				String pageNoVal = req.getParameter("pageNo");
//				int pageNo = 1;
//				if(pageNoVal != null) {
//					pageNo = Integer.parseInt(pageNoVal);
//				}
//				QuestionPage page = listService.getQuestionPage(qType, pageNo);
//				System.out.println("page handler에 잘 넘어오는지 확인 !!! : " + page);
//				
//				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("page", page);
//				
//				ObjectMapper om = new ObjectMapper();
//				String json = om.writeValueAsString(map);
//				res.setContentType("application/json;charset=UTF-8");
//				PrintWriter out = res.getWriter();
//				out.print(json);
//				out.flush();
//			}
			return "/WEB-INF/view/qna/qnaList.jsp";   
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}		
		return null;
	}

}
