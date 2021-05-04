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
              <div class="cinema-title">강남 CGV</div>
              <div class="cinema-subTitle">강남의 중심! 젊은 도시 강남이 한눈에 보이는 최상의 View를 제공</div>    
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
                        <li><span>8층</span> : 매표소,매점,에스컬레이터,엘리베이터,남자·여자 화장실,비상계단3</li>
                        <li><span>9층</span> : 1관,2관,남자·여자 화장실,비상계단3 </li>
                        <li><span>10층</span> : 3관,4관,엘리베이터2,남자·여자화장실,비상계단3 </li>
                        <li><span>11층</span> : 5관,6관,7관,엘리베이터2,남자·여자화장실,비상계단3</li>
                    </ul>
                </div>
            </div>
            <div class=cinema-transportationGuide>
                <p>교통안내</p>
                <p>약도</p>
                <div>
                    <ul>
                        <li><span>도로명 주소 :</span> 서울 서초구 서초대로77길 3 아라타워 8층 메가박스 강남지점</li>
                    </ul>
                </div>
            </div>
            <div class="location-logo">
                <i class="fas fa-map-marker-alt"><a class="location-logo__click" href="../mapAPI/gangNamMap/gangNamMap.html">실시간 길찾기</a></i>
            </div> 
        </div>
        <div class=parking-title>
            <span>주차</span>
        </div>
        <div class=parking>
            <div class=parking-guide>
                <div class=parking-guide__logo>
                    <i class="fas fa-parking fa-3x" ></i>
                </div>
                <div class="parking-ex parking-ex__adjustment">
                    <div class=parking-ex__subtitle>
                        <span>주차 안내</span>
                    </div>
                    <div class=parking-ex__detail>
                        <ul>
                            <li>아리 타워 건물 內 지하 3층 ~ 지하 6층 주차장 이용</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="parking-guide parking-confirm" >
                <div class=parking-guide__logo>
                    <i class="fas fa-car-side fa-3x"></i>
                </div>
                <div class=parking-ex>
                    <div class=parking-ex__subtitle>
                        <span>주차 확인</span>
                    </div>
                    <div class=parking-ex__detail>
                        <ul>
                            <li>매표소에서 당일 관람 티켓 인증 후, 차량 번호 할인 등록하여 지하 정산소에서 결제</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="parking-fee">
                <div class=parking-fee__logo>
                    <i class="fas fa-won-sign fa-3x"></i>
                </div>
                <div class="parking-fee-box">
                    <div class="parking-fee__subtitle">
                        <span>주차 요금</span>
                    </div>
                    <div class=parking-fee__detail>
                        <ul>
                            <li>주차 요금은 입차시간을 기준으로 합니다.</li>
                            <li>영화 관람 시 3시간 →(3시간 초과 시 10분당, 1000원 부과 , 초과 비용 출차 시 정산) </li>
                            <li>건물 내 타 매장과 주차 할인 중복 적용불가.</li>
                            <li>입차시 최대 3시간 30분까지 할인 가능(차량 1대에 주차 힐인 적용 2회 이상 불가)</li>
                            <li>주차 공간이 협소하므로 가급적이면 대중교통을 이용 바랍니다. (지하철 2호선 강남역 출구 9번 출구)</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class=publicTransport-title>
            <span>대중교통</span>
        </div>
        <div class=publicTransport>
           <div class=publicTransport-bigBox>
                <div class=publicTransport-logo>
                    <i class="fas fa-bus fa-3x"></i>
                </div>
                <div class= publicTransport-box>
                    <div class=publicTransport-subtitle>
                        <span>버스</span>
                    </div>
                    <div class=bus-line>
                        <ul>
                            <li>140번, 144번, 145번, 146번, 360번, 402번, 407번, 408번, 420번, 440번, 441번, 462번, 470번, 471번</li>
                            <li>3412번, 4412번, 서초03번, 서초 09번 </li>
                            <li>9404번, 9408번, 9409번, 9503번, 9711번, 9500번, 9501번, 9510번, 9800번, 9801번, 9802번, 9901번, M4403번, M7412번</li>
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
                        <li>지하철 2호선 , 신분당선 ‘강남역 -> 지하철 9번(구 5번) 출구 좌측 연결통로 이용</li>
                    </ul>
                </div>
            </div>
       </div>
        
        
        
        </div>

        
    </main>    
    

    <footer class="gangNam-footer">
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