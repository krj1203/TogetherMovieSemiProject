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
 * Servlet implementation class latestMovieDetailServlet
 */
@WebServlet("/LMoviedetail.mo")
public class latestMovieDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public latestMovieDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		System.out.println(sNo);
		
		MovieInfoService service = new MovieInfoService();
		
		MovieInfo movieInfo = service.selectMovieInfo(sNo);
		ArrayList<MovieFile> fileList = service.selectMovieFile(sNo);
		
		System.out.println("movieInfo :" + movieInfo);
		System.out.println("MovieFile : " + fileList);
		
		String page = null;
		if(fileList != null) {
			request.setAttribute("movieInfo", movieInfo);
			request.setAttribute("fileList", fileList);
			page="contents/movieInfo_Board/latestMovieDetail.jsp";
			
		} else {
			request.setAttribute("msg", "게시글 상세보기 실패");
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
