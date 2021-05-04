package board.model.dao;

import static db.JdbcUtil.close;

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
			if(rset.next()) { // rset에 다음 값 있으면
				result = rset.getInt(1); // 첫번째 값 가져옴
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

	public int getGoodsListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = prop.getProperty("getGoodsListCount");
//		getGoodsListCount=SELECT COUNT(*) FROM BOARD WHERE STATUS='Y' AND BOARD_TYPE=2 사진 게시판이라 보드 타입이 2
		
		try {
			stmt = conn.createStatement();
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

	public ArrayList<Board> selectGoodsList(Connection conn, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectGoodsList");
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(query);
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

	public int insertGoods(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertGoods");
//		insertGoods=INSERT INTO BOARD VALUES(SEQ_BNO.NEXTVAL, ?, ?, ?, SYSDATE, SEQ_BVIEW, DEFAULT, 3, DEFAULT, DEFAULT)
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
		
	}

}
