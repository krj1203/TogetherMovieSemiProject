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
    <link rel="stylesheet" type="text/css" href="deleteMember.css?ver=1.2" />
        
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>만남의 광장</title>
    
    
</head>

<body>
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
         
        <div class="deleteMemberBox">
        	<div class="deleteMemberBox_title">
        		<span>본 사이트에서 탈퇴합니다.</span>
        	</div>
        	<div>
        		<input class="deleteMemberBox_pwd" type="password" placeholder="비밀번호를 입력하세요.">
        	</div>
        	<div class="deleteMemberBox_btnBox">
        		<div><button class="deleteMemberBox_btn">등록</button></div>
        		<div><button class="deleteMemberBox_btn">취소</button></div>
        	
        	
        	</div>
        
        
        </div>
         
         
         
         
         
    </main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
    
    
   
</body>
</html>