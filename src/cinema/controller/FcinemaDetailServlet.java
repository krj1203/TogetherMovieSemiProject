package cinema.controller;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinema.model.service.CinemaService;
import cinema.model.vo.Cinema;

/**
 * Servlet implementation class FcinemaDetailServlet
 */
@WebServlet("/detail.FC")
public class FcinemaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FcinemaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		Cinema ci = new CinemaService().selectCinema(no);
		ArrayList<String> floorList = null;
		//층별 분할
		String floor = ci.getCn_floor();
		if(floor != null) {
			floor = floor.replaceAll("(\r\n|\r|\n|\n\r)", "");
			String[] floorArr = floor.split(">");
			floorList = new ArrayList<String>();
			for(int i = 0; i < floorArr.length; i++) {
				floorList.add(floorArr[i]);
			}
		}
		
		//주차분할
		String parking = ci.getCn_pPay();
		ArrayList<String> parkingList = null;
		if(parking != null) {
			parking = parking.replaceAll("(\r\n|\r|\n|\n\r)", "");
			String[] parkingArr = parking.split(">");
			 parkingList = new ArrayList<String>();
			for(int i = 0; i < parkingArr.length; i++) {
				parkingList.add(parkingArr[i]);
			}
		}
		//버스 분할
		String bus = ci.getCn_bus();
		ArrayList<String> busList = null;
		if(bus != null) {
			bus = bus.replaceAll("(\r\n|\r|\n|\n\r)", "");
			String[] busArr = bus.split(">");
			busList = new ArrayList<String>();
			for(int i = 0; i < busArr.length; i++) {
				busList.add(busArr[i]);
			}
		}
		//지하철 분할
		String metro = ci.getCn_metro();
		System.out.println("metro >> " + metro);
		ArrayList<String> metroList = null;
		if(metro != null) {
			metro= metro.replaceAll("(\r\n|\r|\n|\n\r)", "");
			String[] metroArr = metro.split(">");
			metroList = new ArrayList<String>();
			for(int i = 0; i < metroArr.length; i++) {
				System.out.println("metroArr>>" + metroArr[i]);
				metroList.add(metroArr[i]);
			}
		}
		//보유시설 분할
		
		String avail = ci.getCn_available();
		ArrayList<String> availList = null;
		System.out.println("servlet : avail>>" + avail);
		if(avail != null) {
			String[] availArr = avail.split(", ");
			availList = new ArrayList<String>();
			for(int i = 0; i < availArr.length; i++) {
				
				switch(availArr[i]) {
				case "cafe": availList.add("cafe.png"); break;
				case "normal": availList.add("normal.png"); break;
				case "disabled" : availList.add("disabled.png"); break;
				case "sofa" : availList.add("sofa.png"); break;
				default : availList.add("없습니다"); break;
				}
			}
		}
		String page = null;
		System.out.println("metro >>" + metro);
		System.out.println("servlet : metroList>> " + metroList);
		if(ci != null) {
			page = "contents/cinema/cinemaDetail.jsp";
			request.setAttribute("cinema", ci);
			request.setAttribute("floorList", floorList);
			request.setAttribute("pList", parkingList);
			request.setAttribute("bList", busList);
			request.setAttribute("mList", metroList);
			request.setAttribute("aList", availList);
		}else {
			page = "contents/cinema/cinemaDetail.jsp";
			request.setAttribute("mgs", "오류가 발생했습니다");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
