package member.model.service;


import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.model.dao.UpdateUserPasswordDAO;


public class UpdateUserPasswordService {

	public int updateUserPassword(String user_id, String user_newPassword) {
		
		UpdateUserPasswordDAO updateUserPasswordDAO = UpdateUserPasswordDAO.getInstance();
		
		Connection con = getConnection();
		
		updateUserPasswordDAO.setConnection(con);
		
		int result = updateUserPasswordDAO.updateUserPassword(user_id,user_newPassword);
		

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		return result;
	}
	
}
