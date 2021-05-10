<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*" %>


<% 
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<Comment> cList = (ArrayList<Comment>)request.getAttribute("cList");
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/contents/cinema/css/style.css">
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/contents/myPage/myPage.css?ver=1.2">
        
    
    
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
         					<table id="myPage_myWrite_table">
								<% if(bList.isEmpty()){ %>
									<tr>
									  <td colspan="5" id="nullTd">작성한 글이 없습니다.</td>
									</tr>
									<%
									}else{
										for(Board b : bList){
									%>
									<tr>
									  <td><%= b.getBoardCategory() %><input type="hidden" size="40" name="bNo" value=<%= b.getBoardNo() %>></td>
									<td><%= b.getBoardTitle() %><input type="hidden" size="40" name="bCate" value=<%= b.getBoardCategory() %>></td>
									<td><%= b.getBoardView() %><input type="hidden" size="40" name="bCode" value=<%= b.getBoardCode() %>></td>
									</tr>
									<%
											} 
									}		
								%>
							</table>
         					</div>
         				</div>
         				
         				
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >작성 댓글</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<table id="myPage_myComment_table">
								<% if(cList.isEmpty()){ %>
									<tr>
									  <td colspan="5" id="nullTd">작성한 댓글이 없습니다.</td>
									</tr>
									<%
									}else{
										for(Comment c : cList){
									%>
									<tr>
									  	<td><%= c.getBoardNo() %><input type="hidden" size="40" name="cbNo" value=<%= c.getBoardNo() %>></td>
										<td><%= c.getCommentContent() %></td>
										<td><%= c.getCommentDate() %></td>
									</tr>
									<%
										}
									}		
								%>
							</table>
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
    <script>
		$(function(){
			<%
				for(Board b : bList){
			%>
					var bNo = <%= b.getBoardNo() %>;
			<%
				}
			%>
			$('#myPage_myWrite_table td').not("#nullTd").on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).find("input").val();
				var cate = $(this).parent().children().eq(1).find("input").val();
				var bCode = $(this).parent().children().eq(2).find("input").val();
				var Code = 0;
				switch(cate) {
					case "서울": Code = 0; break;
					case "경기": Code = 1; break;
					case "강원": Code = 2; break;
					case "충청": Code = 3; break;
					case "전라": Code = 4; break;
					case "경상": Code = 5; break;
					case "제주": Code = 6; break;
					case "기타": Code = 7; break;
				}
				
				if(bCode == 2){
					location.href='<%= request.getContextPath() %>/detail.bo?bCode='+Code+'&bNo=' + num;
				} else if(bCode == 1){
					location.href='<%= request.getContextPath() %>/detail.fb?bNo=' + num;
				}
			}});
			
			
			
			
		});
	</script>
    
   
</body>
</html>