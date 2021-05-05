package cinema.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinema.model.vo.Cinema;

/**
 * Servlet implementation class updateCinemaServlet
 */
@WebServlet("/updateFormCinema.ci")
public class updateCinemaFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCinemaFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String topic = request.getParameter("topic");
		String avail = request.getParameter("avail");
		String adress = request.getParameter("adress");
		String site = request.getParameter("site");
		String map = request.getParameter("map");
		String area = request.getParameter("area");
		String confirm = request.getParameter("confirm");
		String guide = request.getParameter("guide");
		String pay = request.getParameter("pay");
		String floor = request.getParameter("floor");
		String bus = request.getParameter("bus");
		String metro = request.getParameter("metro");
		int code = Integer.parseInt(request.getParameter("code"));
		
		Cinema c = new Cinema(no, name, topic, avail, adress, site, map, area, confirm, guide, 
				pay, floor, bus, metro, code);
		System.out.println("update c >>" + c.getCn_metro());
		
		request.setAttribute("c", c);
		request.getRequestDispatcher("contents/cinema/writeForm/updateCinemaForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
