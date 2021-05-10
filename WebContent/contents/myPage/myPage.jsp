<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*" %>


<% 
	ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/contents/cinema/css/style.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/contents/myPage/myPage.css?ver=1.2">
        
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>마이 페이지</title>
    
    
</head>

<body>
		
		<c:set var="boardList" value="boardList.boardTitle"></c:set>
		
		<c:out value="boardList"></c:out>
		
		
		
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
         
         <div class="myPage_box">
         	<div class="myPage_leftBox">
         		<div class="myPage_leftBox_title">
         			<span>My 페이지</span>
         		</div>
         		<div class="myPage_left_BigBox">
         			<div class="myPage_left_topBox">
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >작성 글</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
              					
         					
            					
         					</div>
         				</div>
         				
         				
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >작성 댓글</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<input class="inputBox_style_none" type="text" placeholder="작성한 댓글이 없습니다.">
         					</div>
         				</div>	
         			</div>
         			
         			

         			<div class="myPage_left_bottomBox">
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >1:1문의</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<input class="inputBox_style_none" type="text" placeholder="작성한 글이 없습니다.">
         					</div>
         				</div>
         				
         				
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >결제 정보</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<input class="inputBox_style_none" type="text" placeholder="결제한 이력이 없습니다.">
         					</div>
         				</div>	
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			</div>
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         			
         		
         		
         		</div>
         		
         	</div>
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	<div class="myPage-rightBox">
         		<div class="myPage_rightBox_myInfo">my 정보</div>
         		<div class="myPage_rightBox_pim">
         			<a style="cursor: pointer;" onclick="location.href ='<%=request.getContextPath()%>/updateMember.do'" >회원정보 수정 </a>
         		</div>
         		<div class="myPage_rightBox_passwordChange">
         			<a style="cursor: pointer;" onclick="location.href ='<%=request.getContextPath()%>/updateUserPassword.do'" >비밀번호 변경</a>
         		</div>
         		<div class="myPage_rightBox_withdrawl">
         			<a style="cursor: pointer;" onclick="location.href ='<%=request.getContextPath()%>/deleteMember.do'" >회원 탈퇴</a>
         		</div>
         	</div>
         </div>
    </main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
    
    
   
</body>
</html>