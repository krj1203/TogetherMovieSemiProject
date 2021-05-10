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
 * Servlet implementation class mainImage
 */
@WebServlet("/ImageLoad.do")
public class RecomImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecomImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		
		MainService mservice = new MainService();
		
		ArrayList<MovieInfo> MList = mservice.selectRList(1);
		ArrayList<MovieFile> fList = mservice.selectRList(2);
		
		System.out.println("SERLVET : MList" + MList);
		System.out.println("SERLVET : fList" + fList);
		ArrayList<MainPage> RList = new ArrayList<MainPage>();
		//Gson으로 넘기기위해 MainPage정보 하나만 넘겨야함
		for(int i = 0; i < MList.size(); i ++) {
			MainPage mp = new MainPage(); 
			mp.setMovieNo(MList.get(i).getMovieNo());
			mp.setMovieTitle(MList.get(i).getMovieTitle());
			for(int j = 0; j < fList.size(); j++) {
				if(MList.get(i).getMovieNo() == fList.get(j).getMovieNo()) {
					mp.setChangeName(fList.get(j).getChangeName());
				}
			}
			
			RList.add(mp);
		}
		System.out.println("RLIST:" + RList);
		String page = null;
		response.setContentType("application/json; charset=UTF-8");
		Gson Mgson = new Gson();
		
		if(MList != null && fList != null) {
			//request.setAttribute("MList", MList);
			//request.setAttribute("fList", fList);
			Mgson.toJson(RList,response.getWriter());
			//page = "index.jsp";
		}else {
			//request.setAttribute("MList", MList);
			//request.setAttribute("msg", "오늘의 추천영화에서 오류가 발생햇습니다");
//			page = "index.jsp";
		}
		//request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

