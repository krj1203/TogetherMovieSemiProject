package member.model.dao;



import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.model.vo.Member;

public class UpdateMemberDAO {
	
	
	private static UpdateMemberDAO updateMemberDAO;
	private Connection con;
	
		
	public static UpdateMemberDAO getInstance() {
		if(updateMemberDAO == null) {
			updateMemberDAO = new UpdateMemberDAO();
		}
		return updateMemberDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
		
	}

	public int updateMember(Member member) {
		

		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	
		
		try {
			pstmt = con.prepareStatement("UPDATE USERS SET USERS_NAME=?,PHONE=?,USERS_EMAIL=?,USERS_ADDRESS=? WHERE USERS_ID = ?");
			pstmt.setString(1, member.getUser_name());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getUser_email());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getUser_id());
			
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else {
				result = -1;
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				close(rs);
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}




}
