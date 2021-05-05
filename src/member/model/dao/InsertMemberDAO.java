package member.model.dao;


import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import member.model.vo.Member;

public class InsertMemberDAO {
	
	private static InsertMemberDAO insertMemberDAO;
	private Connection con;
	
	public static InsertMemberDAO getInstance() {
		if(insertMemberDAO == null) {
			insertMemberDAO = new InsertMemberDAO();
		}
		return insertMemberDAO;
	}
	
	public void setConnection(Connection con ) {
		this.con = con;
	}
	
	
	public int insertMember(Member member) {
		int result = -1;
		
		PreparedStatement pstmt = null;

		
		try {
			pstmt = con.prepareStatement("INSERT INTO USERS VALUES(SEQ_UNO.NEXTVAL,?,?,?,?,?,?,SYSDATE,DEFAULT,'Y',?)");
			pstmt.setString(1,member.getUser_id());
			pstmt.setString(2,member.getUser_password());
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, member.getUser_nickName());
			pstmt.setString(5, member.getUser_email());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getPhone());
			
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			
			try {
				commit(con);
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return result;
		
	}

}
