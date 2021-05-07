package movieInfo.model.dao;

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

import goods.model.dao.GoodsDAO;
import movieInfo.model.vo.MovieFile;
import movieInfo.model.vo.MovieInfo;



public class MovieInfoDAO {
	
	private static MovieInfoDAO MovieInfoDAO;
	private Properties prop = new Properties();
	private Connection conn;
	
	public MovieInfoDAO() {
		String filePath = MovieInfoDAO.class.getResource("/sql/movieInfo/movieInfo-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static MovieInfoDAO getInstance() {
		if(MovieInfoDAO == null) {
			MovieInfoDAO = new MovieInfoDAO();
		}
		return MovieInfoDAO;
	}
	public void setConnection(Connection conn) {
		this.conn=conn;
	}
	
	
public int getMovieInfoListCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getMovieInfoListCount");
		
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



	public ArrayList selectmList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MovieInfo> list = null;
		
		String query = prop.getProperty("selectMList");
		
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
									   rset.getString("CONTENT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public ArrayList selectSmList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MovieInfo> list = null;
		String query = prop.getProperty("selectLList");
		
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
									   rset.getString("CONTENT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	
	public ArrayList selectBmList(Connection conn2) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MovieInfo> list = null;
		
		String query = prop.getProperty("selectBList");
		
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
									   rset.getString("CONTENT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
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



	public int insertMovieInfo(Connection conn, MovieInfo m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMovieInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m.getMovieCode());
			pstmt.setString(2, m.getMovieDate());
			pstmt.setString(3, m.getMovieTitle());
			pstmt.setString(4, m.getDirector());
			pstmt.setString(5, m.getActor());
			pstmt.setString(6, m.getGenre());
			pstmt.setString(7, m.getRunningTime());
			pstmt.setString(8, m.getAge());
			pstmt.setString(9, m.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}



	
	public int insertMovieFile(Connection conn, ArrayList<MovieFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMovieFile");
		
		for(int i=0; i < fileList.size(); i++) {
			MovieFile at = fileList.get(i);
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result += pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		}
		return result;
	}

	
	public MovieInfo selectMovieInfo(Connection conn, int sNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MovieInfo m = new MovieInfo();
		
		String query = prop.getProperty("selectMovieInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new MovieInfo(rset.getInt("MOVIE_NO"),
										   rset.getInt("MOVIE_CODE"),
										   rset.getString("MOVIE_DATE"),
										   rset.getString("MOVIE_TITLE"),
										   rset.getString("DIRECTOR"),
										   rset.getString("ACTOR"),
										   rset.getString("GENRE"),
										   rset.getString("RUNNINGTIME"),
										   rset.getString("AGE"),
										   rset.getString("CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	

	public ArrayList<MovieFile> selectMovieFile(Connection conn, int sNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MovieFile> list = null;
		
		String query = prop.getProperty("selectMovieFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<MovieFile>();
			while(rset.next()) {
				MovieFile sm = new MovieFile();
						sm.setFiledId(rset.getInt("FILE_NO"));
						sm.setOriginName(rset.getString("ORIGIN_NAME"));
						sm.setChangeName(rset.getString("CHANGE_NAME"));
						sm.setFilePath(rset.getString("FILE_PATH"));
				
				list.add(sm);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		
		return list;
	}


}
	


	






	


