package goods.model.dao;

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

import board.model.vo.PageInfo;
import goods.model.vo.Goods;
import goods.model.vo.GoodsInfo;

public class GoodsDAO {
	private Properties prop = new Properties();
	private Connection conn;
	private static GoodsDAO goodsDAO;
	
	public GoodsDAO() {
		String filePath = GoodsDAO.class.getResource("/sql/goods/goods-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static GoodsDAO getInstance() {
		if(goodsDAO == null) {
			goodsDAO = new GoodsDAO();
		}
		return goodsDAO;
	}
	public void setConnection(Connection conn) {
		this.conn=conn;
	}
	
	public int getGoodsListCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getGoodsListCount");
		
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

	public ArrayList<Goods> selectGoodsList(Connection conn, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Goods> list = null;
		
		String query = prop.getProperty("selectGoodsList");
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Goods>();
			
			while(rset.next()) {
				Goods g = new Goods(rset.getInt("GOODS_NO"),
									rset.getString("GOODS_NAME"),
									rset.getInt("GOODS_PRICE"),
									rset.getInt("GOODS_COUNT"),
									rset.getString("GOODS_CONTENTS"),
									rset.getString("STATUS"));
				list.add(g);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertGoods(Connection conn, Goods g) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertGoods");
//		insertGoods=INSERT INTO GOODS VALUES(SEQ_GNO.NEXTVAL, ?, ?, DEFAULT, ?, DEFAULT)		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getGoods_title());
			pstmt.setInt(2, g.getGoods_price());
			pstmt.setString(3, g.getGoods_contents());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
		
	}

	public ArrayList selectGList(Connection conn) {
		Statement stmt =null;
		ResultSet rset = null;
		ArrayList<Goods> list = null;
		
		String query = prop.getProperty("selectGList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Goods>();
			
			while(rset.next()) {
				list.add(new Goods(rset.getInt("GOODS_NO"),
									rset.getString("GOODS_NAME"),
									rset.getInt("GOODS_PRICE"),
									rset.getInt("GOODS_COUNT"),
									rset.getString("GOODS_CONTENTS"),
									rset.getString("STATUS")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<GoodsInfo> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<GoodsInfo>();
			
			while(rset.next()) {
				list.add(new GoodsInfo(rset.getInt("GOODS_NO"),
									    rset.getString("CHANGE_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertAttachment(Connection conn, ArrayList<GoodsInfo> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGoodsInfo");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				GoodsInfo gi = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, gi.getOriginName());
				pstmt.setString(2, gi.getChangeName());
				pstmt.setString(3, gi.getFilePath());
				pstmt.setInt(4, gi.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection conn, int gNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Goods selectGoods(Connection conn, int gNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Goods g = null;
		
		String query = prop.getProperty("selectGoods");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				g = new Goods(rset.getInt("GOODS_NO"),
									rset.getString("GOODS_NAME"),
									rset.getInt("GOODS_PRICE"),
									rset.getInt("GOODS_COUNT"),
									rset.getString("GOODS_CONTENTS"),
									rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return g;
	}

	public ArrayList<GoodsInfo> selectGoodsInfo(Connection conn, int gNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GoodsInfo> list = null;
		
		String query = prop.getProperty("selectGoodsInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<GoodsInfo>();
			while(rset.next()) {
				GoodsInfo gi = new GoodsInfo();
				gi.setFileId(rset.getInt("FILE_ID"));
				gi.setOriginName(rset.getString("ORIGIN_NAME"));
				gi.setChangeName(rset.getString("CHANGE_NAME"));
				gi.setFilePath(rset.getString("FILE_PATH"));
				
				list.add(gi);
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
