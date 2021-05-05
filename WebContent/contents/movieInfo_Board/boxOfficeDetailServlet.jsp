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
<title>Insert title here</title>

	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
<style>
		
		
		
</style>
</head>
<body>
	<div class="movieInfo_view">
		<div class="img">
			<img src="<%= request.getContextPath() %>/BoxOffcie_uploadFiles/<%= titleImg.getChangeName()%>">
		</div>
		<h2><%=m.getMovieTitle() %></h2>
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
			<tr>
				<th>줄거리 : <%=m.getContent() %></th>
			</tr>
		</table>
		
	</div>
		
		
	
</body>
</html>