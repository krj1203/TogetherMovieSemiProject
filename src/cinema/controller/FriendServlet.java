package cinema.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinema.model.service.CinemaService;
import cinema.model.vo.Cinema;

/**
 * Servlet implementation class FriendServlet
 */
@WebServlet("/friend.ci")
public class FriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서비스 여러번 사용해주니까 별도로 생성필요
		CinemaService cService = new CinemaService();
		// 리스트를 불러와서 뿌려줘야함
		ArrayList<Cinema> clist = cService.selectCList();
		String page = null;
		//영화관정보
		if(clist != null) {
			request.setAttribute("cList", clist);
			page = "contents/cinema/cinema.jsp";
		}else {
			request.setAttribute("cList", clist);
			request.setAttribute("msg", "영화관(친구)에서 요류가 발생했습니다");
			page = "contents/cinema/cinema.jsp";
		}
		//각각의 vo로 만든 교통정보, 영화관정보, 층별정보, 주차정보 받아와서 뿌려줌 >> 이건 디테일에서 필요할듯
		//vo에 pk들은 적지말고 sql에서 가져와 정보를 뿌려주기만 하면 될 것 같음
		
		
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
