package member.model.service;



import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.model.dao.UpdateMemberDAO;
import member.model.vo.Member;




public class UpdateMemberService {

	public int updateMember(Member member) {
		
		Connection con = getConnection();
		
		UpdateMemberDAO updateMemberDAO = UpdateMemberDAO.getInstance();
		updateMemberDAO.setConnection(con);
		
		int result = updateMemberDAO.updateMember(member);
		
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
