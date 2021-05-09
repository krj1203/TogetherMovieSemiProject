package member.model.service;


import static db.JdbcUtil.*;
import java.sql.Connection;

import member.model.dao.DeleteMemberDAO;

public class DeleteMemberServcie {

	public int deleteMember(String user_id, String user_password) {
		
		DeleteMemberDAO deleteMemberDAO =  DeleteMemberDAO.getInstance();
		
		Connection con = getConnection();
		
		deleteMemberDAO.setConnetion(con);
		
		int result = deleteMemberDAO.deleteMember(user_id,user_password);
		
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		
		
		return result;
		
		
		
	}
	


}
