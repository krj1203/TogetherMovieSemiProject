package board.model.service;

import static db.JdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.PageInfo;

public class BoardService {
	
	public int getListCount(String bCate) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		System.out.println("Service 출력");
		
		int listCount = new BoardDAO().getListCount(con, bCate);
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi, String bCate) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		ArrayList<Board> list = new BoardDAO().selectList(con, pi, bCate);
		close(con);
		
		return list;
	}

	public int getGoodsListCount() {
		
		Connection conn = getConnection();
		int listCount = new BoardDAO().getGoodsListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectGoodsList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectGoodsList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertGoods(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().insertGoods(conn,b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result;
	}

}
