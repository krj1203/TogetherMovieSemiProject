<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="goods.model.vo.*, java.util.*"%>
<% 
	Goods g = (Goods)request.getAttribute("goods");
	ArrayList<GoodsInfo> fileList = (ArrayList<GoodsInfo>)request.getAttribute("fileList");
	GoodsInfo titleImg = fileList.get(0);

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
    
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>

    <%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
			    	<!-- 상품 상세 정보 -->
			   <div align="center">
				<div class="product_view">
					<h2><%= g.getGoods_title() %></h2>
					<table>
						<colgroup>
						<col style="width:173px;">
						<col>
						</colgroup>
						<tbody>
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
							<td><input type="text" size="3" class="i1" maxlength="2"></td>
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
					<div class="btns">
						<a class="btn2">구매하기</a>
					</div>
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
		$(function () {
			$('.btns').click(function () {
				var amount = $('input[name=amount]').val();
				location.href='<%= request.getContextPath()%>/pay.gs?amount=' + amount;
			});
		});

		


	</script>
</body>
</html>