package goods.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.vo.Board;
import common.MyFileRenamePolicy;
import goods.model.vo.Goods;
import goods.model.vo.GoodsInfo;
import member.model.vo.Member;

/**
 * Servlet implementation class GoodsUpdateFormServlet
 */
@WebServlet("/update.gs")
public class GoodsUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			int gNo = Integer.parseInt(request.getParameter("gNo"));
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			int price = Integer.parseInt(request.getParameter("price"));
			String img = request.getParameter("img");
			
			
			Goods g = new Goods();
			GoodsInfo gi = new GoodsInfo();
			
			g.setGoods_no(gNo);
			g.setGoods_title(title);
			g.setGoods_contents(contents);
			g.setGoods_price(price);
			gi.setChangeName(img);
			
			
			request.setAttribute("g", g);
			request.setAttribute("gi", gi);
			
			request.getRequestDispatcher("contents/goods/goodsUpdate.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
