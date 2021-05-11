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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/contents/updateUserPassword/updateUserPassword.css?ver=1.1">
	<script type="text/javascript" src="script/member.js"></script>

        
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>마이 페이지</title>
    
    
</head>

<body>
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
         
     	 <form action="updateUserPassword.do" method="post" name="frm" id="updateP">
     		<div class="updateUserPassswordBox">
        	<div class="updateUserPasswordBox_title">
        		<span>비밀번호를 변경합니다 </span>
        	</div>
        	<div>
        		<input class="updateUserPassword_pwd" type="password" placeholder="새로운 비밀번호를 입력하세요." name="user_newPassword" id="pass">
        	</div>
        	<div>
        		<input class="updateUserPassword_pwd" type="password" placeholder="새로운 비밀번호를 확인해주세요" name="user_newPasswordCheck" id="confirm">
        	</div>
        	<div class="updateUserPassword_btnBox">
        		<input class="updateUserPassword_btn" type="button" value="확인"  style="cursor: pointer;" id="subtn">
        		<input class="updateUserPassword_btn" type="button" value="취소"  style="cursor: pointer;" onclick="location.href='<%= request.getContextPath() %>/contents/myPage/myPage.jsp'">
        		
        	</div>
        

        </div>      
        </form>
    	</main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
    
    <script>
    $('#subtn').click(function(){
    	var flag = true;
    	var msg = "";
		var re = /^[a-zA-z0-9]{4,12}$/;
		
		
    	if (document.frm.user_newPassword.value == "") {
    		msg ="암호를 입력해주세요";
    		$('#pass').focus();
    		flag =  false;
    	}
    	
    	if (document.frm.user_newPassword.value != document.frm.user_newPasswordCheck.value) {
    		msg = "암호가 일치하지 않습니다."
    		$('#confirm').focus();
    		flag =  false;
    	}
    	
    	if(flag){
    		if(!re.test(document.frm.user_newPassword.value)) {
    			alert("암호는  패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해야합니다.");
    			$('#pass').focus();
    	        flag =  false;
    	    }else{
    	    	$('#updateP').submit();	
    	    }
    	}
    });
    	
    	
    	
    
    
    
    
    </script>
   
</body>
</html>