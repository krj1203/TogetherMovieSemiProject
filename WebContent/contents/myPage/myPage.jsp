<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, goods.model.vo.*"%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*" %>


<% 
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<Comment> cList = (ArrayList<Comment>)request.getAttribute("cList");
	ArrayList<Board> qList = (ArrayList<Board>)request.getAttribute("qList");
	ArrayList<Pay> pList = (ArrayList<Pay>)request.getAttribute("pList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/contents/cinema/css/style.css">
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/contents/myPage/myPage.css?ver=1.1">
        

	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>마이 페이지</title>
    
    
  <style>
  	.myTable { table-layout: auto; width: 100%; min-width: 320px; max-width: 100%; overflow: hidden; border: 0; border-collapse: collapse; background-color: #FAFAFA; margin: auto; margin-bottom: 20px; text-align: center; font-size: 0.7em }
  	.wiDe { min-width: 640px; }
  	.nArrow { max-width: 480px }
  	.myTable tr { height: 40px; }
  	.myTable td, th { border: 1px white solid; padding: 8px; }
  	.myTable th { background-color: #ffa775; color: whitesmoke; }
  	.headerOrange th { background-color: #F5F5F5; }
  	.headerGreen th { background-color: #81e281; }
	.headerBlue th { background-color: #7799ff; }
  	.myTable.headerH tr:nth-Child(odd) { background-color: #F0F0F0; }
	.myTable.headerH td, .myTable.headerH th { border-width: 0 1px; }
	.myTable.headerH tr:hover td { border-color: transparent; background-color: #E6E6E6; }
	.myTable.headerH tr:hover td:first-Child { border-left-color: white; }
	.myTable.headerH tr:hover td:last-Child { border-right-color: white; }
	.myTable.headerV { width: 50%; }
	.myTable.headerV td:nth-Child(odd) { background-color: #F0F0F0; }
	.myTable.headerHybrid tr:first-Child th:first-Child { background-color: transparent; } /* 복합 형식 1번 셀 */
	.myTable.headerHybrid td:hover { background-color: #E6E6E6; }
	.myTable caption { margin: 4px 0; }


  </style>
</head>

<body>
		
	
		
		
 		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
         
         <div class="myPage_box">
         	<div class="myPage_leftBox">
         		<div class="myPage_leftBox_title">
         			<span>My 페이지</span>
         		</div>
         		<div class="myPage_left_BigBox">
         			<div class="myPage_left_topBox">
         			  <div class="new_box">
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >작성 글</span>
         					</div>
         					<table id="myPage_myWrite_table" class="myTable headerH">
								<% if(bList.isEmpty()){ %>
									<tr>
									  <td colspan="5" id="nullTd">작성한 글이 없습니다.</td>
									</tr>
									<%
									}else{
									%>
										<tr> 
											<th>카테고리</th>
											<th>제목</th>
											<th>조회수</th>
										</tr>
									<%
										for(Board b : bList){
									%>
									<tr>
									    <td><%= b.getBoardCategory() %><input type="hidden" size="40" name="bNo" value=<%= b.getBoardNo() %>></td>
										<td><%= b.getBoardTitle() %><input type="hidden" size="40" name="bCate" value=<%= b.getBoardCategory() %>></td>
										<td><%= b.getBoardView() %><input type="hidden" size="40" name="bCode" value=<%= b.getBoardCode() %>></td>
									</tr>
									<%
											} 
									}		
								%>
							</table>
         				</div>
         		
         				
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >작성 댓글</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<table id="myPage_myComment_table" class="myTable headerH">
								<% if(cList.isEmpty()){ %>
									<tr>
									  <td colspan="5" id="nullTd">작성한 댓글이 없습니다.</td>
									</tr>
									<%
									}else{
									%>
										<tr> 
											<th>게시글 번호</th>
											<th>댓글 내용</th>
											<th>작성 날짜</th>
										</tr>
									<%
										for(Comment c : cList){
									%>
									<tr>
									  	<td><%= c.getBoardNo() %><input type="hidden" size="40" name="cbNo" value=<%= c.getBoardNo() %>></td>
										<td><%= c.getCommentContent() %></td>
										<td><%= c.getCommentDate() %></td>
									</tr>
									<%
										}
									}		
								%>
							</table>
         					</div>
         				</div>
         				</div>
         					
         			</div>
         		<div>
         			<div class="myPage_left_bottomBox">
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >1:1문의</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<table id="myPage_myQNA_table" class="myTable headerH">
									<% if(bList.isEmpty()){ %>
										<tr>
										  <td colspan="5" id="nullTd">작성한 글이 없습니다.</td>
										</tr>
										<%
										}else{
										%>
											<tr> 
												<th>카테고리</th>
												<th>제목</th>
												<th>조회수</th>
											</tr>
										<%
											for(Board q : qList){
										%>
										<tr>
											<td><%= q.getBoardCategory() %><input type="hidden" size="40" name="qbNo" value=<%= q.getBoardNo() %>></td>
											<td><%= q.getBoardTitle() %><input type="hidden" size="40" name="qbCate" value=<%= q.getBoardCategory() %>></td>
											<td><%= q.getBoardView() %><input type="hidden" size="40" name="qbCode" value=<%= q.getBoardCode() %>></td>
										</tr>
										<%
												} 
										}		
									%>
								</table>
         					</div>
         				</div>
         				
         				
         				<div class="myPage_left_topBox_myWrite">
         					<div class="myPage_left_topBox_myWrite_title">
         						<span >결제 정보</span>
         					</div>
         					<div class="myPage_left_topBox_myWrite_contents">
         						<table id="myPage_myQNA_table" class="myTable headerH">
									<% if(pList.isEmpty()){ %>
										<tr>
										  <td colspan="5" id="nullTd">작성한 글이 없습니다.</td>
										</tr>
										<%
										}else{
											%>
											<tr> 
												<th>일련 번호</th>
												<th>상품 제목</th>
												<th>상품 수량</th>
												<th>결제 금액</th>
												<th>주소</th> 
											</tr>

											<%
											for(Pay p : pList){
										%>
										<tr>
											<td><%= p.getPayNo() %></td>
										 	<td><%= p.getTitle() %></td>
											<td><%= p.getCount() %></td>
											<td><%= p.getAmount() %></td>
											<td><%= p.getEmail() %></td> 
											<input type="hidden" name="gNo" value="<%= p.getGoodsNo() %>">
										</tr>
										<%
												} 
										}		
									%>
         						</table>
         					</div>
         				</div>	
         			
         			</div>
         		</div>
         			
         	</div>

         		
         		</div>
         		
         		
         		
         		
         		
	         	<div class="myPage-rightBox">
		         		<div class="myPage_rightBox_myInfo"><span>my 정보</span></div>
		         		<div class="myPage_rightBox_pim">
		         			<a style="cursor: pointer;" onclick="location.href ='<%=request.getContextPath()%>/updateMember.do'" >회원정보 수정 </a>
		         		</div>
		         		<div class="myPage_rightBox_passwordChange">
		         			<a style="cursor: pointer;" onclick="location.href ='<%=request.getContextPath()%>/updateUserPassword.do'" >비밀번호 변경</a>
		         		</div>
		         		<div class="myPage_rightBox_withdrawl">
		         			<a style="cursor: pointer;" onclick="location.href ='<%=request.getContextPath()%>/deleteMember.do'" >회원 탈퇴</a>
		         		</div>
	         	</div>
         	</div>

    </main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
    <script>
		$(function(){
			
			$('#myPage_myWrite_table td').not("#nullTd").on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).find("input").val();
				var cate = $(this).parent().children().eq(1).find("input").val();
				var bCode = $(this).parent().children().eq(2).find("input").val();
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
			
			
			$('#myPage_myComment_table td').not("#nullTd").on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).find("input").val();
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
			
			$('#myPage_myQNA_table td').not("#nullTd").on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).find("input").val();
				var cate = $(this).parent().children().eq(1).find("input").val();
				var code = $(this).parent().children().eq(2).find("input").val();
				
				location.href='<%= request.getContextPath() %>/detail.qna?bNo=' + num;
			}});
			
			// 결재 정보 디테일
			$('#myPage_myQNA_table td').not("#nullTd").on({'mouseenter':function(){
				$(this).parent().css({'background':'rgba(243, 156, 18, 0.5)', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var gNo = $('input[name=gNo]').val();
				location.href='<%= request.getContextPath() %>/detail.gs?gNo=' + gNo;
			}});
			
		});
		
		
	</script>
    
   
</body>
</html>