<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, movieInfo.model.vo.*"%>

    
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	ArrayList<MovieInfo> SmList = (ArrayList<MovieInfo>)request.getAttribute("SmList");
	ArrayList<MovieFile> fList = (ArrayList<MovieFile>)request.getAttribute("fList");
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/main/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/movieInfo_Board/latestMovie/latestMovie.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/cinema/css/style.css"/>

	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
<style>
.category{
	width:1280px;
	height:50px;
	text-align: center;
	font-size:25px;
	color:white;
	
}
.movie_go{display:inline-block; 
		  font-weight: bolder;
		  width: 200px;
		  height:50px; 
		  color:white;
		  padding-top:20px;
		 }
#boxOffice{background-color:rgb(243, 156, 18);}
#lMovie{background-color:rgb(243, 156, 18);}
#sMovie{background-color:white;}
.button{background-color:white;  font-size: 16px; height: 40px; width: 130px; margin-top:15px; margin-left: 70px;}



.thumbnailArea {width:1100px; height:1600px;  <!--★ -->
                margin:20px; padding-left:160px; margin-top: 50px;
                line-height: 150%;}
                
.thumb-list{width:300px; height:400px;  display:inline-block;  border:1px solid black;}
.thumnail-list img{width:250px; height:300px; cursor:pointer; border:1px solid black;}

</style>


</head>
<body>

   		<%@include file="../../common/loginbar.jsp" %>
		<main>
		<%@include file="../../common/header.jsp" %>
          

	
		<div class="category">
			 <nav>
				<div class="movie_go" id='boxOffice'><a onclick="location.href ='<%=request.getContextPath()%>/listBMovie'">박스오피스</a></div>
				<div class="movie_go" id="lMovie" ><a onclick="location.href ='<%=request.getContextPath()%>/listLMovie'">최신개봉작</a></div>
				<div class="movie_go" id="sMovie"><a onclick="location.href ='<%=request.getContextPath()%>/listSMovie'">상영예정작</a></div>
			</nav>
		</div>
				
					
	<section>
			<c:if test="${sessionScope.loginUser.user_id == 'admin'}">
				<button onclick="location.href='<%= request.getContextPath()%>/writeSList'" style="margin-left: 1100px;"> 영화정보 작성</button>
			</c:if>
			
		
		
				<div class="thumbnailArea">
					<%if(SmList.isEmpty() || fList.isEmpty()){ %>
					등록된 게시물이 없습니다.
					<% }else{ %>
						<%for(int i=0; i < SmList.size(); i++) {%>
							<% MovieInfo b = SmList.get(i); %>
							<div class="thumb-list">
								<div>	
									<input type="hidden" id="sNo" name="sNo" value="<%=b.getMovieNo()%>">
									<%for(int j=0; j < SmList.size(); j++) {%>
										<%MovieFile a = fList.get(j); %>
										<% if(b.getMovieNo() == a.getMovieNo()){ %>
											<ul class='Smovie'>
												<li><img src ="<%=request.getContextPath() %>/scheduledMovie_uploadFiles/<%=a.getChangeName() %>"></li>	
												<li><p style="text-align: left" ><strong><%=b.getMovieTitle() %></strong></p></li>
												<li><input  class='button' type="button" onclick="" id="detailtBtn" value="+상세보기"	></li>	
											</ul>
										<% } %>
									<% } %>	
								</div>
								
							</div>
						<% } %>
					<% } %>	
				</div>
				
			
	</section>
  </main>
    
    
    <%@include file="../../common/footer.jsp" %>
    
    
    
    <script>
    $(function name() {
		$('.thumb-list').click(function () {
			var w = window.open("about:blank", '영화 상세정보','width=300, height=300, menubar=no, status=no, toolbar=no');
			var sNo = $(this).children().children().eq(0).val();
			 console.log(sNo);
			 
			 url='<%= request.getContextPath()%>/SMoviedetail.mo?sNo=' + sNo;
			   
			 
			 $.ajax({
	                url:'SMoviedetail.mo',
	                data:{sNo : sNo},
	                success:function(data){
	                   console.log('통신성공');
	                   w.location.href=url;
	                }
	             });
	          });
	       
	       });
    
    </script>
   
   
    
</body>
</html>