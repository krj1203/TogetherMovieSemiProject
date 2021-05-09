package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardInfo;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class FreeboardUpdateFormServlet
 */
@WebServlet("/boardUpdateForm.fb")
public class FreeboardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/"); // root로 이동
			String savePath = root + "BoardInfo_uploadFiles/";
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int bNo = Integer.parseInt(multipartRequest.getParameter("bNo"));
			String category = multipartRequest.getParameter("category");
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			int uNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no();
			
			Board b = new Board();
			b.setBoardNo(bNo);
			b.setBoardCategory(category);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setUsersNo(uNo);
			b.setBoardCode(1);
			b.setBoardType(2);
			System.out.println(category);
			request.setAttribute("b", b);
			request.setAttribute("cate", category);
			request.getRequestDispatcher("contents/Freeboard/FreeboardUpdate.jsp").forward(request, response);
			
			
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
