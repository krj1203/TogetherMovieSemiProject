package member.model.dao;


import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NickNameCheckDAO {
	
	private static  NickNameCheckDAO  nickNameCheckDAO;
	private Connection con;
	
	private  NickNameCheckDAO() {}
	
	public static  NickNameCheckDAO getInstance() {
		
		if( nickNameCheckDAO == null) {
			 nickNameCheckDAO= new  NickNameCheckDAO();
		}
		return  nickNameCheckDAO;
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int confirm(String user_nickName) {
		
		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("SELECT USERS_NICKNAME FROM USERS WHERE USERS_NICKNAME=? AND STATUS='Y'");
			pstmt.setString(1, user_nickName);
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
