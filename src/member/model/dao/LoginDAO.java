package member.model.dao;
//좀 대세연
//대대대대대세세세ㅔ세여여여ㅕ여여


import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.vo.Member;
public class LoginDAO {
	
	private static LoginDAO loginDAO;
	private Connection con;
	
	private LoginDAO() {}
	
	public static LoginDAO getInstance() {
		if(loginDAO == null) {
			loginDAO = new LoginDAO();
		}
		
		return loginDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int doLogin(String userId, String userPassword) {
		System.out.println("dao도착");
		int result = -1;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		try {
			
			pstmt = con.prepareStatement("SELECT USERS_PWD FROM USERS WHERE USERS_ID=? AND STATUS = 'Y'");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			System.out.println(userPassword);
			System.out.println(con);
			if(rs.next()) {
				System.out.println(rs.getString("USERS_PWD"));
				
				if(rs.getString("USERS_PWD") != null && rs.getString("USERS_PWD").equals(userPassword)) {
					String pwd= rs.getString("USERS_PWD");
					System.out.println(pwd + " / " + userPassword);
					result = 1;
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
		} catch (SQLException e) {
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

	public Member getMember(String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("SELECT * FROM USERS WHERE USERS_ID = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setUser_no(rs.getInt("USERS_NO"));
				member.setUser_id(rs.getString("USERS_ID"));
				member.setUser_password(rs.getString("USERS_PWD"));
				member.setUser_name(rs.getString("USERS_NAME"));
				member.setUser_nickName(rs.getString("USERS_NICKNAME"));
				member.setUser_email(rs.getString("USERS_EMAIL"));
				member.setAddress(rs.getString("USERS_ADDRESS"));
				member.setHireDate(rs.getDate("HIREDATE"));
				member.setGrade(rs.getInt("GRADE"));
				member.setStatus(rs.getString("STATUS"));
				
				
			}
			
	
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				close(rs);
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return member;

	}
	
	
	
}
