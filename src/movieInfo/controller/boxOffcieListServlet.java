package movieInfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieInfo.model.service.MovieInfoService;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class boxOffcieListServlet
 */
@WebServlet("/listBMovie")
public class boxOffcieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boxOffcieListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MovieInfoService mService =  new MovieInfoService();
		
		ArrayList<MovieInfo> BmList = mService.selectBList(1);
		ArrayList<MovieFile> fList = mService.selectBList(2);
		
		
		String page = null;
		if(BmList != null && fList != null) {
			request.setAttribute("BmList", BmList);
			request.setAttribute("fList", fList);
			page = "contents/movieInfo_Board/boxoffice/boxOffcie.jsp";
		}else {
			request.setAttribute("msg", "게시글 조회 실패");
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
