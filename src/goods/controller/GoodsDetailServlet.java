package goods.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import goods.model.service.GoodsService;
import goods.model.vo.Goods;
import goods.model.vo.GoodsInfo;

/**
 * Servlet implementation class GoodsDetailServlet
 */
@WebServlet("/detail.gs")
public class GoodsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		System.out.println("상품 번호" + gNo);
		
		GoodsService service = new GoodsService();
		
		Goods goods = service.selectGoods(gNo);
		ArrayList<GoodsInfo> fileList = service.selectGoodsInfo(gNo);
		
		String page = null;
		if(fileList != null) {
			request.setAttribute("goods", goods);
			request.setAttribute("fileList", fileList);
			page="contents/goods/buy.jsp";
			
		} else {
			request.setAttribute("msg", "상품 상세보기 실패");
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
