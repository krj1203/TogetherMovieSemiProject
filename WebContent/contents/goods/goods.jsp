<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.util.ArrayList, goods.model.vo.*, board.model.vo.PageInfo"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<% 
	ArrayList<Goods> gList = (ArrayList<Goods>)request.getAttribute("gList");
	ArrayList<GoodsInfo> fList = (ArrayList<GoodsInfo>)request.getAttribute("fList");

	System.out.println(gList);
	System.out.println(fList);
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/main/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/cinema/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/goods/goods.css"/>
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    
<style>
.foot{
		margin-top: 200px;
}
	.middle-subtitle{
	width:100%;
	display:flex;
	justify-content: center;
	align-items: center;
}
footer {
  width: 1280px;
  height: 220px;
  background-color: var(--mainColor);
  margin: auto;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.footer-box {
  display: flex;
  align-items: center;
  text-align: center;
  
}

.footer-logo img {
  margin-left: 82px;
  width: 150px;
  height: 150px;
  margin-top: 20px;
  
  
}

.footer-write{
  color: white;
  text-align: center; 
  margin-right: 230px;
}


		#mainBottom{ margin-top: 20px; }
		
		.pagination {
		  margin-left: 42%;
		  margin-top: 20px;
		}
		
		.page-item {
		  color: black;
		  float: left;
		  font-size: 15px;
		  padding: 8px 16px;
		  text-decoration: none; 
		  background: none;
		  border: 1px solid rgba(243, 156, 18, 0.5);
		}
		
		.page-item.active {
		  background-color: rgba(243, 156, 18, 0.5);
		  color: white;
		}
		
		.page-item:hover:not(.active) {background-color: rgba(243, 156, 18, 0.5);}	
		
		
.middle-subtitle>div{
	
	width:300px;
	height:48px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgb(102, 102, 102);
	color:white;
	font-size: 11pt;
    cursor: pointer;
    margin-left: 100px;
    border-radius: 10px;
	
}
#content_list h3{
	float: left;
	margin-left: 570px;
	font-size: 30px;
}

#content_list button{
	float: right;
}
.clear{
	clear: both;
}
.items{
	width: 230px;
	float: left;
	margin: 30px 0 0 65px;
	
}
.items li img{
	border: 1px solid #333;
}
.items li img:hover{
 	transform:scale(1.04);
	transition: transform .5s;

}
.a{
	font-weight: bold;
	color: black;
	margin-top: 5px;
}
.b{
	font-weight: bold;
	color: black;
	margin-top: 5px;
}
.b span{
	color: #a26f59;
}
.c{
	font-size: 10px;
	margin-top: 5px;
	line-height: 150%;
}
.d{
	font-size: 13px;
}
.d span{
	color: #a26f59;
}
ul{
	padding: 0;
	list-style: none;
}
.list h4{
	bold;
	size: 20px;
	
}
</style>
</head>

<body>
	 <%@include file="../common/loginbar.jsp" %>
    	<main>
       	<%@include file="../common/header.jsp" %>
		<!-- 상품 -->
		<section id="content_list">
			<div class="list">
				<div class="middle-subtitle">
					<div><span>상품 목록</span></div>
				</div>
				<div>
				<c:if test="${sessionScope.loginUser.user_id == 'admin'}">
					<button onclick="location.href='<%=request.getContextPath()%>/writeGoodsForm.gs'"> 상품추가 </button>
				</c:if>
				</div>
			<div class="clear"></div>
			<%if(gList.isEmpty() || fList.isEmpty()){ %>
			<div> 등록된 상품이 없습니다.</div>
			<% } else {%>
				<% for(int i = 0; i < gList.size(); i++){ %>
					<% Goods g = gList.get(i); %>
					<div class="thumb-list">
						<div>
							<input type="hidden" id="gNo" name="gNo" value="<%= g.getGoods_no() %>">
								<% for(int j = 0; j < fList.size(); j++){ %>
									<% GoodsInfo a = fList.get(j); %>
									<% if(g.getGoods_no() == a.getGoodsNo()) {%>
										<ul	class="items">
											<li><img class="imgs" src="<%= request.getContextPath()%>/goods_uploadFiles/<%= a.getChangeName()%>"></li>
											<li class="a"><%= g.getGoods_title() %></li>
											<li class="b"> <%=g.getGoods_price() %></li>
											<li class="c">&quot; <%=g.getGoods_contents() %></li>
										</ul>
									<% }  %>
								<%} %>	
						</div>
					</div>
				<% } %>
			<% } %>
			</div>
			
			
			
			
			<div class="clear"></div>
			
			
			
			</section>
		</div>
		</main>
		<div class="foot">
		<script>
		$(function name() {
			$('.thumb-list').click(function () {
				var gNo = $(this).children().children().eq(0).val();
				location.href='<%= request.getContextPath()%>/detail.gs?gNo=' + gNo;
			});
		});
		</script>
	 <%@include file="../common/footer.jsp" %>
		
		
</body>
</html>