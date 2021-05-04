<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css"/> 
    <title>극장맛집-혼자게시판 초안</title>
</head>
<body>
    	<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
          
          <div class="cinema">
              <div class="cinema-title">혼자</div>
              <div class="cinema-subTitle">혼자 가기 좋은 영화관</div>
          </div>
          <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">강동 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 강동구 성내로 48</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/gandong.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">성수 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 성동구 성수동 1가 656-335</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/seongsu.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">이수 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울시 동작구 동작대로 89 (사당동, 골든시네마타워 7층) 메가박스 이수지점</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/isu.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
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