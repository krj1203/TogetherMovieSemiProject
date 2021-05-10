<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="goods.model.vo.*, java.util.*"%>
    
<% 
	Goods g = (Goods)request.getAttribute("goods");
	ArrayList<GoodsInfo> fileList = (ArrayList<GoodsInfo>)request.getAttribute("fileList");
	GoodsInfo titleImg = fileList.get(0);
	int gNo = (int)request.getAttribute("gNo");
	

%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/goods/buy.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/main/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/cinema/css/style.css"/>
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
    <title>buy 초안</title>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>

    <%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
			    	<!-- 상품 상세 정보 -->
			   <div align="center">
					<div align="right">
						<c:if test="${sessionScope.loginUser.user_id == 'admin'}">
							<input type="button" class="detailBtn" id="update" onclick="updateBtn();" value="수정">
							<input type="button" class="detailBtn" onclick="goodsDelete();" id="deleteBtn" value="삭제">
						</c:if>
					</div>
				<div class="product_view">
					<h2><%= g.getGoods_title() %></h2>
					<input type="hidden" name="title" value="<%= g.getGoods_title()%>">
					<input type="hidden" name="contents" value="<%= g.getGoods_contents() %>">
					<input type="hidden" name="price" value="<%= g.getGoods_price() %>">
					<input type="hidden" name="img" value="<%= titleImg.getChangeName()%>">
					
					<table>
						<colgroup>
						<col style="width:173px;">
						<col>
						</colgroup>
						<tbody>
						<tr>
							<th>상품 설명</th>
							<td class="contents"><%= g.getGoods_contents() %></td>
						</tr>
						<tr>
							<th>판매가</th>
							<td class="price"><%= g.getGoods_price() %></td>
						</tr>
						<tr>
							<th>제조사/공급사</th>
							<td>MARVEL / 투게더무비</td>
						</tr>
						<tr>
							<th>구매수량</th>
							<td><input type="text" name="count" size="3" class="i1" maxlength="2" value=""></td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료배송</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td class="total"><b><label></label></b>원</td>
							<input type="hidden" name="amount" value="">
						</tr>
						</tbody>
					</table>
					<div class="img">
						<img src="<%= request.getContextPath() %>/goods_uploadFiles/<%= titleImg.getChangeName()%>">
					</div>
					<c:if test="${not empty sessionScope.loginUser}">
					<div class="btns">
						<a class="btn2">구매하기</a>
					</div>
					</c:if>
				</div>
			</div>
    </main>
    <%@include file="../common/footer.jsp" %>
	<script>
		$(function () {
			$('.i1').on('keyup', function (e) {
				$('label').empty();
				var amount = (<%= g.getGoods_price() %>*$('.i1').val());
				$('label').append(amount);		
				$('input[name=amount]').attr('value',amount);
				console.log(amount);
			});
		});
		</script>
		<script>
		$(function () {
			$('.btn2').click(function () {
				var amount = $('input[name=amount]').val();
				var count = $('input[name=count]').val();
				var title = $('input[name=title]').val();

				var gNo = <%= gNo %>;
				
				location.href='<%= request.getContextPath()%>/pay.gs?amount=' + amount + '&count=' + count + '&title=' + "title" + '&gNo=' +gNo;

		

			});
		});
		
		function goodsDelete(){
    		var bool = confirm('정말 삭제하시겠습니까?');
    		var gNo = <%= gNo %>;
    		if(bool){
    			location.href='<%= request.getContextPath() %>/delete.gs?gNo=' + gNo;
    		}
    	};
    	
    	$(function () {
    		$('#update').click(function () {
				
    		var gNo = <%= gNo %>;
    		var price = $('input[name=price]').val();
    		var contents = $('input[name=contents]').val();
    		var title = $('input[name=title]').val();
    		var img = $('input[name=img]').val();
    		
    		location.href='<%= request.getContextPath() %>/update.gs?gNo=' + gNo + '&price=' + price + '&title=' + title + '&contents=' + contents +'&img=' + img;
			});
		});
    	
//     	function updateBtn(){
<%--     		var gNo = <%= gNo %>; --%>
//     		var price = $('input[name=price]').val();
//     		var contents = $('input[name=contents]').val();
//     		var title = $('input[name=title]').val();
<%--     		location.href='<%= request.getContextPath() %>/update.gs?gNo=' + gNo + '&price=' + price + '&title=' + "title" + '&contents=' +"contents"; --%>
//     	};
    	
	</script>
</body>
</html>