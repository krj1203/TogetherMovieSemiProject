package mainpage.model.dao;

import static db.JdbcUtil.*;

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

import mainpage.model.vo.MainPage;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;

public class MainDAO {
	private static MainDAO mainDAO;
	private Connection con;
	private Properties prop = new Properties();
	public MainDAO() {
		String filePath = MainDAO.class.getResource("/sql/mainPageSQL.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static MainDAO getInstance() {
		if(mainDAO == null) {
			mainDAO = new MainDAO();
		}
		
		return mainDAO;
	}

	public void setConnection(Connection con2) {
		// TODO Auto-generated method stub
		this.con = con2;
	}


	
	public ArrayList selectfList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MovieFile> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<MovieFile>();
			while(rset.next()) {
				list.add(new MovieFile (rset.getInt("MOVIE_NO"),
										rset.getString("CHANGE_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return list;
	}

	public ArrayList selectrList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MovieInfo> list = null;
		
		String query = prop.getProperty("selectRList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<MovieInfo>();
			while(rset.next()) {
				list.add(new MovieInfo(rset.getInt("MOVIE_NO"),
						   rset.getInt("MOVIE_CODE"),
						   rset.getString("MOVIE_DATE"),
						   rset.getString("MOVIE_TITLE"),
						   rset.getString("DIRECTOR"),
						   rset.getString("ACTOR"),
						   rset.getString("GENRE"),
						   rset.getString("RUNNINGTIME"),
						   rset.getString("AGE"),
						   rset.getString("CONTENT"),
						   rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ArrayList selectSList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MovieInfo> list = null;
		
		String query = prop.getProperty("selectSList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<MovieInfo>();
			while(rset.next()) {
				list.add(new MovieInfo(rset.getInt("MOVIE_NO"),
						   rset.getInt("MOVIE_CODE"),
						   rset.getString("MOVIE_DATE"),
						   rset.getString("MOVIE_TITLE"),
						   rset.getString("DIRECTOR"),
						   rset.getString("ACTOR"),
						   rset.getString("GENRE"),
						   rset.getString("RUNNINGTIME"),
						   rset.getString("AGE"),
						   rset.getString("CONTENT"),
						   rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		System.out.println("DAO SList : " + list);
		return list;
	}

	public int insertRecom(int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRecom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int cancleRecom(int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cancleRecom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
}
