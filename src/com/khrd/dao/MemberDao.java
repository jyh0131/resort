package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.List;

import com.khrd.dto.Member;
import com.khrd.jdbc.JDBCUtil;

public class MemberDao {

	private static final MemberDao dao = new MemberDao();
	
	public static MemberDao getInstance() {
		
		return dao;		
	}
	private MemberDao() {	
			
	}
	
	public int MemberJoin(Connection conn, Member member){
		
		PreparedStatement pstmt = null;
	
		try {			
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,member.getmId());		
			pstmt.setString(2,member.getmPassword());	
			pstmt.setString(3,member.getmName());	
			pstmt.setString(4,member.getmPhone());	
			pstmt.setString(5,member.getmEmail());	
			pstmt.setTimestamp(6, new java.sql.Timestamp(member.getmRegdate().getTime()));
			pstmt.setInt(7,member.getmOut());	
			pstmt.setInt(8,member.getmAdmin());	
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
			
		return -1;
	}
	
	public int MemeberUpdate(Connection conn, Member member){
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set m_password = ?, m_phone = ?, m_email = ?, m_regdate = ? where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getmPassword());
			pstmt.setString(2, member.getmPhone());
			pstmt.setString(3, member.getmEmail());
			pstmt.setTimestamp(4, new java.sql.Timestamp(member.getmRegdate().getTime()));
			pstmt.setString(5, member.getmId());
			
		}catch(Exception e) {
			
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		
		return -1;
	}
	
	public int LogIn(Connection conn){
		
		return -1;		
	}
	
	public int LogOut(Connection conn){
		
		return -1;
	}
	
	public List<Member> MemberSelect(Connection conn){
		
		return null;
	}
	
	public List<Member> MemberSelectByID(Connection conn){
		
		return null;
	}
	
	public int withdraw(Connection conn) {
		
		
		
		return -1;
	}
	
}
