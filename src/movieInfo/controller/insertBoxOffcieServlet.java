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

import common.MyFileRenamePolicy;
import movieInfo.model.service.MovieInfoService;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class insertBoxOffcieServlet
 */
@WebServlet("/BMovieInsert")
public class insertBoxOffcieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertBoxOffcieServlet() {
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
			
			Enumeration<String> files =  multipartRequest.getFileNames(); 
		
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				
				
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				
				}
			}
			
		
			
			
		
			String title  = multipartRequest.getParameter("title");
			String director = multipartRequest.getParameter("director");
			String date = multipartRequest.getParameter("date");
			String actor = multipartRequest.getParameter("actor");
			String genre = multipartRequest.getParameter("genre");
			String runningTime = multipartRequest.getParameter("runningTime");
			String age = multipartRequest.getParameter("age");
			String content = multipartRequest.getParameter("content");
			
			
			
			MovieInfo m = new MovieInfo();
			m.setMovieCode(1);
			m.setMovieTitle(title);
			m.setDirector(director);
			m.setMovieDate(date);
			m.setActor(actor);
			m.setGenre(genre);
			m.setRunningTime(runningTime);
			m.setAge(age);
			m.setContent(content);
			
			
			
			
			ArrayList<MovieFile> fileList = new ArrayList<MovieFile>();
			for(int i= originFiles.size() - 1; i >= 0; i--) {
				MovieFile at = new MovieFile();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size() -1) {
					at.setFileLevel(0);
				}else {
					at.setFileLevel(1);
				}
					
				fileList.add(at);
			}
			int result = new MovieInfoService().insertBMovie(m, fileList);
			
			
			if(result > 0) {
				response.sendRedirect("listBMovie");
			}else {
				request.setAttribute("msg", "게시글 등록에 실패");
				for(int i = 0; i< saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
			}
		}
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
