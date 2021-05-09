package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
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
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board b = new Board();
		b.setBoardNo(bNo);
		b.setBoardCategory(category);
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setBoardType(1);
		b.setBoardCode(2);
		
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {
			response.sendRedirect("detail.bo?bCode="+bCode+"&bNo="+bNo);
			request.setAttribute("bCate", bCate);
		} else {
			request.setAttribute("msg", "게시글 수정을 실패했습니다.");
			request.getRequestDispatcher("contents/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
