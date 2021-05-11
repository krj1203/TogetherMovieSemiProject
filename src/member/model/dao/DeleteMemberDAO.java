package member.model.dao;


import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DeleteMemberDAO {
	
	
	private static DeleteMemberDAO deleteMemberDAO;
	private Connection con;
	
	private DeleteMemberDAO() {}
	
	public static DeleteMemberDAO getInstance() {
		if(deleteMemberDAO==null) {
			deleteMemberDAO = new DeleteMemberDAO();
		}
		return deleteMemberDAO;
	}
	
	
	public void setConnetion(Connection con) {
		this.con = con;
		
	}

	public int deleteMember(String user_id) {
		
		int result = -1;
		PreparedStatement pstmt = null;
		
		
		
		
		
		
		try {
			pstmt = con.prepareStatement("UPDATE USERS SET STATUS = 'N' WHERE USERS_ID = ?");
			pstmt.setString(1, user_id);
			
			result = pstmt.executeUpdate();
			
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			try {
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}




}
