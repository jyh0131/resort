package com.khrd.service;

import java.sql.Connection;
import java.util.List;

import com.khrd.dao.NoticeDAO;
import com.khrd.dto.Notice;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class NoticeListService {
	private NoticeDAO dao = NoticeDAO.getInstance();
	private int size = 10; //한 페이지에 보일 게시글 수
	
	public NoticePage getNoticePage(int pageNum) { //페이지 번호
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			int total = dao.selectCountNotice(conn);
			List<Notice> list = dao.selectDescListNotice(conn, (pageNum -1)*size, size);
			NoticePage noticePage = new NoticePage(total, pageNum, size, list);
			return noticePage;	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return null;
	}
	
}
