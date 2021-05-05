package member.controller;
//��Ű�� ����

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.InsertMemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/insertMember.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("contents/InsertMember/InsertMember.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_nickName = request.getParameter("user_nickName");
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String phone = request.getParameter("phone");
		String user_email = request.getParameter("user_email");
		String address = request.getParameter("address");

		
		
		Member member = new Member();
		
		member.setUser_id(user_id);
		member.setUser_nickName(user_nickName);
		member.setUser_name(user_name);
		member.setUser_password(user_password);
		member.setPhone(phone);
		member.setUser_email(user_email);
		member.setAddress(address);
		
		
		InsertMemberService insertMemberService = new InsertMemberService();
		int result =  insertMemberService.insertMember(member);
		
		if(result == 1) {
			response.sendRedirect(request.getContextPath());
			
		}else {
						
			
		}
		
	
		
		
	}

		
		
		
		
		
		
		
		
		
}


