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

	public ArrayList<MainPage> getRecomList() {
		// 메인 페이지의 추천 목록을 가져오는 메소드
		// 메인페이지의 추천 목록을 가져오기 위해서 DB에 만들어둔 MAIN_LIST를 연결해서 사용해야함
		System.out.println("getRecomList 실행");
		
		//stmt와 rset이 필요함
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getMainList");
		System.out.println(con);
		//rset을 받아온 것을 MainPage에 리스트형태로 set해줌
		ArrayList<MainPage> list = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			System.out.println(rset);
			
			list = new ArrayList<MainPage>();
			// FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, STATUS, MOVIE_SCORE, MOVIE_TITLE
			while(rset.next()) {
				MainPage mp = new MainPage(rset.getInt("FILE_NO"),
										rset.getString("ORIGIN_NAME"),
										rset.getString("CHANGE_NAME"),
										rset.getString("FILE_PATH"),
										rset.getString("MOVIE_SCORE"),
										rset.getString("MOVIE_TITLE")
						);
				list.add(mp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		// 그 리스트를 리턴해
		return list;
	}
}
