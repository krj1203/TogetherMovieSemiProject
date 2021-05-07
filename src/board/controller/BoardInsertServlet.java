package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		int bCode = 0;
		switch(category){
			case "서울" : bCode = 0; break;
			case "경기" : bCode = 1; break;
			case "강원" : bCode = 2; break;
			case "충청" : bCode = 3; break;
			case "전라" : bCode = 4; break;
			case "경상" : bCode = 5; break;
			case "제주" : bCode = 6; break;
			case "기타" : bCode = 7; break;
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int writer = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no(); // 유저 아이디가 아니라 유저 번호 받아옴
		
		Board b = new Board();
		b.setBoardCategory(category);
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setUsersNo(writer);
		b.setBoardType(1); // 일반게시판
		
		int result = new BoardService().insertBoard(b);
		
		if(result > 0) {
			response.sendRedirect("list.bo?bCode="+bCode);
		} else {
			request.setAttribute("msg", "게시물 등록에 실패했습니다.");
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
