package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.NickNameCheckService;

/**
 * Servlet implementation class NickNameCheckServlet
 */
@WebServlet("/nickNameCheck.do")
public class NickNameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NickNameCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_nickName = request.getParameter("user_nickName");
		NickNameCheckService nickNameCheckService = new NickNameCheckService();
		int result = nickNameCheckService.confirm(user_nickName);
		
		
		request.setAttribute("user_nickName", user_nickName);
		request.setAttribute("result", result);
		RequestDispatcher dispatcher =request.getRequestDispatcher("contents/nickNameCheck/nickNameCheck.jsp");
		dispatcher.forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
