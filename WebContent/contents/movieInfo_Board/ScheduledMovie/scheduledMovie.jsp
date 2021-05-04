<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../cinema/css/style.css"/>
<link rel="stylesheet" type="text/css" href="scheduledMovie.css?ver=1.1"/>
<style>
	
	
</style>
</head>
<body>
   		<%@include file="../../common/loginbar.jsp" %>
		<main>
		<%@include file="../../common/header.jsp" %>
          

	
		
		<div class="category">
			 <nav>
				<div class="movie_go" id='boxOffice'><a href="<%= request.getContextPath()%>/contents/movieInfo_Board/boxoffice/boxOffice.jsp">박스오피스</a></div>
				<div class="movie_go" id="lMovie" ><a href="<%= request.getContextPath()%>/contents/movieInfo_Board/latestMovie/latestMovie.jsp">최신개봉작</a></div>
				<div class="movie_go" id="sMovie"><a href="<%= request.getContextPath()%>/contents/movieInfo_Board/ScheduledMovie/scheduledMovie.jsp">상영예정작</a></div>
			</nav> 
		</div>
	
	
					<!-- 불러올 데이터 썸네일 이미지, 제한나이,  제목,   -->
	<section>
			<div class="MovieList_Area">
					<div class='list'>
						<table>
							<tr>
								<td class="thumnail" id="thumnail1">
									
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
							</tr>
							
							<tr>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
							</tr>
							<tr>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
								<td class="thumnail" id="thumnail1">
									<img src="#">
									<p style="text-align: left" >제목</p>
									<input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기">
								</td>
							</tr>
						</table>
					</div>	
				</div>
	</section>
  </main>
    
    
    
    
    <%@include file="../../common/footer.jsp" %>
    
    	
    
    
</body>
</html>