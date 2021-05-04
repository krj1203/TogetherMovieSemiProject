<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
              <div class="cinema-title">친구</div>
              <div class="cinema-subTitle">친구와 함께 가기 좋은 영화관</div>
          </div>
          <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/cgv.png"/></div>
                <div class="cinema-name">강남 CGV</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 강남구 역삼동 강남대로 438</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/gangNam.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">동대문 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울 중구 장충단로 247 굿모닝시티9층</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/dongDaeMoon.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">홍대 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울특별시 마포구 동교동 양화로 147 </div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/hongDae.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/cgv.png"/></div>
                <div class="cinema-name">건대 CGV</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울시 광진구 자양동 9-4 몰오브케이 3층</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/gunDae.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
        <div class="cinema-wrap">
            <div class="cinema-wrap__box">
                <div class="cinema-logo"><img class="cinema-allLogo" src="images/megabox.png"/></div>
                <div class="cinema-name">코엑스 메가박스</div>
                <div class="cinema-area">서울</div>
                <div class="cinema-address">서울시 강남구 봉은사로524 B1(삼성동,코엑스몰) 메가박스 코엑스지점</div>
                <div class="cinema-btn"><button type="button" onclick="location.href='cinemaGroup/coex.jsp' "class="btn-1">보기</button><button class="btn-2">예매</button></div>
            </div>
            
        </div>
    </main>
    
 

    <%@include file="../common/footer.jsp" %>
</body>
</html>