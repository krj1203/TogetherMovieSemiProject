package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.UpdateUserPasswordService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateUserPasswordServlet
 */
@WebServlet("/updateUserPassword.do")
public class UpdateUserPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("contents/updateUserPassword/updateUserPassword.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		String user_newPassword = request.getParameter("user_newPassword");
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		UpdateUserPasswordService updateUserPasswordService = new UpdateUserPasswordService();
		
		int result = updateUserPasswordService.updateUserPassword(user_id,user_newPassword);
		
		
		if(result == 1) {
			response.sendRedirect(request.getContextPath());
		}
		
		
		
		
		
	}

}
