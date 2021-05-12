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
import board.model.vo.PageInfo;
import goods.model.vo.Pay;
import member.model.vo.Member;
import mypage.model.service.mypageService;

/**
 * Servlet implementation class FreeboardListServlet
 */
@WebServlet("/cList.mp")
public class cListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = null;
		
		Member session = (Member)request.getSession().getAttribute("loginUser");
		mypageService mpService = new mypageService();
		
		if(session == null) {
			page = "goMain.ma";
		} else {
			String uId = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_id();
			int uNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no();
		
			int listCount;
			int currentPage;
			int pageLimit;
			int boardLimit;
			int maxPage;
			int startPage;
			int endPage;
			
			listCount = mpService.getcListCount(uNo);
			
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			pageLimit = 10;
			boardLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			ArrayList<Comment> cList = mpService.selectcList(pi, uNo);
			ArrayList<Board> bList = mpService.selectbList(pi, uNo);
		
			page = "contents/myPage/cListDetail.jsp";
				request.setAttribute("cList", cList);
				request.setAttribute("bList", bList);
				request.setAttribute("pi", pi);
		}
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
