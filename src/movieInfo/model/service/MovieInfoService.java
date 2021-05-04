package movieInfo.model.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import goods.model.dao.GoodsDAO;
import movieInfo.model.dao.MovieInfoDAO;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;



public class MovieInfoService {
	
public int getGoodsListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new MovieInfoDAO().getMovieInfoListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList selectTList(int i) {
		
			
		ArrayList list = null;
		
		MovieInfoDAO mDAO = new MovieInfoDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		if(i==1) {
			list = mDAO.selectmList(conn);
		}else {
			list = mDAO.selectfList(conn);
		}
		
		return list;
	}
	
	
	public ArrayList selectSList(int i) {
		
		ArrayList list = null;
		
		MovieInfoDAO mDAO = new MovieInfoDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		if(i==1) {
			list = mDAO.selectSmList(conn);
		}else {
			list = mDAO.selectfList(conn);
		}
		
		return list;
	}

	public ArrayList selectBList(int i) {
		ArrayList list = null;
		
		MovieInfoDAO mDAO = new MovieInfoDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		if(i==1) {
			list = mDAO.selectBmList(conn);
		}else {
			list = mDAO.selectfList(conn);
		}
		
		return list;
		
	}

	public int insertLMovie(MovieInfo m, ArrayList<MovieFile> fileList) {
		MovieInfoDAO dao = new MovieInfoDAO();
		Connection conn = getConnection();
		dao.setConnection(conn);
		
		int result1 = dao.insertMovieInfo(conn, m);
		int result2 = dao.insertMovieFile(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);	
		}
		return result1;
	}

	
	public int insertBMovie(MovieInfo m, ArrayList<MovieFile> fileList) {
		MovieInfoDAO dao = new MovieInfoDAO();
		Connection conn = getConnection();
		dao.setConnection(conn);
		
		int result1 = dao.insertMovieInfo(conn, m);
		int result2 = dao.insertMovieFile(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);	
		}
		return result1;
	}
	
	
	public int insertSMovie(MovieInfo m, ArrayList<MovieFile> fileList) {
		MovieInfoDAO dao = new MovieInfoDAO();
		Connection conn = getConnection();
		dao.setConnection(conn);
		
		int result1 = dao.insertMovieInfo(conn, m);
		int result2 = dao.insertMovieFile(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);	
		}
		return result1;
	}

	
	public MovieInfo selectMovieInfo(int sNo) {
		MovieInfoDAO dao = new MovieInfoDAO();
		Connection conn = getConnection();
		dao.setConnection(conn);
		
		MovieInfoDAO mDAO = new MovieInfoDAO();
		
		MovieInfo movieInfo = null;
		
		movieInfo = mDAO.selectMovieInfo(conn, sNo);
			
		if(movieInfo != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
			
		return movieInfo;
	}

	

	public ArrayList<MovieFile> selectMovieFile(int sNo) {
		MovieInfoDAO dao = new MovieInfoDAO();
		Connection conn = getConnection();
		dao.setConnection(conn);
		
		ArrayList<MovieFile> list = new MovieInfoDAO().selectMovieFile(conn, sNo);
		
		return list;
	}
	
	

	

	


	
}
