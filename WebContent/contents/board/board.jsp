<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,board.model.vo.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	String bCate = (String)request.getAttribute("bCate");
	int bCode = 0;
	switch(bCate){
		case "서울" : bCode = 0; break;
		case "경기" : bCode = 1; break;
		case "지역2" : bCode = 2; break;
		case "지역3" : bCode = 3; break;
		case "지역4" : bCode = 4; break;
		case "지역5" : bCode = 5; break;
		case "지역6" : bCode = 6; break;
		case "제주" : bCode = 7; break;
	}
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="contents/cinema/css/style.css"/> 
    <link rel="stylesheet" type="text/css" href="contents/board/board.css?ver=1.0"/>
    
    <script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>만남의 광장</title>   
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
					<span><%= bCate %> 설명</span>
				</div>
			</div>
			<div class="local-box3">
			<form>
				<div>
					<select name="opt" id="local-opt">
						<option value="0">제목</option>
						<option value="1">작성자</option>
					</select>
				</div>
					<div><input class="local-search" type="text"></div>
					<div><input type="submit" class="local-btn" value="검색"></div>
			</form>					
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
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.bo?bCode=<%= bCode %>&currentPage=1'">&lt;&lt;</button>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.bo?bCode=<%= bCode %>&currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
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
					<button class="page-item" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?bCode=<%= bCode %>&currentPage=<%= p %>'"><%= p %></button>
				<% 		}
					} %>
				<button class="page-item" onclick="location.href='<%=request.getContextPath() %>/list.bo?bCode=<%= bCode %>&currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('#afterBtn');
						after.attr('disabled', true);
					}
				</script>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.bo?bCode=<%= bCode %>&currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>	
			<c:if test="${not empty sessionScope.loginUser }">
				<button id="writeNoBtn" onclick="location.href='<%= request.getContextPath() %>/boardWriteForm.bo'">작성하기</button>
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
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=0">서울</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=1">경기</a></td>
					    </tr>
					    <tr class="column2">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=2">지역2</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=3">지역3</a></td>
					    </tr>
					    <tr class="column3">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=4">지역4</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=5">지역5</a></td>
					    </tr>
					    <tr class="column4">
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=6">지역6</a></td>
					      <td><a href="<%= request.getContextPath() %>/list.bo?bCode=7">제주</a></td>
					    </tr>
					</tbody>
				</table>
			</div>	
	</div>		

    </main>
    
    <%@include file="../common/footer.jsp" %>
    
	<script>
		$(function(){
			$('#mainTable td').on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/detail.bo?bCode=<%= bCode %>&bId=' + num;
			}});
		});
	</script>
</body>
</html>