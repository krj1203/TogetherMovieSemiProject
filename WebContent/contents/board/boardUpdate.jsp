<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	Board b = (Board)request.getAttribute("b"); 
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
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="contents/cinema/css/style.css"/> 
    
    <script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>만남의 광장</title>
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
		
		.textBox{
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-size: 20px;
		}
		
		.side{
			margin-left:70px;
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
	
</style>
</head>

<body>
		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
          
	    	<div class="local-box">
				<div class="local-box1">
					<span>게시글 수정</span>
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
	    	 	<form action="<%= request.getContextPath() %>/update.bo?bCode=<%= bCode %>" method="post">
					<table id="writeBoard">
						<tr>
							<td>지역<input type="hidden" name="bNo" value="<%= b.getBoardNo() %>"></td>
							<td>
								<select name="category" id="categoryBox">
									<option>--------</option>
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
									<option value="충청">충청</option>
									<option value="전라">전라</option>
									<option value="경상">경상</option>
									<option value="제주">제주</option>
									<option value="기타">기타</option>
								</select>
							</td>	
						</tr>
						<tr class="row1">
							<td scope="row" id="tb1">제목</td>
							<td id="tb2">
								<textarea class="textBox" name="title" cols="70" rows="1" style="resize:none;"><%= b.getBoardTitle() %></textarea>
							</td>
						</tr>
						<tr>
							<td id="tb1">내용</td>
							<td id="tb3">
								<textarea class="textBox" name="content" cols="70" rows="15" style="resize:none;"><%= b.getBoardContent() %></textarea>
							</td>
						</tr>
					</table>
					<input type="submit" id="insertBtn" value="수정하기">
					<input type="button" id="cancelBtn" onclick="history.go(-1)" value="돌아가기">
				</form>
			</div>	
			
			<div class="side">
				<table class="sideTable">
					<thead>
						<tr>
							<th scope="col" class="sideTableTitle" colspan='2'>지역별</th>
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

</body>
</html>