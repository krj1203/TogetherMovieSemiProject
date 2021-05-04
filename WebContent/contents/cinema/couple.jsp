<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css"/> 
    <title>극장맛집-친구게시판 초안</title>
</head>
<body>
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
          
          <div class="cinema">
              <div class="cinema-title">연인</div>
              <div class="cinema-subTitle">연인과 함께 가기 좋은 영화관</div>
          </div>
          <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">ARTNINE 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 동작구 사당동 동작대로 89 골든시네마타워</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/artNine.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/cgv.png"/></div>
                <div class="cinema-name">여의도 CGV</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 영등포구 국제금융로 10</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/yeouido.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">신촌 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address"> 서울시 서대문구 신촌역로 30 신촌민자역사 5층 메가박스 신촌지점</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/sinChon.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/cgv.png"/></div>
                <div class="cinema-name">대학로 CGV</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 종로구 명륜2가 41-9서울 종로구 대명길</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/daeHakro.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">마곡 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 강서구 공항대로 247, 퀸즈파크나인 B동 4층 메가박스 마곡지점</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/maGok.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
    </main>
    
 

    <%@include file="../common/footer.jsp" %>
</body>
</html>