package com.khrd.dao;

public class NoticeDAO {
	private static final NoticeDAO dao = new NoticeDAO();
	
	private NoticeDAO() {}
	
	public static NoticeDAO getInstance() {
		return dao;
	}
	
	
	
}
