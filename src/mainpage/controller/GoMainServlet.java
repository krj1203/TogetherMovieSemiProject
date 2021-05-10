package mainpage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainpage.model.service.MainService;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

/**
 * Servlet implementation class GoMainServlet
 */
@WebServlet("/goMain.ma")
public class GoMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		
		MainService mservice = new MainService();
		
		ArrayList<MovieInfo> RIList = mservice.selectRList(1);
		ArrayList<MovieInfo> SList = mservice.selectSList(1);
		ArrayList<MovieFile> RFList = mservice.selectRList(2);
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println("Gomain : SList : " + SList);
		System.out.println("Gomain : RFList : " + RFList);
		String page = null;
		if(RIList != null && RFList != null && SList !=null) {
			request.setAttribute("RIList", RIList);
			request.setAttribute("FList", RFList);
			request.setAttribute("SList", SList);
			page = "contents/main/Mainpage.jsp";
		}else {
			request.setAttribute("RIList", RIList);
			request.setAttribute("RFList", RFList);
			request.setAttribute("RFList", RFList);
			request.setAttribute("msg", "오늘의 추천영화에서 오류가 발생햇습니다");
			page = "contents/main/Mainpage.jsp";
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
