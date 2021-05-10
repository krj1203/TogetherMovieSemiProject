package mainpage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mainpage.model.service.MainService;
import mainpage.model.vo.MainPage;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class SlideImageLoadServlet
 */
@WebServlet("/slideImageLoad.do")
public class SlideImageLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SlideImageLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		
		MainService mservice = new MainService();
		
		ArrayList<MovieInfo> SList = mservice.selectSList(1);
		ArrayList<MovieFile> fList = mservice.selectSList(2);
		
		System.out.println("SERLVET : SList" + SList);
		System.out.println("SERLVET : fList" + fList);
		ArrayList<MainPage> RList = new ArrayList<MainPage>();
		
		for(int i = 0; i < SList.size(); i ++) {
			MainPage mp = new MainPage(); 
			mp.setMovieNo(SList.get(i).getMovieNo());
			mp.setMovieTitle(SList.get(i).getMovieTitle());
			for(int j = 0; j < fList.size(); j++) {
				if(SList.get(i).getMovieNo() == fList.get(j).getMovieNo()) {
					mp.setChangeName(fList.get(j).getChangeName());
				}
			}
			
			RList.add(mp);
		}
		System.out.println("RLIST:" + RList);
		String page = null;
		response.setContentType("application/json; charset=UTF-8");
		Gson Mgson = new Gson();
		
		if(SList != null && fList != null) {
			
			Mgson.toJson(RList,response.getWriter());
			
		}else {
			
			Mgson.toJson(RList,response.getWriter());
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
