package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.vo.Board;
import board.model.vo.Comment;
import goods.model.vo.Pay;
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
		request.setCharacterEncoding("UTF-8");
		
		
		int uNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no();
		String uId = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_id();
		
		
		mypageService mpService = new mypageService();
		
		ArrayList<Board> bList = mpService.selectbList(uNo);
		ArrayList<Comment> cList = mpService.selectcList(uNo);
		ArrayList<Board> qList = mpService.selectqList(uNo);
		ArrayList<Pay> pList = mpService.selectpList(uId);
		
		
		
		String page = "contents/myPage/myPage.jsp";
			request.setAttribute("bList", bList);
			request.setAttribute("cList", cList);
			request.setAttribute("qList", qList);
			request.setAttribute("pList", pList);
		
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
