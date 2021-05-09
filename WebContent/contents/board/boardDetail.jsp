<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Board board = (Board)request.getAttribute("board");
	ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("list");
	String bCate = (String)request.getAttribute("bCate");
	int bCode = 0;
	switch(bCate){
		case "서울" : bCode = 0; break;
		case "경기" : bCode = 1; break;
		case "강원" : bCode = 2; break;
		case "충청" : bCode = 3; break;
		case "전라" : bCode = 4; break;
		case "경상" : bCode = 5; break;
		case "제주" : bCode = 6; break;
		case "기타" : bCode = 7; break;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="contents/cinema/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="contents/main/css/index.css" />
    <link rel="stylesheet" type="text/css" href="contents/main/css/lightsider.css" />
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
  
    <title>보드 초안</title>
    <style>
		.main-content{
			display:flex;
			margin:30px 0 0 30px;
		}
		
		
		.side{
			margin-left:70px;
		}
		
		
		
		.local-box{
			
			width:1000px;
			height:60px;
			display:flex;
			justify-content: flex-start;
			align-items: center;
			margin-left: 30px;
		}
		
		.local-box1{
			width:275px;
			height:60px;
			background-color: rgb(243, 156, 18);
			color:white;
			font-size:25px;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		
		.local-box2{
			font-size:18px;
			width:330px;
			height:60px;
			display: flex;
			justify-content: flex-start;
			align-items: flex-end;
			margin-left: 30px;
		}
		
		.sideTable{
			width:250px;
			text-align: center;
			border-top: 1px solid rgb(243, 156, 18);
			padding: 3px;
			font-size: 15px;
			border-collapse: collapse;
		}
		
		.sideTableTitle{background-color:rgb(243, 156, 18); color: white;}
		
		.sideTable th, .sideTable td{
			border: 1px solid rgb(243, 156, 18);
			padding: 8px;
		}
		
		.sideTable td:hover{
			background-color: rgba(243, 156, 18, 0.5);
		}
		
		#bulletin, #commentWriteTable, #commentSelectTable{
			margin-bottom: 40px;
			margin-left: 30px;
			text-align: center;
			border-top: 1px solid rgba(243, 156, 18, 0.5);
			padding: 8px;
			font-size: 18px;
			border-collapse: collapse;
		}
		
		#bulletin td, #commentWriteTable td, #commentSelectTable td{
			border: 1px solid rgba(243, 156, 18, 0.5);
			text-align: center;
			padding: 8px;
		}
		
		#tb1{ width: 80px; }
		#tb2{ width: 700px; }
		#tb3{ width: 80px; }
		
		thead{
			border: none; background-color: rgba(243, 156, 18, 0.5);
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-weight: 600;	
		}
		
		#likeBtn, #commentlikeBtn{
			background-color: rgba(243, 156, 18, 0);
			border: none;
		}
		
		#commentTitle{font-size: 20px;}
		
		#tc1{ width: 140px;}
		#tc2{ border: none; }
		#tc3{ width: 140px; }
		
		#textBox{ border: none;}
		
		#writeNoBtn{
			color: white;
			font-size: 15px;
			background-color: rgb(243, 156, 18);
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-weight: 600;
			padding: 8px 23px;
			float: right;
			border:none;
		}
		
		#dontWriteNoBtn{
			color: white;
			font-size: 15px;
			background-color: rgb(243, 156, 18);
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-weight: 600;
			padding: 8px 23px;
			float: right;
			border:none;
		}
		
		.detailBtn{
			color: white;
			font-size: 15px;
			background-color: rgb(243, 156, 18);
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-weight: 600;
			padding: 10px 35px;
			float: right;
			border:none;
			margin-left:10px;
			margin-bottom: 40px;
		}
		
		#text{
			display:inline-block;
			text-align:center;
			width:50%;
			height:100px;
			margin-left: 90px;
			margin-top: 70px;
		}
    </style>
    
</head>

<body>
    	<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
    
	    	<div class="local-box">
				<div class="local-box1">
					<span><%= bCate %></span>
				</div>
				<div class="local-box2">
					<span><%= board.getBoardTitle() %></span>
				</div>
			</div>
			
			<br><br><br><br>
			
		<div class="main-content">
		  <div class="main-tableBox">	
		  	<form action="<%= request.getContextPath() %>/boardUpdateForm.bo?bCode=<%= bCode %>" id="detailForm" method="post">
				<table id="bulletin">
						<thead>
						<tr>
							<td scope="col" colspan="3">
								<input type="hidden" name="bNo" value="<%= board.getBoardNo() %>">
								<input type="hidden" size="80" name="title" value="<%= board.getBoardTitle() %>">
								<%= board.getBoardTitle() %>
							</td>
							<!-- 
							<td>
								<button type="button" id="likeBtn">
									<img src="contents/board/img/unlike.png" width="20px" height="20px" id="like">
								</button>
							</td>  -->
						</tr>
						</thead>
						<tbody>
						<tr class="row1">
							<td scope="row" id="tb1">
								<input type="hidden" size="40" name="nickName">
								<%= board.getNickName() %>
							</td>
							<td id="tb2">
								<input type="hidden" name="date">
								<%= board.getBoardDate() %>
							</td>
							<td id="tb3">
								<input type="hidden" name="view">
								<%= board.getBoardView() %>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<textarea id="textBox" name="content" cols="110" rows="20" style="resize:none;" readonly><%= board.getBoardContent() %></textarea>
							</td>
						</tr>
						</tbody>
					</table>
					
					<div align="right">
						<c:if test="${not empty sessionScope.loginUser  && sessionScope.loginUser.user_no == board.getUsersNo()}">
							<input type="submit" class="detailBtn" id="updateBtn" value="수정">
							<input type="button" class="detailBtn" onclick="BoardDelete();" id="deleteBtn" value="삭제">
						</c:if>
					</div>
				</form>
				
				<div class="commentWrite">
					<table id="commentWriteTable">
					<thead>
						<tr>
							<td id="commentTitle" colspan="3">댓글 작성</td>
						</tr>
					</thead>
						<tr class="row1">
							<td id="tc1" colspan="2">
								<input type="hidden" size="80" name="nickName">
			                    <textarea id="commentContent" name="content" cols="105" rows="2" style="resize:none;"></textarea>
							</td>
							<td id="tc3" style="background-color: rgb(243, 156, 18);">
							<div align="center">
								<c:if test="${empty sessionScope.loginUser}">
									<input type="button" id="dontWriteNoBtn" value="등록">
								</c:if>
								<c:if test="${not empty sessionScope.loginUser}">
									<input type="button" id="writeNoBtn" value="등록">
								</c:if>
							</div>
							</td>
					    </tr>
					</table>
				</div>
				<br>
				<div class="commentSelect">
					<table id="commentSelectTable">
					<thead>
						<tr>
							<td id="commentTitle" colspan="3">Comment</td>
						</tr>
					</thead>
						<% if(list.isEmpty()){%>
							<tr><td colspan="3" width="925px">댓글이 없습니다.</td></tr>
						<% }else{ %>
							<% for(int i = 0; i < list.size(); i++){ %>
								<tr>
									<td width="140px"><%= list.get(i).getNickName() %></td>
									<td width="600px"><%= list.get(i).getCommentContent() %></td>
									<td width="140px"><%= list.get(i).getCommentDate() %></td>
								</tr>
							<% } %>
						<% } %>
					</table>
				</div>
			
				<br>
				
				<input type="button" class="detailBtn" id="cancelBtn" onclick="BoardMain();" value="메인으로">
			</div>
			
			<div class="side">
				<table class="sideTable">
					  <thead>
					    <tr>
					      <th scope="col" class="sideTableTitle" colspan="2">지역별</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr class="column1">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=0">서울</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=1">경기</a></td>
					    </tr>
					    <tr class="column2">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=2">강원</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=3">충청</a></td>
					    </tr>
					    <tr class="column3">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=4">전라</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=5">경상</a></td>
					    </tr>
					    <tr class="column4">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=6">제주</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=7">기타</a></td>
					    </tr>
					</tbody>
				</table>
			</div>	
		</div>		


    
    </main>
    
    <%@include file="../common/footer.jsp" %>
    
    <script>
    	function BoardDelete(){
    		var bool = confirm('정말 삭제하시겠습니까?');
    		
    		if(bool){
    			location.href='<%= request.getContextPath() %>/delete.bo?bCode=<%= bCode %>&bNo=<%= board.getBoardNo() %>';
    		}
    	};
    	
    	function BoardMain(){
    		location.href='<%= request.getContextPath() %>/list.bo?bCode=<%= bCode %>';
    	};
    	
    	$(function(){
    		$('#dontWriteNoBtn').on('click', function(){
    			window.alert('로그인 후 댓글 등록이 가능합니다.');
    		});
    		
    		$('#writeNoBtn').on('click', function(){
    			var writer =  '${sessionScope.loginUser.user_nickName}';
    			var uNo = '${sessionScope.loginUser.user_no}';
    			var bNo = <%= board.getBoardNo() %>;
    			var content = $('#commentContent').val();
    			
    			$.ajax({
    				url: 'insertComment.bo',
    				data: {writer:writer, bNo:bNo, content:content, uNo:uNo},
    				success: function(data){
    					console.log(data);
    					$commentTable = $('#commentSelectTable');
    					$commentTable.html('');
    					
    					for(var key in data){
    						var $tr = $('<tr>');
    						var $writerTd = $('<td>').text(data[key].nickname).css('width', '140px');
    						var $contentTd = $('<td>').text(data[key].commentContent).css('width', '600px');
    						var $dateTd = $('<td>').text(data[key].commentDate).css('width', '140px');
    						
    						$tr.append($writerTd);
    						$tr.append($contentTd);
    						$tr.append($dateTd);
    						$commentTable.append($tr);
    					}
    					$('#commentContent').val('');
    				}
    			});
    			
    		});
    	});
    </script>
    

</body>
</html>