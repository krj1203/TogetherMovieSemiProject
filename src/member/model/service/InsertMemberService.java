package member.model.service;


import static db.JdbcUtil.*;
import java.sql.Connection;

import member.model.dao.InsertMemberDAO;
import member.model.vo.Member;

public class InsertMemberService {

	
public int insertMember(Member member) {
		
		Connection con = getConnection();
		
		InsertMemberDAO insertMemberDAO = InsertMemberDAO.getInstance();
		insertMemberDAO.setConnection(con);
		
		int result =  insertMemberDAO.insertMember(member);
		
		close(con);
		
		return result;
		
	}
}
