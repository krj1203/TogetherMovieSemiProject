<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.util.ArrayList, mainpage.model.vo.*"%>
<%
	//값을 받아오는 부분
	ArrayList<MainPage> mList = (ArrayList<MainPage>)request.getAttribute("mList");
	String msg = "오늘의 추천 영화가 없습니다.";
	if(request.getAttribute("msg") != null){
		msg = (String)request.getAttribute("msg");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.clear{
		clear: both;
	}
	.foot{
		margin-top: 200px;
	}
</style>
<head>
	<!-- 04.22 12:48  서만가 접속 완료 주석 -->
	<!-- 연동 완료!  -->
	
	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="contents/cinema/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="contents/main/css/index.css" />
    <link rel="stylesheet" type="text/css" href="contents/main/css/lightsider.css" />
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<script src="contents/main/js/lightslider.js"></script>
    <title>자유게시판 초안</title>
    <script>
	$(document).ready(function() {
		$('#autoWidth').lightSlider({
			autoWidth : true,
			loop : true,
			onSliderLoad : function() {
				$('#autoWidth').removeClass('cS-hidden');
			}
		});
	});
</script>
    
</head>

<body>
    <%@include file="contents/common/loginbar.jsp" %>
    <main>
       <%@include file="contents/common/header.jsp" %>
          
    	  <div class="container">
			<ul id="autoWidth" class="cs-hidden">
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
				<li class="item-a">
					<div class="box">
						<p class="movie"></p>
						<img src="">
					</div>
				</li>
			</ul>

		
		</div>
		<div class="middle-subtitle">
			
			<div><span>오늘의 추천 영화</span></div>
		
		</div>
				
		<%if(mList != null){ %>
		<!-- 이미지를 받아와서 구현을 해야하는데 일단 이미지를 넣을게 없으니 writer부터 -->
		<div class="mid">
			<div class="mid-item">
				<div class="mid-title">
					추천!
				</div>
				<div class="mid-img">
					<img src="contents/main/img/1.jpg">
				</div>
				<div class="mid-star">
					★★★☆☆
				</div>
			</div>
        </div>
        <%}else{ %>
        <label><%= msg %></label>
        <%} %>
    
    
    </main>
    
    
    
    
    <div class="foot">
    
        <%@include file="contents/common/footer.jsp" %>
    </div>
    
    
    <script>
    	$(function(){
    		//페이지 로딩시 한번만 실행(메인 슬라이드의 이미지들)
    		$.ajax({
    			url:'ImageLoad.do',
    			type: 'post',
    			success: function(data){
    				console.log('ImageLoad 실행');
    				console.log(data);
    			},
    			error: function(data){
    				console.log('ImageLoad 실행 실패');
    			}
    		});
    	});
    </script>
</body>
</html>