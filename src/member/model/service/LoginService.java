package member.model.service;
//패키지 변경


import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import member.model.dao.LoginDAO;
import member.model.vo.Member;

public class LoginService {

	public int doLogin(String userId, String userPassword) {
		
		LoginDAO loginDAO =LoginDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		
		int result = loginDAO.doLogin(userId,userPassword);
		
		close(con);
		
		return result;
		
	}
	

	public Member getMember(String userId) {
		
		LoginDAO loginDAO = LoginDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		Member member = loginDAO.getMember(userId);
		close(con);
		
		return member;
	}

}
