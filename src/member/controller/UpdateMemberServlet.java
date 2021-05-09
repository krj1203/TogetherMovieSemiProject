package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.UpdateMemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/updateMember.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("contents/updateMember/updateMember.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("loginUser");
		
		
		String user_id = request.getParameter((String) session.getAttribute("loginUser.user_id"));
		String user_name = request.getParameter("user_name");
		String phone = request.getParameter("phone");
		String user_email = request.getParameter("user_email");
		String address = request.getParameter("address");
		
		
		System.out.println(user_id);
		
		
		
		
		
		member.setUser_name(user_id);
		member.setUser_name(user_name);
		member.setPhone(phone);
		member.setUser_email(user_email);
		member.setAddress(address);
		
		UpdateMemberService updateMemberService = new UpdateMemberService();
		int result = updateMemberService.updateMember(member);
		
		if(result == 1) {
			response.sendRedirect(request.getContextPath());
		}
		
	}

}
