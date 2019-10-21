package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
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
	
	public int insertMember(Connection conn, Member member){
		
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
	
	public int updateMember(Connection conn, Member member){
		
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
			e.printStackTrace();
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
	
	public List<Member> selectMember(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member";			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			List<Member> list = new ArrayList<>();			
			while(rs.next()){				
				Member member = new Member(rs.getString("m_id"), rs.getString("m_password"),
						rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
						rs.getInt("m_out"), rs.getInt("m_admin"));											
				list.add(member);
			}			
			return list;
			
		}catch(Exception e){			
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
				
		return null;
	}
	
	public List<Member> selectByIDMember(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where m_id=?";			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			List<Member> list = new ArrayList<>();			
			while(rs.next()){				
				Member member = new Member(rs.getString("m_id"), rs.getString("m_password"),
						rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
						rs.getInt("m_out"), rs.getInt("m_admin"));											
				list.add(member);
			}			
			return list;
			
		}catch(Exception e){			
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
				
		return null;
	}
	
	public int withdrawMember(Connection conn, Member member) {
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set m_out = ? where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getmOut());
			pstmt.setString(2, member.getmId());
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
	
}
