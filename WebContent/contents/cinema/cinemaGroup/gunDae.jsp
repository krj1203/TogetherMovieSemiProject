<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css"> 
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <title>극장맛집-친구게시판 초안</title>
</head>
<body>
     <header>
    <c:if test="${empty sessionScope.loginUser}">
       <ul class="header-bar">
          	<li class="header-bar__menu"><a href="<%= request.getContextPath() %>/login.do">로그인</a></li>
            <li class="header-bar__menu"><a href="#">마이페이지</a></li>
            <li class="header-bar__menu"><a href="<%= request.getContextPath() %>/insertMember.do">회원가입</a></li>
            <li class="header-bar__menu"><a href="#">고객센터</a></li>
       </ul>
    </c:if>
    <c:if test="${not empty sessionScope.loginUser}">
       <ul class="header-bar">
            <li class="header-bar__menu"><a href="#"><c:out value="${loginUser.user_nickName }"></c:out></a></li>
            <li class="header-bar__menu"><a href="#">마이페이지</a></li>
            <li class="header-bar__menu"><a href="<%= request.getContextPath() %>/logout.do">로그아웃</a></li>
            <li class="header-bar__menu"><a href="#">고객센터</a></li>
       </ul>
    </c:if>
    </header>
    <main>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="../../../index.jsp"><img src="../images/Tm_rogo_02 .png" width="200px" height="200px"></a>
      <!--   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button> -->
          
            <div class="collapse navbar-collapse" id="navbarColor03">
              <ul class="navbar-nav mr-auto">
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">영화정보<b class="caret"></b></a>
                  <div class="dropdown-menu">
                   <a class="dropdown-item" href="../latestMovie/latestMovie.jsp">최신개봉작</a>
                    <a class="dropdown-item" href="../ScheduledMovie/scheduledMovies.jsp">상영예정작</a>
                  </div> 
                </li>
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">맛집극장<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="../cinema.jsp">친구</a>
                    <a class="dropdown-item" href="../couple.jsp">연인</a>
                    <a class="dropdown-item" href="../solo.jsp">혼자</a>
                  </div> 
                </li>
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">자유게시판</a>
                    <a class="dropdown-item" href="../../board/board.jsp">만남의광장</a>
                  </div> 
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../../goods/goods.jsp">굿즈</a>
                </li>	
                <form class="navSearch">
                    <div class="navSearchDiv">
                      <input class="form-control" type="text" placeholder="영화 검색">
                      <button class="navSearchBtn" type="submit">검색</button>
                  </div>
                </form>
              </ul>
            </div>
          </nav>
          </div>

          <div class="cinema">
              <div class="cinema-title">건대 CGV</div>
              <div class="cinema-subTitle dongDaeMoon-subtitle">20대 취향 인더스트리얼 컨셉의 인테리어, 포토스팟 테라스, 프리미엄 디저트 카페</div>    
        </div>
        <div class="cinema-FacilityInfo">
            <div class="cinema-FacilityInfo__guide">시설안내</div>
            <div class="cinema-FacilityInfo__facil">보유시설</div>
            <div class="cinema-FacilityInfo__logo gunDae-cinema-FacilityInfo__logo">
                <div class="cinema-theater">
                    <i class="fas fa-film fa-3x "></i>
                    <span>일반 상영관</span>
                </div>
                <div class="cinema-handiCaappedSeat">
                    <i class="fas fa-wheelchair fa-3x"></i>
                    <span>장애인석</span>
                </div>
                <div class="cinema-handiCaappedSeat">
                    <i class="fas fa-coffee fa-3x"></i>
                    <span>카페</span>
                </div>    
            </div>
            <!-- <div class="cinema-floor">
                <span>층별안내</span>
                <div>
                    <ul class="floor-list">
                        <li><span>7층</span> : 1관, 매표소 , 매점 , 화장실 </li>
                        <li><span>9층</span> : 2관,3관,화장실</li>
                        <li><span>11층</span> : 4관,5관,화장실</li>
                    </ul>
                </div>
            </div> -->
            <div class=cinema-transportationGuide>
                <p>교통안내</p>
                <p>약도</p>
                <div>
                    <ul>
                        <li style="width: 800px;"><span>도로명 주소 :</span> 서울특별시 마포구 동교동 양화로 147 , 7-12층(동교동, 아일렉스)</li>
                    </ul>
                </div>
            </div>
            <div class="location-logo">
                <i class="fas fa-map-marker-alt"><a class="location-logo__click" href="../mapAPI/gunDaeMap/gunDaeMap.html">실시간 길찾기</a></i>
            </div> 
        </div>
        <div class=parking-title>
            <span>주차</span>
        </div>
        <div class="parking">
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
                                <li>지하 1층 ~ 지하2층 평면 80대</li>
                                <li>지하 3층만 기계식</li>
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
                                <li>평면은 24시간 운영(지하1층 ~ 지하2층)</li>
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
                                <li>CGV고객은 1시간 무료시간 제공</li>
                                <li>이후 10분당 1,000원 부과</li>
                                <li>주차공간 협소 및 교통혼잡으로 가급적 대중교통을 이용해 주시기 바랍니다. (2호선, 공항철도, 경의중앙선 홍대입구역 1번 출구)</li>
                                
                            </ul>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <div class=publicTransport-title>
            <span>대중교통</span>
        </div>
        <div class="publicTransport  gunDae-publicTransport " >
           <!-- <div class="publicTransport-bigBox ddong">
                <div class=publicTransport-logo>
                    <i class="fas fa-bus fa-3x"></i>
                </div>
                <div class= publicTransport-box>
                    <div class=publicTransport-subtitle>
                        <span>버스</span>
                    </div>
                    <div class=bus-line>
                        <ul>
                            <li>간선 : 271, 602, 603, 604, 761, N26, N62</li>
                            <li>일반 : 733 </li>
                            <li>지선 : 5712, 5714, 6712, 6716, 7016, 7612, 7711, 7734, 7737, 7739</li>
                            <li>마을 : 마포 06, 마포09, 마포15</li>
                            <li>광역 : 1000, 1100, 1101, 1200, 1300, 1301, 1302, 1400, 1500, 1601</li>
                            <li>직행 : 200, 2200, 7300(주말운행)</li>
                        </ul>
                    </div>
                </div>
           </div> -->
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
                        <li>건대 입구역 6번 출구 150M</li>
                    </ul>
                </div>
            </div>
       </div>
        
        
        
        </div>

        
    </main>    
    

    <footer class="dongDamMoon-footer">
        <div class="footer-logo">
            <img src="../images/Tm_rogo_01.png"/>
        </div>
        <div class="footer-write">
                <span>
                    서울특별시 강남구 역삼동<br>
                TEL : 02-1111-2222 | FAX : 02-1111-2223 | togethermovie@gmail.com<br>
                    Copyright 2021. togetherMOVIE All rights reserved. 
                </span>
        </div>
        </div>
    </footer>
</body>
</html>