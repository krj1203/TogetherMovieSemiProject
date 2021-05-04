package member.model.vo;
//��Ű�� ����

import java.sql.Date;

public class Member {
	
	private int user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_nickName;
	private String user_email;
	private String address;
	private Date hireDate;
	private int grade;
	private String status;
	
	public Member() {}
	public Member(int user_no, String user_id, String user_password, String user_name, String user_nickName,
			String user_email, Date hireDate, int grade, String status, String address) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_nickName = user_nickName;
		this.user_email = user_email;
		this.hireDate = hireDate;
		this.grade = grade;
		this.status = status;
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickName() {
		return user_nickName;
	}
	public void setUser_nickName(String user_nickName) {
		this.user_nickName = user_nickName;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", user_name=" + user_name + ", user_nickName=" + user_nickName + ", user_email=" + user_email
				+ ", hireDate=" + hireDate + ", grade=" + grade + "]";
	}
	
	
	

}
