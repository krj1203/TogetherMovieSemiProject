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
import board.model.vo.BoardInfo;
import board.model.vo.Comment;

/**
 * Servlet implementation class FreeBoardDetailServlet
 */
@WebServlet("/detail.fb")
public class FreeboardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		BoardService bService = new BoardService();
		
		Board board = bService.selectfBoard(bNo);
		BoardInfo biList = bService.selectImage(bNo);
		
		if(biList.getfileNo() == 0) {
			biList = null;
		}
		
		ArrayList<Comment> list = new BoardService().selectCommentList(bNo);
		
		String page = null;
		if(board != null) {
			request.setAttribute("board", board);
			request.setAttribute("biList", biList);
			request.setAttribute("list", list);
			page = "contents/Freeboard/FreeboardDetail.jsp";
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
