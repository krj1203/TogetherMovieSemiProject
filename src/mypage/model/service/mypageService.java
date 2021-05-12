package mypage.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import board.model.vo.Comment;
import board.model.vo.PageInfo;
import goods.model.vo.Pay;
import mypage.model.dao.mypageDAO;

public class mypageService {

	public ArrayList<Board> selectbList(int uNo) {
		mypageDAO mpDAO = mypageDAO.getInstance();
		Connection conn = getConnection();
		mpDAO.setConnection(conn);
		
		ArrayList<Board> bList = new mypageDAO().selectbList(conn, uNo);
		close(conn);
		
		return bList;
	}

	public ArrayList<Comment> selectcList(int uNo) {
		mypageDAO mpDAO = mypageDAO.getInstance();
		Connection conn = getConnection();
		mpDAO.setConnection(conn);
		
		ArrayList<Comment> cList = new mypageDAO().selectcList(conn, uNo);
		close(conn);
		return cList;
	}

	public ArrayList<Board> selectqList(int uNo) {
		mypageDAO mpDAO = mypageDAO.getInstance();
		Connection conn = getConnection();
		mpDAO.setConnection(conn);
		
		ArrayList<Board> qList = new mypageDAO().selectqList(conn, uNo);
		close(conn);
		
		return qList;
	}

	public ArrayList<Pay> selectpList(String uId) {
		
		mypageDAO mpDAO = mypageDAO.getInstance();
		Connection conn = getConnection();
		mpDAO.setConnection(conn);
		
		ArrayList<Pay> pList = new mypageDAO().selectpList(conn, uId);
		close(conn);
		return pList;
	}

	public int getbListCount(int uNo) {
		Connection conn = getConnection();
		
		int listCount = new mypageDAO().getbListCount(conn, uNo);
		close(conn);
		
		return listCount;
		
	}

	public ArrayList<Board> selectbList(PageInfo pi, int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Board> bList = new mypageDAO().selectbList(conn, pi, uNo);
		close(conn);
		
		return bList;
	}

	public int getcListCount(int uNo) {
		Connection conn = getConnection();
		
		int listCount = new mypageDAO().getcListCount(conn, uNo);
		close(conn);
		
		return listCount;
	}

	public ArrayList<Comment> selectcList(PageInfo pi, int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Comment> cList = new mypageDAO().selectcList(conn, pi, uNo);
		close(conn);
		
		return cList;
	}

	public int getqListCount(int uNo) {
		Connection conn = getConnection();
		
		int listCount = new mypageDAO().getqListCount(conn, uNo);
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectqList(PageInfo pi, int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Board> qList = new mypageDAO().selectqList(conn, pi, uNo);
		close(conn);
		
		return qList;
	}

	public int getgListCount(String uId) {
		Connection conn = getConnection();
		
		int listCount = new mypageDAO().getgListCount(conn, uId);
		close(conn);
		
		return listCount;
	}

	public ArrayList<Pay> selectgList(PageInfo pi, String uId) {
		Connection conn = getConnection();
		
		ArrayList<Pay> gList = new mypageDAO().selectgList(conn, pi, uId);
		close(conn);
		
		return gList;
	}
}
