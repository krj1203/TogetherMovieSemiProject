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
 * Servlet implementation class updateCinemaServlet
 */
@WebServlet("/updateFCinema.do")
public class updateCinemaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCinemaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("cinema_name");
		String topic = request.getParameter("topic");
		int code = Integer.parseInt(request.getParameter("code"));
		String company = request.getParameter("company");
		String area = request.getParameter("area");
		String site = request.getParameter("site");
		String map = request.getParameter("map");
		String floor = request.getParameter("floor");
		String adress = request.getParameter("adress");
		String pGuide = request.getParameter("guide");
		String pConfirm = request.getParameter("confirm");
		String pPay = request.getParameter("pay");
		String bus = request.getParameter("bus");
		String metro = request.getParameter("metro");
		String[] avArr = request.getParameterValues("avail");
		String avail = "";
		
		if(avArr != null) {
			for(int i = 0; i < avArr.length; i++) {
				if(i == avArr.length - 1) {
					avail += avArr[i];
				}else {
					avail += avArr[i] + ", ";
				}
			}
		}
		
		
		Cinema cinema = new Cinema(no, name, topic, avail, adress, site, map, "Y", area, pConfirm
								,pGuide, pPay, null, company, floor, bus, metro, code);
		
		int result = new CinemaService().updateFCinema(cinema);
		
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
