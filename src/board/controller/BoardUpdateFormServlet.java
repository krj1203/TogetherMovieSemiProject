package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateFormServlet
 */
@WebServlet("/boardUpdateForm.bo")
public class BoardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormServlet() {
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
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		Board b = new Board();
		b.setBoardNo(bNo);
		b.setBoardTitle(title);
		b.setBoardCategory(category);
		b.setBoardContent(content);
		b.setBoardType(1);
		System.out.println("BoardUpdateFormServlet : " + b);
		request.setAttribute("b", b);
		request.setAttribute("bCate", bCate);
		request.getRequestDispatcher("contents/board/boardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
