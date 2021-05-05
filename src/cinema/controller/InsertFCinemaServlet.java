package cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinema.model.service.CinemaService;
import cinema.model.vo.Cinema;

/**
 * Servlet implementation class InsertFCinemaServlet
 */
@WebServlet("/InsertFCinema.do")
public class InsertFCinemaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFCinemaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//실험1: 그냥 문자열 쥰내 길게해서 보내기
		String name = request.getParameter("cinema_name");
		String topic = request.getParameter("topic");
		String company = request.getParameter("company");
		String area = request.getParameter("area");
		String site = request.getParameter("site");
		String floor = request.getParameter("floor");
		String adress = request.getParameter("adress");
		String pGuide = request.getParameter("guide");
		String pConfirm = request.getParameter("confzirm");
		String pPay = request.getParameter("pay");
		String bus = request.getParameter("bus");
		String metro = request.getParameter("metro");
		String[] avArr = request.getParameterValues("avail");
		String avail = "";
		int code = 1;
		if(avArr != null) {
			for(int i = 0; i < avArr.length; i++) {
				if(i == avArr.length - 1) {
					avail += avArr[i];
				}else {
					avail += avArr[i] + ", ";
				}
			}
		}
		//맵api하는 방법 알아오기
		Cinema cinema = new Cinema(name, topic, avail, adress, site, null, "Y", area, pConfirm, pGuide, pPay, company, floor, bus, metro, 1);
		
		int result = new CinemaService().insertFCinema(cinema);
		
		if(result > 0) {
			response.sendRedirect("friend.ci");
		} else {
			response.sendRedirect("contents/cinema/writeForm/FcinemaWriteForm.jsp");
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
