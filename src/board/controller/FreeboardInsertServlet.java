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
 * Servlet implementation class FreeboardInsertServlet
 */
@WebServlet("/insert.fb")
public class FreeboardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) { // enctyp이 multipart/form-data인지 검사
			System.out.println("BIinsertServelt 들어옴");
			
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/"); // root로 이동
			String savePath = root + "BoardInfo_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			String category = multipartRequest.getParameter("category");
			int uNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no();
			
			Board b = new Board();
			b.setBoardCategory(null);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardCategory(category);
			b.setUsersNo(uNo);
			b.setBoardCode(1);
			b.setBoardType(2);
			
			ArrayList<BoardInfo> fileList = new ArrayList<BoardInfo>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				BoardInfo bi = new BoardInfo();
				bi.setFilePath(savePath);
				bi.setOriginName(originFiles.get(i));
				bi.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
	        		 bi.setFileLevel(0);
	        	 } else {
	        		 bi.setFileLevel(1);
	        	 }
				
				fileList.add(bi);
			}
			
			int result = 0;
			
			if(fileList == null || fileList.isEmpty()) {
				result = new BoardService().insertBoard(b);
			} else if(fileList != null || !fileList.isEmpty()) {
				result = new BoardService().insertBoardInfo(b, fileList);
			}
			System.out.println("bi insert servlet result : " + result);
			if(result > 0) {
				response.sendRedirect("list.fb");
			} else {
				request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
				for(int i = 0; i < saveFiles.size(); i++) { // 쌓이는 파일 지우기
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
				request.getRequestDispatcher("contents/common/errorPage.jsp").forward(request,response);
			}
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
