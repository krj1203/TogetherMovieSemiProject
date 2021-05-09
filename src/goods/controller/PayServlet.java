package goods.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PayServlet
 */
@WebServlet("/pay.gs")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String count = request.getParameter("count");
		String title = request.getParameter("title");
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		
		System.out.println("넘어오나? : " + title);
		
		request.setAttribute("amount", amount);
		request.setAttribute("count", count);
		request.setAttribute("title", title);
		request.setAttribute("gNo", gNo);
		
		
		request.getRequestDispatcher("contents/goods/pay.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
