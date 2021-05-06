package board.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.Comment;
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
	
	public int insertBoard(Board b) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		int result = new BoardDAO().insertBoard(con, b);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public Board selectBoard(String bCate, int bNo) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		int result = boardDAO.updateCount(con, bCate, bNo); 
		
		Board board = null;
		
		if(result > 0) {
			board = boardDAO.selectBoard(con, bCate, bNo);
			if(board != null) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
		}
		
		return board;
	}

	public int deleteBoard(int bNo) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		int result = boardDAO.delectBoard(con, bNo);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateBoard(Board b) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		int result = boardDAO.updateBoard(con, b);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Comment> selectCommentList(int bNo) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		ArrayList<Comment> list = new BoardDAO().selectCommentList(con, bNo);
		
		return list;
	}
	
	public ArrayList<Comment> insertComment(Comment c) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		int result = boardDAO.insertComment(con, c);
		
		ArrayList<Comment> list = null;
		if(result > 0) {
			commit(con);
			list = boardDAO.selectCommentList(con, c.getBoardNo());
		} else {
			rollback(con);
		}
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
