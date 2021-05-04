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
              <div class="cinema-title">성수  메가박스</div>
              <div class="cinema-subTitle dongDaeMoon-subtitle">Meyer Sound와 Dolby ATMOS 시스템, 차세대 상영관의 표준 사운드 특화관 MX관</div>    
        </div>
        <div class="cinema-FacilityInfo">
            <div class="cinema-FacilityInfo__guide">시설안내</div>
            <div class="cinema-FacilityInfo__facil">보유시설</div>
            <div class="cinema-FacilityInfo__logo">
                <div class="cinema-theater">
                    <i class="fas fa-film fa-3x "></i>
                    <span>일반 상영관</span>
                </div>
                <div class="cinema-handiCaappedSeat">
                    <i class="fas fa-wheelchair fa-3x"></i>
                    <span>장애인석</span>
                </div> 
                <div class="cinema-handiCaappedSeat">
                    <i class="fas fa-couch fa-3x"></i>
                    <span>2인 소파</span>
                </div>    
            </div>
            <div class="cinema-floor">
                <span>층별안내</span>
                <div>
                    <ul class="floor-list">
                        <li><span>3층</span> : 1~2관, 로비, 매표, 매점, 남/여 화장실 </li>
                        <li><span>5층</span> : MX관, 4~5관, 남/여 화장실</li>
                    	<li><span>7층</span> : THE BOUTIQUE SUITE 101호~102호, 카페, 남/여 화장실</li>
                    	
                    
                    </ul>
                </div>
            </div>
            <div class=cinema-transportationGuide>
                <p>교통안내</p>
                <p>약도</p>
                <div>
                    <ul>
                        <li style="width: 800px;"><span>도로명 주소 :</span>서울특별시 성동구 성수동 1가 656-335</li>
                    </ul>
                </div>
            </div>
            <div class="location-logo">
                <i class="fas fa-map-marker-alt"><a class="location-logo__click" href="../mapAPI/seongsuMap/seongsuMap.html">실시간 길찾기</a></i>
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
                                <li>극장 건물 內 지하 2층 ~ 지하 5층 주차장 이용</li>
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
                        <div class=parking-ex__detail style="margin-top: 10px;">
                            <ul style="line-height: 20px;">
                                <li>종이티켓 : 출차 시 티켓 하단 바코드로 무인정산기에서 할인 </li>
                                <li>모바일티켓 : 영화관람 후 모바일티켓<주차확인>바코드로 무인정산기에서 할인</li>
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
                                <li>주차 요금은 입차시간을 기준으로 합니다.</li>
                                <li>영화 관람 시 2시간 30분 무료(무료 주차시간 이후 추가 30분까지 2,000원 / 3시간 이후부터 10분당 1,000원 부과)</li>
                                <li>주차 공간이 협소하여 혼잡할 수 있으니, 가급적이면 대중교통을 이용 부탁드립니다.</li>
                               
                            </ul>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <div class=publicTransport-title>
            <span>대중교통</span>
        </div>
        <div class="publicTransport dongDaeMoon-publicTransport" >
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
                            <li>간선 121번 (서울숲역 2번 출구 하차)</li>
                            <li>지번 2014번, 2224번, 2413번 (서울숲역 2번 출구 하차)</li>
                            <li>지번 2412번 (경일 초등학교 입구 하차)</li>
                           
                        </ul>
                    </div>
                </div>
           </div>
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
                        <li>분당선 서울숲역 2번 출구 도보 2분</li>
                        <li>2호선 뚝섬역 6번 출구 도보 7분</li>
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