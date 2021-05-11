package goods.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import goods.model.service.GoodsService;
import goods.model.vo.Pay;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertPayServlet
 */
@WebServlet("/insertPay.gs")
public class InsertPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		int gNo = Integer.parseInt(request.getParameter("gNo")); // 상품 번호
		String title = request.getParameter("title"); // 상품 제목
		String userId = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_id(); // 유저 아이디
		int amount = Integer.parseInt(request.getParameter("amount")); // 총금액
		int count = Integer.parseInt(request.getParameter("count")); // 수량
		String email = ((Member)(request.getSession().getAttribute("loginUser"))).getAddress(); // 유저 주소 
		
		Pay p = new Pay();
		p.setGoodsNo(gNo);
		p.setTitle(title);
		p.setUserId(userId);
		p.setAmount(amount);
		p.setCount(count);
		p.setEmail(email);
		
		int result = new GoodsService().insertPay(p);
		
		if(result > 0 ) {
			response.sendRedirect("list.gs");
		} else {
			request.setAttribute("msg", "상품 결재실패");
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
