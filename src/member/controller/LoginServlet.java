package member.controller;
//占쏙옙키占쏙옙 占쏙옙占쏙옙

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.LoginService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("contents/loginMain/loginMain.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "contents/loginMain/loginMain.jsp";

		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");

		String beforeUrl = request.getParameter("beforeUrl");

		LoginService loginService = new LoginService();
		int result = loginService.doLogin(userId, userPassword);

		if (result == 1) {
			Member member = loginService.getMember(userId);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", member);

			response.sendRedirect(beforeUrl);

		} else if (result == 0 || result == -1) {
			request.setAttribute("message", "�븘�씠�뵒�굹 鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);

		}
	}

}
