package board.controller;

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

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		String bCate = null;
		switch(bCode) {
			case 0: bCate = "서울"; break;
			case 1: bCate = "경기"; break;
			case 2: bCate = "강원"; break;
			case 3: bCate = "충청"; break;
			case 4: bCate = "전라"; break;
			case 5: bCate = "경상"; break;
			case 6: bCate = "제주"; break;
			case 7: bCate = "기타"; break;
		}
		
		ArrayList<Comment> list = new BoardService().selectCommentList(bNo);
		
		Board board = new BoardService().selectBoard(bCate, bNo);
		System.out.println("BoardDetailServlet : " + board);
		String page = null;
		if(board != null) {
			page = "contents/board/boardDetail.jsp";
			request.setAttribute("board", board);
			request.setAttribute("bCate", bCate);
			request.setAttribute("list", list);
		} else {
			page = "contents/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
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
