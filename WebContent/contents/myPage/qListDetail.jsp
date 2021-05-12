<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	ArrayList<Board> qList = (ArrayList<Board>)request.getAttribute("qList");
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
    <title>마이페이지</title>   
</head>
<body>
		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
    
	    	<div class="local-box">
				<div class="local-box1">
					<span>마이페이지</span>
				</div>
				<div class="local-box2">
					<span>작성 문의 목록</span>
				</div>
			</div>
			
		<div class="main-content">
		  <div class="main-tableBox">	
			<table id="mainTable">
					<tr style="background: rgba(243, 156, 18, 0.5)">
						<th class="th1">순서</th> 
						<th class="th2">카테고리</th>
						<th class="th3">제목</th>
						<th class="th4">조회수</th>
					</tr>
				  <% if(qList.isEmpty()){ %>
					<tr>
					  <td colspan="5" id="nullTd">작성한 문의가 없습니다.</td>
					</tr>
					<%
					}else{
						int number = listCount - (currentPage - 1) * pageLimit;
						for(Board b : qList){
					%>
					<tr>
						<td><%= number-- %></td>
					    <td><%= b.getBoardCategory() %><input type="hidden" size="40" name="bNo" value=<%= b.getBoardNo() %>></td>
						<td><%= b.getBoardTitle() %><input type="hidden" size="40" name="bCate" value=<%= b.getBoardCategory() %>></td>
						<td><%= b.getBoardView() %><input type="hidden" size="40" name="bCode" value=<%= b.getBoardCode() %>></td>
					</tr>
					<%
							} 
					}		
				%>
				</tbody>
			</table>
			
		<div class="mainBottom">
			<div class="pagination">
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/qList.mp?currentPage=1'">&lt;&lt;</button>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/qList.mp?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
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
					<button class="page-item" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/qList.mp?currentPage=<%= p %>'"><%= p %></button>
				<% 		}
					} %>
				<button class="page-item" onclick="location.href='<%=request.getContextPath() %>/qList.mp?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('#afterBtn');
						after.attr('disabled', true);
					}
				</script>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/qList.mp?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>	
    	 </div>
		</div>
	</div>		

    </main>
    
    <%@include file="../common/footer.jsp" %>
    
	<script>
		$(function(){
			<%
				for(Board b : qList){
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
				var num = $(this).parent().children().eq(1).find("input").val();
				var cate = $(this).parent().children().eq(2).find("input").val();
				var code = $(this).parent().children().eq(3).find("input").val();
				
				location.href='<%= request.getContextPath() %>/detail.qna?bNo=' + num;
			}});
		});
	</script>
</body>
</html>