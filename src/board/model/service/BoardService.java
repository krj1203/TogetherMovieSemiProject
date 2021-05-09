package board.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.BoardInfo;
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
		
		int result = boardDAO.deleteBoard(con, bNo);
		
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

	public int getfListCount() {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		int listCount = new BoardDAO().getfListCount(con);
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectfList(PageInfo pi) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		ArrayList<Board> list = new BoardDAO().selectFlist(con, pi);
		close(con);
		
		return list;
	}

	public Board selectfBoard(int bNo) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		System.out.println("들어옴");
		Board board = null;
		
		int result = boardDAO.updatefCount(con, bNo);
		System.out.println("BoardService result : " + result);
		if(result > 0) {
			board = new BoardDAO().selectfBoard(con, bNo);
			System.out.println("BoardService board : " + board);
			if(board != null) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);
		
		return board;
	}

	public BoardInfo selectImage(int bNo) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection con = getConnection();
		boardDAO.setConnection(con);
		
		BoardInfo fList = new BoardDAO().selectImage(con, bNo);
		return fList;
	}

	public int insertBoardInfo(Board b, ArrayList<BoardInfo> fileList) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		
		int result1 = boardDAO.insertBoard(conn, b);
		int result2 = boardDAO.insertBoardInfo(conn, fileList, b);
		System.out.println("result1 : "+result1);
		System.out.println("result2 : "+result2);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1;
	}

	public int updatefBoard(Board b, ArrayList<BoardInfo> fileList) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardInfo bi = new BoardInfo();
		
		int result1 = boardDAO.updateBoard(conn, b);
		int result2 = boardDAO.updateBoardInfo(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1;
	}

	public int deletefBoard(int bNo) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		
		int result1 = boardDAO.deleteBoard(conn, bNo);
		int result2 = boardDAO.deleteImg(conn, bNo);

		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1;
	}

	public int updatefBoard2(Board b, ArrayList<BoardInfo> fileList) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		
		int result1 = boardDAO.updateBoard(conn, b);
		int result2 = boardDAO.insertBoardInfo(conn, fileList, b);
		System.out.println("result1 : "+result1);
		System.out.println("result2 : "+result2);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1;
	}

	

}
