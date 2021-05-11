package movieInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieInfo.model.service.MovieInfoService;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class MovieDeleteServlet
 */
@WebServlet("/Moviedelete.mv")
public class MovieDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		int result = new MovieInfoService().deleteMovie(no);
		
		MovieInfo mi = new MovieInfoService().selectMovieInfo(no);
	
		String page = null;
		int num = mi.getMovieNo();
		
		  
		
		
		switch (num) {
		case 1: page = "listBMovie"; break;
		case 2: page = "listLMovie"; break;
		case 3: page = "listSMovie"; break;
		} 
		response.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
