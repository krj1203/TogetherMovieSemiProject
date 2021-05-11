package movieInfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieInfo.model.service.MovieInfoService;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class MovieUpdateServlet
 */
@WebServlet("/updateFormMovie.mv")
public class MovieUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String thumbnail = request.getParameter("thumbnail");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String director = request.getParameter("director");
		String actor = request.getParameter("actor");
		String genre = request.getParameter("genre");
		String runningtime = request.getParameter("runningtime");
		String age = request.getParameter("age");
		String content = request.getParameter("content");
		int movieCode = Integer.parseInt(request.getParameter("movieCode"));
		
	
		
		MovieInfo m = new MovieInfo();
		MovieFile f = new MovieFile();
		
		m.setMovieNo(no);
		m.setMovieTitle(title);
		m.setMovieDate(date);
		m.setDirector(director);
		m.setActor(actor);
		m.setGenre(genre);
		m.setRunningTime(runningtime);
		m.setAge(age);
		m.setContent(content);
		m.setMovieCode(movieCode);
		
		f.setChangeName(thumbnail);
		
		
	
		request.setAttribute("m", m);
		request.setAttribute("f", f);
		
		
		request.getRequestDispatcher("contents/movieInfo_Board/UpdateMovieForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
