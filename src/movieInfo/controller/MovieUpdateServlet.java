package movieInfo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardInfo;
import common.MyFileRenamePolicy;
import member.model.vo.Member;
import movieInfo.model.service.MovieInfoService;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class MovieUpdateServlet
 */
@WebServlet("/movieUpdate.mv")
public class MovieUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "uploadFiles/"; 
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			int no = Integer.parseInt(multipartRequest.getParameter("no"));
			String thumbnail = multipartRequest.getParameter("thumbnail");
			String title = multipartRequest.getParameter("title");
			String date = multipartRequest.getParameter("date");
			String director = multipartRequest.getParameter("director");
			String actor = multipartRequest.getParameter("actor");
			String genre = multipartRequest.getParameter("genre");
			String runningtime = multipartRequest.getParameter("runningtime");
			String age = multipartRequest.getParameter("age");
			int movieCode = Integer.parseInt(multipartRequest.getParameter("movieCode"));
			
			System.out.println("movieUpdateServlet:" + movieCode);
			
			MovieInfo ff = new MovieInfo();
			ff.setMovieNo(no);
			ff.setMovieTitle(title);
			ff.setMovieDate(date);
			ff.setDirector(director);
			ff.setActor(actor);
			ff.setGenre(genre);
			ff.setRunningTime(runningtime);
			ff.setAge(age);
			ff.setMovieCode(movieCode);
			
			MovieFile mf = new MovieFile();
			mf.setChangeName(thumbnail);
			
			Enumeration<String> files = multipartRequest.getFileNames();
			if(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multipartRequest.getFilesystemName(name) != null) {
					// getFilesystemName(name) : MyFileRenamePolicy.rename()에서 작성한대로 rename된 파일명 변환
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
					// multipartRequest.getOriginalFileName(name) : 실제 업로드된 파일 이름 반환
				}
			}
			
			
			ArrayList<MovieFile> fileList = new ArrayList<MovieFile>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				mf.setFilePath(savePath);
				mf.setOriginName(originFiles.get(i));
				mf.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
	        		 mf.setFileLevel(0);
	        	 } else {
	        		 mf.setFileLevel(1);
	        	 }
				
				fileList.add(mf);
			}
			
			int result = 0;
		
			
			
			result = new MovieInfoService().updateMovieInfo(ff, fileList);
			
			String page = null;
			
			int num = ff.getMovieCode();
			if(result > 0) {	
				if(num == 1) {
					request.getRequestDispatcher("contents/movieInfo_Board/boxoffice/boxOffcie.jsp").forward(request, response);
				}else if (num == 2) {
					request.getRequestDispatcher("contents/movieInfo_Board/latestMovie/latestMovie.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("contents/movieInfo_Board/ScheduledMovie/scheduledMovie.jsp").forward(request, response);
				}
			
			} else {
				request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
				for(int i = 0; i < saveFiles.size(); i++) { 
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
				request.getRequestDispatcher("contents/common/errorPage.jsp").forward(request,response);
			}
			
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
