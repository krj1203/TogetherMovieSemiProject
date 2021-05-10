<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int pageLimit = pi.getPageLimit();
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
    <link rel="stylesheet" type="text/css" href="contents/Freeboard/Freeboard.css?ver=1.0"/>
    
    <script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>자유게시판</title>   
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
					<span>자유게시판 설명</span>
				</div>
			</div>
			
		<div class="main-content">
		  <div class="main-tableBox">	
			<table id="mainTable">
				  <thead>
				    <tr style="background: rgba(243, 156, 18, 0.5)">
				      <th class="th1">순서</th>
				      <th class="th2">분류</th>
				      <th class="th3">제목</th>
				      <th class="th4">작성자</th>
				      <th class="th5">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  <% if(list.isEmpty()){ %>
				    <tr>
				      <td colspan="5" id="nullTd">게시글이 없습니다.</td>
				    </tr>
				    <%
				    	}else{
				    		int number = listCount - (currentPage - 1) * pageLimit;
				    		for(Board b : list){
				    %>
				    <tr>
				      <td><%= number-- %><input type="hidden" size="40" name="bNo" value=<%= b.getBoardNo() %>></td>
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
					<button class="page-item" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.fb?currentPage=<%= p %>'"><%= p %></button>
				<% 		}
					} %>
				<button class="page-item" onclick="location.href='<%=request.getContextPath() %>/list.fb?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('#afterBtn');
						after.attr('disabled', true);
					}
				</script>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/list.fb?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>	
			<c:if test="${not empty sessionScope.loginUser }">
				<button id="writeNoBtn" onclick="location.href='<%= request.getContextPath() %>/boardWriteForm.fb'">작성하기</button>
			</c:if>
    	 </div>
		</div>
	</div>		

    </main>
    
    <%@include file="../common/footer.jsp" %>
    
	<script>
		$(function(){
			<%
				for(Board b : list){
			%>
					var bNo = <%= b.getBoardNo() %>;
			<%
				}
			%>
			$('#mainTable td').not("#nullTd").on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).find("input").val();
				location.href='<%= request.getContextPath() %>/detail.fb?bNo=' + num;
			}});
		});
	</script>
</body>
</html>