package goods.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertPayServlet
 */
@WebServlet("/insertpay.gs")
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
		System.out.println("서버 넘어옴");
		System.out.println(request.getParameter("title"));
		
		/*
		 * HttpSession session = request.getSession(); Member member =
		 * (Member)session.getAttribute("loginUser");
		 * 
		 * // 유저아이디 , 주소 , 핸드폰번호 , 금액 , 수량 , 결재상태(주문완료) String user_id =
		 * member.getUser_id(); String address = member.getAddress(); String phone =
		 * member.getPhone(); String pay = request.getParameter("amount"); String count
		 * = request.getParameter("count");
		 */
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
