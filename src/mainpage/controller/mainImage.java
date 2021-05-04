package mainpage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Attachment.model.vo.Attachment;
import mainpage.model.service.MainService;
import mainpage.model.vo.MainPage;

/**
 * Servlet implementation class mainImage
 */
@WebServlet("/ImageLoad.do")
public class mainImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("서버에서 전송한 값입니다");
		
		
		MainService mService = new MainService();
		ArrayList<MainPage> mlist = mService.selectList();
		
		
		String page = null;
		if(mlist != null) {
			request.setAttribute("mList", mlist);
			page = "index.jsp";
		}else {
			request.setAttribute("mList", mlist);
			request.setAttribute("msg", "오늘의 추천영화에서 오류가 발생햇습니다");
			page = "index.jsp";
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
