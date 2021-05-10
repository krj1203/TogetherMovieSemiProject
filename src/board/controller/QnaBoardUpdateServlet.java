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
 * Servlet implementation class QnaBoardUpdateServlet
 */
@WebServlet("/update.qna")
public class QnaBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/"); 
			String savePath = root + "BoardInfo_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			int bNo = Integer.parseInt(multipartRequest.getParameter("bNo"));
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			String category = multipartRequest.getParameter("category");
			int uNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_no();
			Board b = new Board();
			b.setBoardNo(bNo);
			b.setBoardCategory(category);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setUsersNo(uNo);
			b.setBoardCode(3);
			b.setBoardType(3);
			
			BoardInfo bi = new BoardInfo();
			bi.setboardNo(bNo);
			
			Enumeration<String> files = multipartRequest.getFileNames();
			if(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multipartRequest.getFilesystemName(name) != null) {
					// getFilesystemName(name) : MyFileRenamePolicy.rename()에서 작성한대로 rename된 파일명 변환
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
					// multipartRequest.getOriginalFileName(name) : 실제 업로드된 파일 이름 반환
				}
			}
			
			
			ArrayList<BoardInfo> fileList = new ArrayList<BoardInfo>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
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
			System.out.println("fileList : "+fileList);
			
			if(fileList == null || fileList.isEmpty()) {
				result = new BoardService().updateBoard(b);
			} else if(fileList != null || !fileList.isEmpty()) {
				result = new BoardService().updatefBoard(b, fileList);
			}
			
			if(result > 0) {
				response.sendRedirect("detail.qna?bNo="+bNo);
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
