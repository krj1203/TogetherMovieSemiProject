package mypage.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import board.model.vo.Comment;
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

}