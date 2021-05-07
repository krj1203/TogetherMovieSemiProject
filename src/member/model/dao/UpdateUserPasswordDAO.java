package member.model.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateUserPasswordDAO {
	
	private static UpdateUserPasswordDAO updateUserPasswordDAO;
	private Connection con;
	
	private UpdateUserPasswordDAO() {}
	

	
	public static UpdateUserPasswordDAO getInstance() {
		if(updateUserPasswordDAO == null) {
			updateUserPasswordDAO = new UpdateUserPasswordDAO();
		}
		return updateUserPasswordDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
		
	}

	public int updateUserPassword(String user_id, String user_newPassword) {
		
		
		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		
		
		
		try {
			pstmt = con.prepareStatement("UPDATE USERS SET USERS_PWD=? WHERE USERS_ID = ?");
			pstmt.setString(1, user_newPassword);
			
			pstmt.setString(2, user_id);
			
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
