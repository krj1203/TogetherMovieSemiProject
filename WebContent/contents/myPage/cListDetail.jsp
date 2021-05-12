<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	ArrayList<Comment> cList = (ArrayList<Comment>)request.getAttribute("cList");
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
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
					<span>작성 댓글 목록</span>
				</div>
			</div>
			
		<div class="main-content">
		  <div class="main-tableBox">	
			<table id="mainTable">
					<tr style="background: rgba(243, 156, 18, 0.5)">
						<th class="th1">순서</th> 
						<th class="th2">게시글 번호</th>
						<th class="th3">작성 내용</th>
						<th class="th4">작성 날짜</th>
						
					</tr>
				  <% if(cList.isEmpty()){ %>
					<tr>
					  <td colspan="5" id="nullTd">작성한 댓글이 없습니다.</td>
					</tr>
					<%
					}else{
						int number = listCount - (currentPage - 1) * pageLimit;
						for(Comment c : cList){
					%>
					<tr>
						<td><%= number-- %></td>
					    <td><%= c.getBoardNo() %><input type="hidden" size="40" name="cbNo" value=<%= c.getBoardNo() %>></td>
						<td><%= c.getCommentContent() %></td>
						<td><%= c.getCommentDate() %></td>
					</tr>
					<%
							} 
					}		
				%>
				</tbody>
			</table>
			
		<div class="mainBottom">
			<div class="pagination">
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/cList.mp?currentPage=1'">&lt;&lt;</button>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/cList.mp?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
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
					<button class="page-item" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/cList.mp?currentPage=<%= p %>'"><%= p %></button>
				<% 		}
					} %>
				<button class="page-item" onclick="location.href='<%=request.getContextPath() %>/cList.mp?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $('#afterBtn');
						after.attr('disabled', true);
					}
				</script>
				<button class="page-item" onclick="location.href='<%= request.getContextPath() %>/cList.mp?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			</div>	
    	 </div>
		</div>
	</div>		

    </main>
    
    <%@include file="../common/footer.jsp" %>
    
	<script>
		$(function(){
			<%
				for(Board b : bList){
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
				<%
					for(Board b : bList){
				%>
						var bNo = <%= b.getBoardNo() %>
						if(num == bNo){
							var cate = "<%= b.getBoardCategory() %>";
							var bCode = <%= b.getBoardCode() %>;
						}
				<%
					}
				%>
				var Code = 0;
				switch(cate) {
					case "서울": Code = 0; break;
					case "경기": Code = 1; break;
					case "강원": Code = 2; break;
					case "충청": Code = 3; break;
					case "전라": Code = 4; break;
					case "경상": Code = 5; break;
					case "제주": Code = 6; break;
					case "기타": Code = 7; break;
				}
				
				if(bCode == 2){
					location.href='<%= request.getContextPath() %>/detail.bo?bCode='+Code+'&bNo=' + num;
				} else if(bCode == 1){
					location.href='<%= request.getContextPath() %>/detail.fb?bNo=' + num;
				}
			}});
		});
	</script>
</body>
</html>