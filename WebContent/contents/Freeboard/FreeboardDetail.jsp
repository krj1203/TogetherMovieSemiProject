<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Board board = (Board)request.getAttribute("board");
	BoardInfo biList = (BoardInfo)request.getAttribute("biList");
	ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("list");
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
		
		.main-tableBox{
		width:100%;
		}
		
		#bulletin, #commentWriteTable, #commentSelectTable{
			width:100%;
			margin-bottom: 40px;
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
		
		#tb1{ width: 150px; }
		#tb2{ width: 900px; }
		#tb3{ width: 50px; }
		
		thead{
			border: none; background-color: rgba(243, 156, 18, 0.5);
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-weight: 600;	
		}
		
		#commentTitle{font-size: 20px;}
		
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
		
		#image{
		 	width: auto; height: auto;
		 	max-width: 1000px;
		 	max-height: 1000px;
		}
		
		textarea{
   			width:100%;
   			minHeight:1;
		}
		
		section{ margin-right: 20px;}
		
		.footer{ margin-top: 200px;	}		
		
    </style>
    
</head>

<body>
    	<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
    
	    	<div class="local-box">
				<div class="local-box1">
					<span>자유게시판</span>
				</div>
				<div class="local-box2">
					<span><%= board.getBoardTitle() %></span>
				</div>
			</div>
			
			<br><br><br><br>
	<section>		
		<div class="main-content">
		  <div class="main-tableBox">	
		  	<form action="<%= request.getContextPath() %>/boardUpdateForm.fb" id="detailForm" method="post" encType="multipart/form-data">
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
								<% if(biList != null){ %>
									<img id = "image" src="<%= request.getContextPath() %>/BoardInfo_uploadFiles/<%= biList.getChangeName() %>">
									<br><br>
								<% } %>
								<input type="hidden" id="category" name="category" value=<%= board.getBoardCategory() %>>
								<textarea id="textBox" name="content" style="resize:none;" readonly><%= board.getBoardContent() %></textarea>
							</td>
						</tr>
						</tbody>
					</table>
					
					<div>
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
							<td id="commentTitle" colspan="3" width="1100px">댓글 작성</td>
						</tr>
					</thead>
						<tr class="row1">
							<td id="tc1" colspan="2" width="1000px">
								<input type="hidden" size="80" name="nickName">
			                    <textarea id="commentContent" name="content" style="resize:none; border:none;"></textarea>
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
				<div class="commentSelect">
					<table id="commentSelectTable">
						<% if(list.isEmpty()){%>
							<tr><td colspan="3" width="1100px">댓글이 없습니다.</td></tr>
						<% }else{ %>
							<% for(int i = 0; i < list.size(); i++){ %>
								<tr>
									<td width="180px"><%= list.get(i).getNickName() %></td>
									<td width="770px"><%= list.get(i).getCommentContent() %></td>
									<td width="180px"><%= list.get(i).getCommentDate() %></td>
								</tr>
							<% } %>
						<% } %>
					</table>
				</div>
			
				<br>
				
				<input type="button" class="detailBtn" id="cancelBtn" onclick="BoardMain();" value="메인으로">
			</div>
		</div>
	</section>
    </main>
    <div class="footer">
    <%@include file="../common/footer.jsp" %>
    </div>
    <script>
    	function BoardDelete(){
    		var bool = confirm('정말 삭제하시겠습니까?');
    		var cate = $('#category').val();
    		
    		if(bool){
    			if(cate == "글"){
    				location.href='<%= request.getContextPath() %>/otherDelete.fb?bNo=<%= board.getBoardNo() %>';
    			} else if(cate == "사진"){    				
    				location.href='<%= request.getContextPath() %>/delete.fb?bNo=<%= board.getBoardNo() %>';
    			}
    		}
    	};
    	
    	function BoardMain(){
    		location.href='<%= request.getContextPath() %>/list.fb';
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
    						var $writerTd = $('<td>').text(data[key].nickname).css('width', '180px');
    						var $contentTd = $('<td>').text(data[key].commentContent).css('width', '770px');
    						var $dateTd = $('<td>').text(data[key].commentDate).css('width', '180px');
    						
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