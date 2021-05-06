<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/contents/cinema/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/contents/deleteMember/deleteMember.css">


        
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>마이 페이지</title>
    
    
</head>

<body>
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
         
     	 <form action="deleteMember.do" method="post" name="frm">
     		<div class="deleteMemberBox">
        	<div class="deleteMemberBox_title">
        		<span>본 사이트에서 탈퇴합니다.</span>
        	</div>
        	<div>
        		<input class="deleteMemberBox_pwd" type="password" placeholder="비밀번호를 입력하세요." name="user_password">
        	</div>
        	<div class="deleteMemberBox_btnBox">
        		<input class="deleteMemberBox_btn" type="submit" value="확인"  style="cursor: pointer;">
        		<input class="deleteMemberBox_btn" type="button" value="취소"  style="cursor: pointer;" onclick="location.href='<%= request.getContextPath() %>/contents/myPage/myPage.jsp'">
        		
        	</div>
        

        </div>      
        </form>
    	</main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
    
    
   
</body>
</html>