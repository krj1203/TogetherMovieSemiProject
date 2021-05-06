package member.model.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import member.model.dao.NickNameCheckDAO;

public class NickNameCheckService {
	
public int confirm(String user_nickName) {
		
		NickNameCheckDAO nickNameCheckDAO = NickNameCheckDAO.getInstance();
		Connection con = getConnection();
		
		nickNameCheckDAO.setConnection(con);
		
		int result = nickNameCheckDAO.confirm(user_nickName);
		
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		
		close(con);
		
		return result;
		
	}

}
