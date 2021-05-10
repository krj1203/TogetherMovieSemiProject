package board.controller;

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
import member.model.vo.Member;

/**
 * Servlet implementation class QnaBoardUpdateFormServlet
 */
@WebServlet("/boardUpdateForm.qna")
public class QnaBoardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardUpdateFormServlet() {
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
			b.setBoardCode(3);
			b.setBoardType(3);
			System.out.println(category);
			request.setAttribute("b", b);
			request.setAttribute("cate", category);
			request.getRequestDispatcher("contents/qnaBoard/qnaBoardUpdate.jsp").forward(request, response);
			
			
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
