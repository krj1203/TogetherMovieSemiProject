<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

	System.out.println(list);
	System.out.println(pi);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="board.css?ver=1.0" />
    <link rel="stylesheet" type="text/css" href="../cinema/css/style.css" /> 
    <title>지역1</title>   
</head>
<body>
<header>
       <ul class="header-bar">
            <li class="header-bar__menu">마이페이지</li>
            <li class="header-bar__menu">로그인</li>
            <li class="header-bar__menu">회원가입</li>
            <li class="header-bar__menu">고객 센터</li>
       </ul>
    </header>
    <main>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="../../index.jsp"><img src="../cinema/images/Tm_rogo_02 .png" width="200px" height="200px"></a>
      <!--   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button> -->
          
            <div class="collapse navbar-collapse" id="navbarColor03;">
              <ul class="navbar-nav mr-auto">
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">영화정보<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">최신개봉작</a>
                    <a class="dropdown-item" href="#">상영예정작</a>
                  </div> 
                </li>
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">맛집극장<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="../cinema/cinema.jsp">친구</a>
                    <a class="dropdown-item" href="../cinema/couple.jsp">연인</a>
                    <a class="dropdown-item" href="../cinema/solo.jsp">혼자</a>
                  </div> 
                </li>
                <li class="dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<b class="caret"></b></a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">자유게시판</a>
                    <a class="dropdown-item" href="#">만남의광장</a>
                  </div> 
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../goods/goods.jsp">굿즈</a>
                </li>
                	
                <form class="navSearch">
                    <div class="navSearchDiv">
                      <input class="form-control" type="text" placeholder="영화 검색">
                      <button class="navSearchBtn" type="submit">검색</button>
                  </div>
                </form>
              </ul>
            </div>
          </nav>
    	
    	
    	
    
	    	<div class="local-box">
				<div class="local-box1">
					<span>서울/경기</span>
				</div>
				<div class="local-box2">
					<span>지역1 설명</span>
				</div>
			</div>
			<div class="local-box3">
					<div><input class="local-search" type="text"></div>
					<div><button class="local-btn">검색</button></div>
					
			</div>
			
		<div class="main-content">
		  <div class="main-tableBox">	
			<table id="mainTable">
				  <thead>
				    <tr>
				      <th scope="col" class="th1">순서</th>
				      <th scope="col" class="th2">지역</th>
				      <th scope="col" class="th3">제목</th>
				      <th scope="col" class="th4">작성자</th>
				      <th scope="col" class="th5">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  <% if(list.isEmpty()){ %>
				    <tr>
				      <td colspan="5">게시글이 없습니다.</td>
				    </tr>
				    <%
				    	}else{
				    		for(Board b : list){
				    %>
				    <tr>
				      <td><%= b.getBoardNo() %></td>
				      <td><%= b.getBoardCategory() %></td>
				      <td><%= b.getBoardTitle() %></td>
				      <td><%= b.getNickName() %></td>
				      <td><%= b.getBoardView() %></td>
				    </tr>
				    <%
				    		} 
				  		}		
				    %>
				</tbody>
			</table>
			
		<div class="mainBottom">
			<div class="pagination">
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=1'">&lt;&lt;</button>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
				<script>
					if(<%= currentPage %> <= 1){
						var before = $('#beforeBtn');
						before.attr('disabled', true);
					}
				</script>
				<% for(int p = startPage; p <= endPage; p++) { 
					if(p == currentPage){ %>
					<button class="page-item" id='choosen' disabled><%= p %></button>
				<% } else{ %>
					<button class="page-item" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
				<% 		}
					} %>
				<button class="page-item" onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('#afterBtn');
						after.attr('disabled', true);
					}
				</script>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>	
			<c:if test="${not empty sessionScope.loginUser }">
				<button onclick="location.href='<%= request.getContextPath() %>/boardWriteForm.bo'">작성하기</button>
			</c:if>
    	 </div>
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
					      <td scope="row"><a href="#">전체</a></td>
					      <td><a href="#">지역1</a></td>
					    </tr>
					    <tr class="column2">
					      <td scope="row"><a href="#">지역2</a></td>
					      <td><a href="#">지역3</a></td>
					    </tr>
					    <tr class="column3">
					      <td scope="row"><a href="#">지역4</a></td>
					      <td><a href="#">지역5</a></td>
					    </tr>
					    <tr class="column4">
					      <td scope="row"><a href="#">지역6</a></td>
					      <td><a href="#">지역7</a></td>
					    </tr>
					</tbody>
				</table>
			</div>	
	</div>		

		
	
	
	
    	
    	
    	
    	
    	
    	
    	
    	
    	
  
    	 

    
    </main>
    
    
    
    
    <footer style="margin-top:-200px;">
        <div class="footer-logo">
            <img src="../cinema/images/Tm_rogo_02 .png">
        </div>
        <div class="footer-write">
                <span style="padding: 10, 0, 0, 0; color: white; font-size: 9pt; line-height: 20px" align="center" valign="top">
							투게터 무비│사업자등록번호 000-00-00000│<br>
							같이볼래?│ 주소 서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층 │고객센터 1234-1234│FAX
							00-000-0000<br> 이메일 0000000@naver.com│ 상담시간
							오전10시~오후17시│개인정보보호책임자 홍 길 동<br> <br> copyright(c) <font style="color: white; font-weight: bold">TOGETHER MOVIE</font>
							All right reserved
                	
                </span>
        </div>
       
        
    </footer>
	<script>
		$(function(){
			$('#mainTable td').on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/detail.bo?bId=' + num + '&bCode=0';
			}});
		});
	</script>
</body>
</html>