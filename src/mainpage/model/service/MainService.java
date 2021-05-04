package mainpage.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import Attachment.model.vo.Attachment;
import mainpage.model.dao.MainDAO;
import mainpage.model.vo.MainPage;

public class MainService {

	public ArrayList<MainPage> selectList() {
		
		MainDAO mainDAO = MainDAO.getInstance();
		Connection con = getConnection();
		mainDAO.setConnection(con);
		
		ArrayList<MainPage> mList = mainDAO.getRecomList();
		
		System.out.println("mainservice.selectList : "+mList);
		
		close(con);
		return mList;
	}

}
