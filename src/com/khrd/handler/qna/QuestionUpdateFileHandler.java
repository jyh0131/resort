package com.khrd.handler.qna;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionUpdateFileHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int qNo = Integer.parseInt(req.getParameter("no"));
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();
			int result = dao.updateQuestionFile(conn, qNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", result);
			
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
