<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../cinema/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="myPage.css?ver=1.2" />
        
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>만남의 광장</title>
    
    
</head>

<body>
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
         
         <div class="myPage_box">
         	<div class="myPage_rightBox">
         		<div class="myPage_rightBox_title">
         			<span>My 페이지</span>
         		</div>
         		<div class="myPage_rightBox_wirte">
         			<div><span>작성 글</span></div>
         			<div><span>+</span></div>
         		</div>
         		<div class="myPage_rightBox_write_inputBox">
         			<input type="text" placeholder="내가 작성한 글이 없습니다." class="myPage_rightBox_write_input"> 
         		</div>
         		
         	</div>
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	<div class="myPage-leftBox">
         		<div class="myPage_leftBox_myInfo">my 정보</div>
         		<div class="myPage_leftBox_pim">
         			개인정보 확인/수정
         		</div>
         		<div class="myPage_leftBox_withdrawl" style="cursor: pointer;"   onclick="location.href ='<%=request.getContextPath()%>/deleteMember.do'">
         			회원탈퇴
         		</div>
         	</div>
         	
         
         
         
         
         </div>
         
         
         
         
         
         
         
    </main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
    
    
   
</body>
</html>