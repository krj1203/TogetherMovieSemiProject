<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="movieInfo.model.vo.*, java.util.*"%>
    
<%
	MovieInfo m = (MovieInfo)request.getAttribute("movieInfo");
	ArrayList<MovieFile> fileList = (ArrayList<MovieFile>)request.getAttribute("fileList");
	MovieFile titleImg = fileList.get(0);
%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 상세 정보</title>

	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	
	
	
<style>
	.movieInfo_view{ width:1310px; height:1500px; display:inline-block;}	
	.movieInfo_view hr {margin-top:50px; width: 1200px;}
	.movieInfo_view h2{padding-top: 40px; padding-left: 40px;}
	
	.img{display:inline-block;}
	.img img{ width:400px; height:500px; padding:20px;}
	
	.movieInfo{ width:830px; height: 500px; display:inline-block; float:right;}
	.movieInfo table th { padding:14px 0; font-size: 15px; color:#444; text-align: left; font-size:20px;}
	
	.content{width:900px; height:300px; padding-top: 10px; padding-left: 70px;}
	
	.stillShotImgArea{width:400px; height:310px;}
	.stillShotImg{width:400px; height:300px; padding-left:50px;}
	
	
		
</style>
</head>
<body>

	<div class="movieInfo_view">
		
		<div class="img">
			<img src="<%= request.getContextPath() %>/BoxOffcie_uploadFiles/<%= titleImg.getChangeName()%>">
		</div>
		
		
		
		<div class="movieInfo">
			<h1><%=m.getMovieTitle() %></h1>
			<table>
				<tr>
					<th>개봉일: <%=m.getMovieDate() %></th>
				</tr>
				<tr>
					<th>감독: <%=m.getDirector() %></th>
				</tr>
				<tr>
					<th>출연진: <%=m.getActor() %></th>
				</tr>
				<tr>
					<th>장르: <%=m.getGenre() %></th>
				</tr>
				<tr>
					<th>상영시간: <%=m.getRunningTime() %></th>
				</tr>
				<tr>
					<th>관람등급: <%=m.getAge() %></th>
				</tr>
				
			</table>
		</div>
		<hr>
		
		<h2>줄거리:</h2> 
		
		<div class="content">
			<h3><%=m.getContent() %></h3>
		</div>
		
		<table class="stillShot">
			<tr>
				<%for(int i=1; i<fileList.size(); i++){ %>
					<td>
						<div class="stillShotImgArea">
							 	<img id="stillShotImg<%=i%>" class="stillShotImg" src="<%=request.getContextPath() %>/BoxOffcie_uploadFiles/<%=fileList.get(i).getChangeName() %>">
						</div>
					</td>
				<%} %>
		</table>
		
	</div>
		
		
	
</body>
</html>