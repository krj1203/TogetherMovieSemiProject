package mainpage.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import Attachment.model.vo.Attachment;
import mainpage.model.dao.MainDAO;
import mainpage.model.vo.MainPage;
import movieInfo.model.vo.MovieInfo;

public class MainService {

	public ArrayList selectRList(int i) {
		ArrayList list = null;
		
		MainDAO mDAO =  new MainDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		if(i==1) {
			list = mDAO.selectrList(conn);
		}else {
			list = mDAO.selectfList(conn);
		}
		
		close(conn);
		
		return list;
	}

	public ArrayList selectSList(int i) {
		ArrayList list = null;
		
		MainDAO mDAO =  new MainDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		if(i==1) {
			list = mDAO.selectSList(conn);
			System.out.println("service SList : " + list);
		}else {
			list = mDAO.selectfList(conn);
		}
		
		close(conn);
		
		return list;
	}

	public int insertRecom(int no) {
		MainDAO mDAO =  new MainDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		int result = mDAO.insertRecom(no);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int cancleRecom(int no) {
		MainDAO mDAO =  new MainDAO();
		Connection conn = getConnection();
		mDAO.setConnection(conn);
		
		int result = mDAO.cancleRecom(no);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
