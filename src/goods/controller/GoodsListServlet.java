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
 * Servlet implementation class GoodsListServlet
 */
@WebServlet("/list.gs")
public class GoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GoodsService gService = new GoodsService();
		
		/*
		 * int listCount; int currentPage; int pageLimit; int boardLimit; int maxPage;
		 * int startPage; int endPage;
		 * 
		 * listCount = gService.getGoodsListCount(); System.out.println("리스트 카운트  : " +
		 * listCount);
		 * 
		 * currentPage = 1; // 처음 페이지
		 * 
		 * if(request.getParameter("currentPage") != null) { currentPage =
		 * Integer.parseInt(request.getParameter("currentPage")); }
		 * 
		 * pageLimit = 10; boardLimit = 10;
		 * 
		 * maxPage = (int)Math.ceil((double)listCount/boardLimit); startPage =
		 * (currentPage - 1) / pageLimit * pageLimit + 1; endPage = startPage +
		 * pageLimit - 1; if(endPage > maxPage) { endPage = maxPage; }
		 * 
		 * PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit,
		 * maxPage, startPage, endPage);
		 */
		// 굿즈리스트 가져오기
		ArrayList<Goods> gList = gService.selectGoodsList(1);
		ArrayList<GoodsInfo> fList = gService.selectGoodsList(2);
		String page = null;
		if(gList != null && fList != null) {
			request.setAttribute("gList", gList);
			request.setAttribute("fList", fList);
			
			page = "contents/goods/goods.jsp";
		} else {
			request.setAttribute("msg", "상품 게시판 조회 실패");
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
