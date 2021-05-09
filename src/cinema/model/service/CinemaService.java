package cinema.model.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import cinema.model.dao.CinemaDAO;
import cinema.model.vo.Cinema;

public class CinemaService {

	public ArrayList<Cinema> selectCList(int i) {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		System.out.println("cinemaService : DAO >>" + cineDAO);
		ArrayList<Cinema> cList = cineDAO.getList(i);
		
		System.out.println("CineService : selectList >" + cList);
		close(conn);
		
		
		return cList;
	}

	public int insertFCinema(Cinema cinema) {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		
		int result = cineDAO.insertFCinema(cinema);
		System.out.println("CineService : insertFCinema >" + result);
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Cinema selectCinema(int no) {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		
		Cinema cinema = null;
		
		cinema = cineDAO.selectCinema(no);
		
		if(cinema !=null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		System.out.println("cinemaService : selectCinema >> " + cinema);
		
		return cinema;
	}

	public int deleteCinema(int no) {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		
		int result = cineDAO.deleteCinema(no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateFCinema(Cinema cinema) {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		int result = cineDAO.updateFCinema(cinema);
		
		System.out.println("CineService : updateFCinema >" + result);
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
