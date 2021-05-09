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
 * Servlet implementation class scheduledMovieListServlet
 */
@WebServlet("/listSMovie")
public class scheduledMovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public scheduledMovieListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieInfoService mService =  new MovieInfoService();
		
		ArrayList<MovieInfo> SmList = mService.selectSList(1);
		ArrayList<MovieFile> fList = mService.selectSList(2);
		

		
		String page = null;
		if(SmList != null && fList != null) {
			request.setAttribute("SmList", SmList);
			request.setAttribute("fList", fList);
			page = "contents/movieInfo_Board/ScheduledMovie/scheduledMovie.jsp";
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
