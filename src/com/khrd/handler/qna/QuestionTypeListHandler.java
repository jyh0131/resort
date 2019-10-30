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
import com.khrd.service.QuestionListService;
import com.khrd.service.QuestionPage;

public class QuestionTypeListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String qType = req.getParameter("type");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();
			List<Question> list = dao.selectQuestionListByQType(conn, qType);
			
			//페이징
			QuestionListService listService = new QuestionListService();
			String pageNoVal = req.getParameter("pageNo");
			int pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			QuestionPage page = listService.getQuestionPage(pageNo);
			//req.setAttribute("page", page);
			
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
