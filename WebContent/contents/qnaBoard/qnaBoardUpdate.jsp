<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	Board b = (Board)request.getAttribute("b"); 
	String cate = (String)request.getAttribute("cate");
	int cateCode = 0;
	switch(cate){
	case "글" : cateCode = 0; break;
	case "사진" : cateCode = 1; break;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="contents/cinema/css/style.css"/> 
    
    <script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>고객센터</title>
<style>
		#main-content{
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
	
		#writeBoard{
			margin-left: 30px;
			text-align: center;
			padding: 8px;
			font-size: 20px;
			font-weight: 800;
			border-collapse: collapse;
		}
		
		#writeBoard td{
			border-bottom: 1px solid #888888;
			text-align: center;
			padding: 8px;
		}
		
		#categoryBox{ 
			float: left; 
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
		  	font-size: 20px;
		}
		
		#tb1{ width: 1000px; }
		#tb2{ width: 550px; }
		#tb3{ width: 80px; }
		
		.filebox label{
			float: left;
			cursor: pointer;
		 	font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
		  	border: none;
		  	background-color: rgb(243, 156, 18);
		  	font-size: 15px;
		  	color: white;
		  	height: 40px;
		  	width: 120px;
		  	line-height: 2.9;
		  	font-weight: 800;	
		}
		.filebox input[type="file"] {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
		}
		
		#insertBtn, #cancelBtn{
			margin-top: 7px;
			margin-left: 5px;
			float: right;
		 	font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
		  	border: none;
		  	background-color: rgb(243, 156, 18);
		  	font-size: 15px;
		  	color: white;
		  	height: 40px;
		  	width: 120px;
		  	font-weight: 800;	
		}
		
		#imgFile{
			margin-left: 5px;
			float: left;
		 	font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
		  	border: none;
		  	font-size: 15px;
		  	font-weight: 800;
		}
		
		.textBox{
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-size: 20px;
		}
</style>
</head>

<body>
		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
          	
	    	<div class="local-box">
				<div class="local-box1">
					<span>게시글 작성</span>
				</div>
				<div class="local-box2">
					<span></span>
				</div>
			</div>
			<br>
			<br>
			<br clear="all">
	
    	 <div id="main-content">
	    	 <div class="main-tableBox">
	    	 	<form action="<%= request.getContextPath() %>/update.qna?category=<%= cate %>" method="post" encType="multipart/form-data">
					<table id="writeBoard">
						<tr class="row1">
							<td id="tb1">제목<input type="hidden" name="bNo" value="<%= b.getBoardNo() %>"></td>
							<td id="tb2">
								<textarea class="textBox" name="title" cols="100" rows="1" style="resize:none;"><%= b.getBoardTitle() %></textarea>
							</td>
						</tr>
						<tr>
							<td id="tb1">내용</td>
							<td id="tb3">
								<textarea class="textBox" name="content" cols="100" rows="15" style="resize:none;"><%= b.getBoardContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td id="tb1">첨부파일</td>
							<td id="tb4">
							<input type="hidden" name="category" value="<%=b.getBoardCategory() %>">
									<input type ="file" id="imgFile" multiple="multiple" name="updateFile" onchange="LoadImg(this,1)" >
								<p id="fileName"></p>
							</td>
						</tr>
					</table>
					<input type="submit" id="insertBtn" value="등록하기">
					<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qna'" value="돌아가기">
				</form>
			</div>	
		</div>
		
    
    </main>
    
    <%@include file="../common/footer.jsp" %>
    
<script>
	$("document").ready(function(){
		if(<%= cateCode %> == 0){
		$("#imgFile").attr("disabled", true);			
		} else{
		$("#imgFile").removeAttr("disabled");						
		}
	}) ;
</script>
</body>
</html>