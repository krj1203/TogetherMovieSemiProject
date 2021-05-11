<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.util.ArrayList, cinema.model.vo.*" %>
<%	
	//list로 불러올것 목록
	//보유시설, 층별, 주차요금, 버스, 메트로
	
	Cinema cinema = (Cinema)request.getAttribute("cinema");
	String msg = (String)request.getAttribute("msg");
	ArrayList<String> floor = (ArrayList<String>)request.getAttribute("floorList");
	ArrayList<String> parking = (ArrayList<String>)request.getAttribute("pList");
	ArrayList<String> avail = (ArrayList<String>)request.getAttribute("aList");
	ArrayList<String> bus = (ArrayList<String>)request.getAttribute("bList");
	ArrayList<String> metro= (ArrayList<String>)request.getAttribute("mList");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<style>
	.clear{
		clear: both;
	}
</style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/cinema/css/style.css"/> 
    <title>극장맛집</title>
    <script src="<%=request.getContextPath() %>/contents/main/js/jquery-3.6.0.min.js"></script>	
</head>
<body>
	<%@include file="../common/loginbar.jsp" %>
		<main style="min-height: 500px;">
		<%@include file="../common/header.jsp" %>
		
		<form action="<%= request.getContextPath()%>/updateFormCinema.ci" method="post">
			<!--수정하기위한 hidden값이 들어가는 부분  -->
			<input type ="hidden" name = "no" value="<%=cinema.getCn_no()%>">
			<input type ="hidden" name = "name" value="<%=cinema.getCn_name() %>" >
			<input type ="hidden" name = "topic"  value="<%=cinema.getCn_topic()%>">
			<input type ="hidden" name = "avail" value="<%=cinema.getCn_available()%>">
			<input type ="hidden" name = "adress" value="<%=cinema.getCn_adress() %>">
			<input type ="hidden" name = "site" value="<%=cinema.getCn_sitelink() %>" >
			<input type ="hidden" name = "map" value="<%=cinema.getCn_maplink() %>" >
			<input type ="hidden" name = "area" value="<%=cinema.getArea() %>" >
			<input type ="hidden" name = "confirm"  value="<%=cinema.getCn_pConfirm()%>">
			<input type ="hidden" name = "guide" value="<%=cinema.getCn_pGuide() %>" >
			<input type ="hidden" name = "pay" value ="<%=cinema.getCn_pPay()%>">
			<input type ="hidden" name = "floor" value="<%=cinema.getCn_floor()%>">
			<input type ="hidden" name = "bus" value="<%=cinema.getCn_bus()%>">
			<input type ="hidden" name = "metro" value="<%=cinema.getCn_metro() %>">
			<input type ="hidden" name = "code" value="<%=cinema.getCode() %>">
	
			<!-- 주차, 층별, 교통, 보유시설같은 다른 Array로 온 것들도 cinema로 보내야 할 것 같음 -->
		
		<div style="padding-bottom: =100px;">
						
        	<div class="cinema">
              <div class="cinema-title" style="width: 500px;"><%=cinema.getCn_name() %>
              	<div style="text-align: right;">
	            <c:if test="${sessionScope.loginUser.user_id == 'admin'}">
					<input type ="button" id="deleteCibtn"style="border:0px; background-color: rgb(243, 156, 18);" value="해당 영화관 삭제">
					<input type ="submit" id ="updateButton" style="border:0px; background-color: rgb(243, 156, 18, 0.5);"value="수정">
				</c:if>
	          	</div>
              </div>
              
              <div class="cinema-subTitle dongDaeMoon-subtitle"><%=cinema.getCn_topic() %></div>    
			</div>
			
			
			
			<div class="cinema-FacilityInfo">
            <div class="cinema-FacilityInfo__guide">시설안내</div>
            <div class="cinema-FacilityInfo__facil">보유시설</div>
            <div class="cinema-FacilityInfo__logo">
                	<%for(int i = 0; i < avail.size(); i++){ %>
		                <div class="cinema-theater">

		                    <span>
		                    <i>
		                    <img width="107px" height="107px"src="<%=request.getContextPath() %>/contents/cinema/images/<%=avail.get(i).toString() %>">
		                    </i>

		                    </span>
		                </div>
                    <%} %>
                  
            </div>
            <div class="cinema-floor">
                <span>층별안내</span>
                <div>
                    <ul class="floor-list">
                    <% for(int i = 0; i < floor.size(); i++){%>
                        <li> <%= floor.get(i).toString() %></li>
                    <%} %>
                    </ul>
                </div>
            </div>
            <div class=cinema-transportationGuide>
                <p>교통안내</p>
                <p>약도</p>
                <div>
                    <ul>
                        <li style="width: 800px;"><span>도로명 주소 :</span>  <%=cinema.getCn_adress() %></li>
                    </ul>
                </div>
            </div>
            <div class="location-logo">
                <i class="fas fa-map-marker-alt"><a class="location-logo__click" href="<%=cinema.getCn_maplink()%>">실시간 길찾기</a></i>
            </div> 
        </div>
        
         <div class=parking-title>
            <span>주차</span>
        </div>
        <div class="parking" style="width: 830px;">
            <div class="dongDaeMoon-box">
                <div class=parking-guide>
                    <div class=parking-guide__logo>
                        <i class="fas fa-parking fa-3x" ></i>
                    </div>
                    <div class="parking-ex parking-ex__adjustment">
                        <div class=parking-ex__subtitle>
                            <span>주차 안내</span>
                        </div>
                        <div class="parking-ex__detail dongDaeMoon-ex__detail">
                            <ul>
                                <li><%=cinema.getCn_pGuide() %></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="parking-guide parking-confirm dongDaeMoon-parking-confirm" >
                    <div class=parking-guide__logo>
                        <i class="fas fa-car-side fa-3x"></i>
                    </div>
                    <div class=parking-ex>
                        <div class=parking-ex__subtitle>
                            <span>주차 확인</span>
                        </div>
                        <div class=parking-ex__detail>
                            <ul>
                                <li>
                                <%=cinema.getCn_pConfirm() %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="parking-fee dongDaeMoon-parking-fee">
                    <div class="parking-fee__logo" >
                        <i class="fas fa-won-sign fa-3x"></i>
                    </div>
                    <div class="parking-fee-box ">
                        <div class="parking-fee__subtitle">
                            <span>주차 요금</span>
                        </div>
                        <div class=parking-fee__detail>
                            <ul>
                            <% if(parking != null){%>
                            	<%for(int i = 0; i <parking.size(); i++){ %>
                                <li><%= parking.get(i).toString() %></li>
                                <%} %>
                            <%} %>
                            </ul>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        
        
        <!-- 교통 -->
        <div class=publicTransport-title>
            <span>대중교통</span>
        </div>
        <!-- 버스 -->
        <div class="publicTransport dongDaeMoon-publicTransport"style="min-height: 150%; padding-bottom: 50px; width: 830px;" >
           <div class="publicTransport-bigBox ddong">
                <div class=publicTransport-logo>
                    <i class="fas fa-bus fa-3x"></i>
                </div>
                <div class= publicTransport-box>
                    <div class=publicTransport-subtitle>
                        <span>버스</span>
                    </div>
                    <div class=bus-line>
                        <ul>
                        	<%for(int i = 0; i < bus.size(); i++){ %>
                        		<li><%=bus.get(i).toString() %></li>
                        	<%} %>
                        </ul>
                    </div>
                </div>
           </div>
       
           
           <!-- 지하철 -->
           <div class="publicTransport-bigBox subway-mainbox" >
            <div class=publicTransport-logo>
                <i class="fas fa-subway fa-3x"></i>
            </div>
            <div class= publicTransport-box>
                <div class="publicTransport-subtitle subway-subtitle" >
                    <span>지하철</span>
                </div>
                <div class=subway-line>
                    <ul>
                    	<%for(int i = 0; i < metro.size(); i++){ %>
                    		<li><%=metro.get(i).toString() %></li>
                    	<%} %>
                    </ul>
                </div>
            </div>
       </div>
		</div>
       
       </div>

     
		</form>
       
       <div class="parking" style="border: none;">
       	<div class="dongDaeMoon-box">
                <div class=parking-guide>
                    <div class=parking-guide__logo>
                        <i class="fas fa-parking fa-3x" ></i>
                    </div>
                    
                </div>
            </div>
       </div>
        </main>
    <%@include file="../common/footer.jsp" %>
    
    <div class="clear"></div>
    
    <script>
    	$('#deleteCibtn').on('click', function(){
    		var bool = confirm('정말 삭제하시겠습니까?');
    		
    		if(bool){
    			location.href ='<%= request.getContextPath()%>/deleteCinema.ci?no=' + <%=cinema.getCn_no()%>;
    		}
    	});
    </script>
</body>
</html>