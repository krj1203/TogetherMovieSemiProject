package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Comment;
import member.model.vo.Member;
import mypage.model.service.mypageService;

/**
 * Servlet implementation class commentListServlet
 */
@WebServlet("/mypage.mp")
public class mypageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		int uNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no();
		
		mypageService mpService = new mypageService();
		
		ArrayList<Board> bList = mpService.selectbList(uNo);
		ArrayList<Comment> cList = mpService.selectcList(uNo);
		ArrayList<Board> qList = mpService.selectqList(uNo);
		
		String page = "contents/myPage/myPage.jsp";
			request.setAttribute("bList", bList);
			request.setAttribute("cList", cList);
			request.setAttribute("qList", qList);
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
