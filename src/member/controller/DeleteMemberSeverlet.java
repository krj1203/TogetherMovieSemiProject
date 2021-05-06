package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.DeleteMemberServcie;
import member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberSeverlet
 */
@WebServlet("/deleteMember.do")
public class DeleteMemberSeverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberSeverlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("contents/deleteMember/deleteMember.jsp");
		dispatcher.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		String user_password = request.getParameter("user_password");
		
		
		HttpSession session = request.getSession(); 
		
		Member member = (Member)session.getAttribute("loginUser");
		String user_id = member.getUser_id();

		DeleteMemberServcie deleteMemberService = new	DeleteMemberServcie();
		
		int result = deleteMemberService.deleteMember(user_id,user_password);
		
		if(result == 1) {
			HttpSession sesssion = request.getSession();
			session.invalidate();
			
			response.sendRedirect(request.getContextPath());
		}
		
		System.out.println(user_id);
		System.out.println(user_password);
		
		
	
		
		
	}

}
