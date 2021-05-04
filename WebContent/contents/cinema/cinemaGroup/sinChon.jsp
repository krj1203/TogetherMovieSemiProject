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
              <div class="cinema-title">신촌 메가박스</div>
              <div class="cinema-subTitle dongDaeMoon-subtitle">전좌석 가죽시트, 핸드폰 충전이 가능한 가장 진화한 컴포트관</div>    
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
            </div>
            <div class="cinema-floor">
                <span>층별안내</span>
                <div>
                    <ul class="floor-list">
                        <li><span>5층</span> : COMFORT 1관, 2관 ~ 8관, 매표소, 매점, 무인발권기, 남자 · 여자 화장실 </li>
                    </ul>
                </div>
            </div>
            <div class=cinema-transportationGuide>
                <p>교통안내</p>
                <p>약도</p>
                <div>
                    <ul>
                        <li style="width: 800px;"><span>도로명 주소 :</span>  서울시 서대문구 신촌역로 30 신촌민자역사 5층 메가박스 신촌지점</li>
                    </ul>
                </div>
            </div>
            <div class="location-logo">
                <i class="fas fa-map-marker-alt"><a class="location-logo__click" href="../mapAPI/sinChonMap/sinChonMap.html">실시간 길찾기</a></i>
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
                                <li>밀리오레 건물 내 주차장 3,4,5층 이용 (주차장 입구 → 밀리오레 건물 뒷편)</li>
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
                                <li>영화관 매표소에서 결제 (영화티켓 구매 후, 차량 인증시 정산)</li>

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
                                <li>입차 시간을 기준으로 합니다.</li>
                                <li>주차 할인권 1매 기준: 3시간 3,500원 (30분 2,000원)</li>
                                <li>최대 2매까지 영화관에서 구매 가능( 최대 6시간)</li>
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
                            <li>163번, 170번, 171번, 172번, 270번, 271번, 273번, 602번, 603번, 472번, 721번, 751번</li>
                            <li>5711번, 5712번, 5713번, 5714번, 7011번, 7712번, 7017번, 7611번, 6716번, 7024번 </li>
                            <li>1000번, 1100번, 1200번, 9600번, 9602번, 9706번</li>
                            <li>서대문 03번, 서대문 04번, 서대문 05번</li>
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
                        <li>지하철 2호선 ‘이대역’하차 → 지하철 1번 출구 이용</li>
                        <li>지하철 2호선 ‘신촌역’하차 → 지하철 3번 출구 이용</li>
                        <li>경의중앙선 '신촌역' 하차 → 지하철 1번 출구 이용</li>
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