package com.khrd.handler.member;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDao;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberIdCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			Connection conn = null;
			
			String id = request.getParameter("id");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				Member member = dao.SelectMemberByID(conn, id);
							
				Map<String, Object> map = new HashMap<String, Object>();				
				map.put("member", member);
			
				if(member == null) {
					map.put("result", "success");
				}else {
					map.put("result", "fail");
				}

				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		
			return "/WEB-INF/view/member/insert.jsp";
				
		}
		return null;
	}

}