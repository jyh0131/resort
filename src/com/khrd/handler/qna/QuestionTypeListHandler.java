package com.khrd.handler.qna;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionDAO;
import com.khrd.dto.Question;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.khrd.util.PageMaker;

public class QuestionTypeListHandler implements CommandHandler {
	private int size = 10; //한 페이지에 보일 게시글 수
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String qType = req.getParameter("type");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();
			
			//페이징
			String pageNoVal = req.getParameter("pageNo");
			int pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			int total;
		
			List<Question> list;
			if(qType.equals("no")) { //질문 유형 선택 안 한 경우
				total = dao.selectCountQuestion(conn);
				list = dao.selectDescListQuestion(conn, (pageNo -1)*size, size);
			}else{ //질문 유형 선택 한 경우
				total = dao.selectCountQuestionByQType(conn, qType);
				list = dao.selectDescListQuestionByQType(conn, qType, (pageNo -1)*size, size);
			}
		
			PageMaker page = new PageMaker(total, pageNo, size);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("page", page);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
