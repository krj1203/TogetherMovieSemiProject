package member.model.dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class IdCheckDAO {
	
	private static IdCheckDAO idCheckDAO;
	private Connection con;
	
	private IdCheckDAO() {}
	
	public static IdCheckDAO getInstance() {
		
		if(idCheckDAO == null) {
			idCheckDAO= new IdCheckDAO();
		}
		return idCheckDAO;
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int confirm(String user_id) {
			
			int result = -1;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = con.prepareStatement("SELECT USERS_ID FROM USERS WHERE USERS_ID=? AND STATUS='Y'");
				pstmt.setString(1, user_id);
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
