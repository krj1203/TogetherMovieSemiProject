<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

main {
  width: 1280px;
  min-height:1500px; 
  margin: auto;

}


.navbar{
  position: relative;
  width:100%;
  display: flex;
  padding: 0.5rem 1rem;
  float:fixed;
}

.nav-item{
  margin-top:40px;
  flex-direction:row;
  font-size: 20px;
    font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
    font-weight: 600;
    float:left;
    text-align:center;
    padding: 50px;
    list-style:none;
}

.navSearch{
  margin-top:35px;
  flex-direction:row;
  font-size: 15px;
    font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
    font-weight: 600;
    float:left;
    padding: 50px;
    list-style:none;
}

.navbar ul{
  display:flex;
  justify-content: space-between;
   text-align:left;
  flex-direction: row;
}

.navSearch input[type=text]{
  float: left;
  flex-direction:row;
  border-color: #888888 2px solid;
  font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
  background-color: white;
  font-size: 15px;
  font-weight: 600;
  height: 30px;
  width: 160px;
}

.navSearchBtn {
  float: left;
  margin-left: 2px;
  flex-direction:row;
  font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
  border-color: black 1px solid;
  background-color: white;
  font-size: 15px;
  color: black;
  height: 36px;
  width: 50px;
  font-weight: 800;
}

.dropdown {
  float: left;
  overflow: hidden;
}

/* Dropdown button */
.dropdown {
   margin-top:40px;
  flex-direction:row;
  font-size: 20px;
    font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
    font-weight: 600;
    float:left;
    text-align:center;
    padding: 50px;
    list-style:none;
  }

/* Dropdown content (hidden by default) */
.dropdown-menu {
  display: none;
  position: absolute;
  margin-top: 20px;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-menu a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-menu a:hover {
  background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-menu {
  display: block;
}
.caret { 
  display: inline-block; 
  width: 0; 
  height: 0; 
  margin-left: 2px; 
  vertical-align: middle; 
  border-top: 4px dashed; 
  border-top: 4px solid \9;
  border-right: 4px solid transparent;
  border-left: 4px solid transparent; 
}

a {
  text-decoration:none; color:black;
  text-align: center;
}

ul{list-style:none;}

.list{
  text-align: center;
  width: 1200px;
}

</style>

<title>Insert title here</title>
</head>
<body>
	<!--  주석  ㅇㅇㅇㅇ-->
    <!-- 모든 파일에 들어가는 헤더파일 -->
    <!-- 마스터 테스트 전용 주석 -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"><img src="<%= request.getContextPath() %>/contents/cinema/images/Tm_rogo_02 .png" width="200px" height="200px"></a>
      <!--   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button> -->
          
            <div class="collapse navbar-collapse" id="navbarColor03;">
              <ul class="navbar-nav mr-auto">
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="<%= request.getContextPath()%>/contents/movieInfo_Board/boxoffice/boxOffice.jsp" role="button" aria-haspopup="true" aria-expanded="false">영화정보<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="<%= request.getContextPath()%>/contents/movieInfo_Board/latestMovie/latestMovie.jsp">최신개봉작</a>
                    <a class="dropdown-item" href="<%= request.getContextPath()%>/contents/movieInfo_Board/ScheduledMovie/scheduledMovie.jsp">상영예정작</a>
                  </div> 
                </li>
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">맛집극장<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="<%= request.getContextPath() %>/contents/cinema/cinema.jsp">친구</a>
                    <a class="dropdown-item" href="<%= request.getContextPath() %>/contents/cinema/couple.jsp">연인</a>
                    <a class="dropdown-item" href="<%= request.getContextPath() %>/contents/cinema/solo.jsp">혼자</a>
                  </div> 
                </li>
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<b class="caret"></b></a>
                  <div class="dropdown-menu">
                  
                    <a class="dropdown-item" href="#">자유게시판</a>
                    <a class="dropdown-item" href="<%= request.getContextPath() %>/contents/group/group.jsp">만남의광장</a>
                  </div> 
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="goods">굿즈</a>
                </li>
                <li>
	                <form class="navSearch">
	                    <div class="navSearchDiv">
	                      <input class="form-control" type="text" placeholder="영화 검색">
	                      <button class="navSearchBtn" type="submit">검색</button>
	                  </div>
	                </form>
                
                </li>
              </ul>
            </div>
          </nav>
          <script>
	        $('#goods').on('click', function () {
				location.href="<%= request.getContextPath() %>/list.gs";
			});
          </script>
</body>
</html>