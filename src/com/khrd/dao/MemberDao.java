package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Member;
import com.khrd.jdbc.JDBCUtil;
import com.mysql.fabric.xmlrpc.base.Array;

public class MemberDao {

	private static final MemberDao dao = new MemberDao();
	
	public static MemberDao getInstance() {
		 
		return dao;		
	}
	private MemberDao() {	
			
	}
	// 회원 가입
	public int InsertMember(Connection conn, Member member){
		
		PreparedStatement pstmt = null;
	
		try {			
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,member.getmId());		
			pstmt.setString(2,member.getmPassword());	
			pstmt.setString(3,member.getmName());	
			pstmt.setString(4,member.getmPhone());	
			pstmt.setString(5,member.getmEmail());	
			pstmt.setTimestamp(6, new Timestamp(member.getmRegdate().getTime()));
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
	// 회원 정보 수정
	public int UpdateMember(Connection conn, Member member){
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set m_password = ?, m_phone = ?, m_email = ?, m_regdate = ? where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getmPassword());
			pstmt.setString(2, member.getmPhone());
			pstmt.setString(3, member.getmEmail());
			pstmt.setTimestamp(4, new Timestamp(member.getmRegdate().getTime()));
			pstmt.setString(5, member.getmId());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
						
		return -1;
	}

	// 회원 리스트 검색
	public List<Member> SelectMember(Connection conn){
		
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
	// 아이디 중복체크
	public Member SelectMemberByID(Connection conn,String mId){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql = "select * from member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);		
			rs = pstmt.executeQuery();
				
			while(rs.next()){				
				Member member = new Member(rs.getString("m_id"), rs.getString("m_password"),
						rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
						rs.getInt("m_out"), rs.getInt("m_admin"));											
				return member;
			}			
			
		}catch(Exception e){			
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
				
		return null;
	}
	
	// 아이디와 패스워드로 로그인 
	public Member SelectMemberIDPW(Connection conn, String mId, String mPassword) {
		
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where m_id =? and m_password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPassword);			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			
				Member member = new Member(rs.getString("m_id"), rs.getString("m_password"),
						rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
						rs.getInt("m_out"), rs.getInt("m_admin"));	
				return member;
			};
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
			JDBCUtil.close(rs);
		}
		
		
		return null;
	}
	
	// 회원 탈퇴
	public int WithdrawMember(Connection conn, Member member) {
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set m_out = 1 where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmId());
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}

	//관리자 아이디 로그인
	
	public Member AdminMemberLogin(Connection conn, String mId, String mPassword) {
		
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where m_admin = '1' and m_id = ? and m_password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPassword);			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			
				Member member = new Member(rs.getString("m_id"), rs.getString("m_password"),
						rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getTimestamp("m_regdate"),
						rs.getInt("m_out"), rs.getInt("m_admin"));	
				return member;
			};
					
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
			JDBCUtil.close(rs);
		}
		
		return null;
	}
	
	// 관리자 리스트 검색
	public List<Member> AdminMemberList(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql = "select * from member where m_admin = '1' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Member> list = new ArrayList<>();
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
			JDBCUtil.close(pstmt);
		}
				
		return null;
	}
	
}


