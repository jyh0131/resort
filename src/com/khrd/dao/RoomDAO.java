package com.khrd.dao;

import java.sql.Connection;

import com.khrd.dto.Room;

public class RoomDAO {
	private static final RoomDAO dao = new RoomDAO();
	
	public static RoomDAO getInstance() {
		return dao;
	}
	
	private RoomDAO() {}
	
	public int insertRoom(Connection conn,Room room) {
		
		
		
		return -1;
	}
}
