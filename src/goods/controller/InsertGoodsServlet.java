package goods.controller;

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

import common.MyFileRenamePolicy;
import goods.model.service.GoodsService;
import goods.model.vo.Goods;
import goods.model.vo.GoodsInfo;

/**
 * Servlet implementation class InsertGoodsServlet
 */
@WebServlet("/insert.gs")
public class InsertGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) { 
			
			int maxSize = 1024*1024*10; // 전송파일 용량 : 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/"); // WebContent로 넘어가기 위해
			String savePath = root + "goods_uploadFiles/";
			
			System.out.println(savePath);
			
			File f = new File(savePath);
	         if(!f.exists()) {
	            f.mkdirs();
	         }
	        
	         
	        MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	         
	        ArrayList<String> saveFiles = new ArrayList<String>(); 	// 바뀐 이름의 파일을 저장할 용도
	        ArrayList<String> originFiles = new ArrayList<String>();	// 원본 이름의 파일을 저장할 용도
	        
	        Enumeration<String> files = multipartRequest.getFileNames();
	         while(files.hasMoreElements()) { // 다음 요소가 있으면
	        	 String name = files.nextElement(); // 값 뽑기
	        	 
	        	 if(multipartRequest.getFilesystemName(name) != null) {
	        		 saveFiles.add(multipartRequest.getFilesystemName(name));
	        		 originFiles.add(multipartRequest.getOriginalFileName(name));
	        	 }
	         }
	        
	        String title = multipartRequest.getParameter("title");
	        int price = Integer.parseInt(multipartRequest.getParameter("price"));
			String content = multipartRequest.getParameter("content");
			
			Goods g = new Goods();
			g.setGoods_title(title); // 상품이름
			g.setGoods_price(price);
			g.setGoods_contents(content);
			
			System.out.println(g);
			
			ArrayList<GoodsInfo> fileList = new ArrayList<GoodsInfo>();
	         for(int i = originFiles.size()-1; i >= 0; i--) { // 순서대로 뽑기 위한 for문
	        	 GoodsInfo gi = new GoodsInfo();
	        	 gi.setFilePath(savePath);
	        	 gi.setOriginName(originFiles.get(i));
	        	 gi.setChangeName(saveFiles.get(i));
	        	 
	        	 
	        	 if(i == originFiles.size()-1) {
	        		 gi.setFileLevel(0);
	        	 } else {
	        		 gi.setFileLevel(1);
	        	 }
	        	 
	        	 fileList.add(gi);
			}
	         
			int result = new GoodsService().insertGoods(g, fileList);
			
			
			if(result > 0 ) {
				response.sendRedirect("list.gs");
			} else {
				request.setAttribute("msg", "상품 등록에 실패");
				
				for(int i = 0; i < saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
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
