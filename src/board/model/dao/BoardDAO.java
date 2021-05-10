package board.model.dao;

import static db.JdbcUtil.close;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.BoardInfo;
import board.model.vo.Comment;
import board.model.vo.PageInfo;

public class BoardDAO {
	
	private static BoardDAO boardDAO;
	private Properties prop = new Properties();
	private Connection con;
	
	public BoardDAO() {
		String filePath = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	
	public void setConnection(Connection conn) {
		this.con=conn;
	}

	public int getListCount(Connection con, String bCate) {
		System.out.println("getListCount DAO 출력");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bCate);
			rset = pstmt.executeQuery();
			if(rset.next()) { 
				result = rset.getInt(1); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("getListCount DAO 끝 result : " + result);
		return result;
	}

	public ArrayList<Board> selectList(Connection con, PageInfo pi, String bCate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		System.out.println("selectList DAO 출력");
		String query = prop.getProperty("selectList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
		
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bCate);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new Board(rset.getInt("BOARD_NO"),
									rset.getInt("BOARD_TYPE"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getDate("BOARD_DATE"),
									rset.getInt("BOARD_VIEW"),
									rset.getString("BOARD_CATEGORY"),
									rset.getInt("BOARD_CODE"),
									rset.getString("STATUS"),
									rset.getInt("USERS_NO"),
									rset.getString("USERS_NICKNAME"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		//insertBoard=INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, ?, DEFAULT, ?)
		// boradNo, boardType, boardTitle, boardContent, boardView, boardCategory, boardCode, userNo
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardCategory());
			pstmt.setInt(5, b.getBoardCode());
			pstmt.setInt(6, b.getUsersNo());

			result = pstmt.executeUpdate();
			System.out.println("insertBoard result : "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection con, String bCate, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bCate);
			pstmt.setInt(2, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectBoard(Connection con, String bCate, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bCate);
			pstmt.setInt(2, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"),
						rset.getInt("BOARD_TYPE"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getInt("BOARD_VIEW"),
						rset.getString("BOARD_CATEGORY"),
						rset.getInt("BOARD_CODE"),
						rset.getString("STATUS"),
						rset.getInt("USERS_NO"),
						rset.getString("USERS_NICKNAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public int deleteBoard(Connection con, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		// UPDATE BOARD SET BOARD_TYPE=?, BOARD_TITLE=?, BOARD_CONTENT, BOARD_CATEGORY=?, BOARD_CODE=? WHERE BOARD_NO=?
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardCategory());
			pstmt.setInt(5, b.getBoardCode());
			pstmt.setInt(6, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 
		return result;
	}

	public int insertComment(Connection con, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComment");
		// INSERT INTO COMMENTS VALUES(SEQ_CNO.NEXTVAL, ?, SYSDATE, DEFAULT, ?, ?)
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getCommentContent());
			pstmt.setInt(2, c.getBoardNo());
			pstmt.setInt(3, c.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Comment> selectCommentList(Connection con, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> cList = null;
		
		String query = prop.getProperty("selectCommentList");
		// SELECT * FROM COMMENTSLIST WHERE BOARD_NO=?
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			cList = new ArrayList<Comment>();
			while(rset.next()) {
				cList.add(new Comment(rset.getInt("COMMENTS_NO"),
									rset.getInt("BOARD_NO"),
									rset.getInt("USERS_NO"),
									rset.getString("USERS_NICKNAME"),
									rset.getString("COMMENTS_CONTENTS"),
									rset.getDate("COMMENTS_DATE"),
									rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}

	public int getfListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getfListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<Board> selectFlist(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectfList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
		
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new Board(rset.getInt("BOARD_NO"),
									rset.getInt("BOARD_TYPE"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getDate("BOARD_DATE"),
									rset.getInt("BOARD_VIEW"),
									rset.getString("BOARD_CATEGORY"),
									rset.getInt("BOARD_CODE"),
									rset.getString("STATUS"),
									rset.getInt("USERS_NO"),
									rset.getString("USERS_NICKNAME"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int updatefCount(Connection con, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatefCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectfBoard(Connection con, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectfBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"),
						rset.getInt("BOARD_TYPE"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getInt("BOARD_VIEW"),
						rset.getString("BOARD_CATEGORY"),
						rset.getInt("BOARD_CODE"),
						rset.getString("STATUS"),
						rset.getInt("USERS_NO"),
						rset.getString("USERS_NICKNAME"));
				System.out.println("BoardDAO : "+ b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public BoardInfo selectImage(Connection con, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardInfo bi = new BoardInfo();
		
		String query = prop.getProperty("selectImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bi.setfileNo(rset.getInt("FILE_NO"));
				bi.setOriginName(rset.getString("ORIGIN_NAME"));
				bi.setChangeName(rset.getString("CHANGE_NAME"));
				bi.setFilePath(rset.getString("FILE_PATH"));
				bi.setboardNo(bNo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bi;
	}

	public int insertBoardInfo(Connection conn, ArrayList<BoardInfo> fileList, Board b) {
		System.out.println("insertBoardInfo시작");
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoardInfo");
		//INSERT INTO FILE_INFO VALUES(SEQ_FNO.NEXTVAL, ?, ?, ?, SYSDATE, ?, DEFAULT, DEFAULT, SEQ_BNO.CURRVAL, 0, 0, 0)
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				BoardInfo bi = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, bi.getOriginName());
				pstmt.setString(2, bi.getChangeName());
				pstmt.setString(3, bi.getFilePath());
				pstmt.setInt(4, bi.getFileLevel());
				
				result += pstmt.executeUpdate();
				System.out.println("insertBoardInfo result : "+result);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoardInfo(Connection conn, ArrayList<BoardInfo> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatefBoard");
		// UPDATE FILE_INFO SET ORIGIN_NAME=?, CHANGE_NAME=?, FILE_PATH=?, FILE_LEVEL=? WHERE BOARD_NO=?
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				BoardInfo bi = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bi.getOriginName());
				pstmt.setString(2, bi.getChangeName());
				pstmt.setString(3, bi.getFilePath());
				pstmt.setInt(4, bi.getFileLevel());
				pstmt.setInt(5, bi.getboardNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteImg(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		BoardInfo bi = new BoardInfo();
		
		String query = prop.getProperty("deleteImage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Board> selectQList(Connection con, PageInfo pi) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Board> list = null;
			
			String query = prop.getProperty("selectQList");
			
			try {
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
			
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				list = new ArrayList<Board>();
				while(rset.next()) {
					Board b = new Board(rset.getInt("BOARD_NO"),
										rset.getInt("BOARD_TYPE"),
										rset.getString("BOARD_TITLE"),
										rset.getString("BOARD_CONTENT"),
										rset.getDate("BOARD_DATE"),
										rset.getInt("BOARD_VIEW"),
										rset.getString("BOARD_CATEGORY"),
										rset.getInt("BOARD_CODE"),
										rset.getString("STATUS"),
										rset.getInt("USERS_NO"),
										rset.getString("USERS_NICKNAME"));
					
					list.add(b);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			
			return list;
		}

	public int getQListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getQListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public int updateQCount(Connection con, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectQBoard(Connection con, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectQBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"),
						rset.getInt("BOARD_TYPE"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getInt("BOARD_VIEW"),
						rset.getString("BOARD_CATEGORY"),
						rset.getInt("BOARD_CODE"),
						rset.getString("STATUS"),
						rset.getInt("USERS_NO"),
						rset.getString("USERS_NICKNAME"));
				System.out.println("BoardDAO : "+ b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

}
