<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.util.ArrayList, movieInfo.model.vo.*"%>
<% 
	ArrayList<MovieInfo> RList = (ArrayList<MovieInfo>)request.getAttribute("RIList");
	ArrayList<MovieInfo> SList = (ArrayList<MovieInfo>)request.getAttribute("SList");
	ArrayList<MovieFile> FList = (ArrayList<MovieFile>)request.getAttribute("FList");
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
	




.middle-subtitle{
	margin-top:60px;
	width:100%;
	display:flex;
	justify-content: center;
	align-items: center;
}

.middle-subtitle>div{
	
	width:478px;
	height:48px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgb(102, 102, 102);
	color:white;
	font-size: 11pt;
    cursor: pointer;
	
}





.container {
	width: 100%;
	height: 600px;
	background: gray;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	
}

.box {
	width: 350px;
	height: 450px;
	background-color: #1e1e26;
	border-radius: 10px;
	box-shadow: 2px 10px 12px rgba(0, 0, 0, 0.5);

}

.box:hover {
	background-color: #17171d;
	transform-style: preserve-3d;
	transform: scale(1.02);
	transition: all ease 0.3s;
}




.mid{
	margin-top:40px;
	display: inline;
	
}
.mid-item{
	width: 310px;
	height: 600px;
	border: 0.5px;
	margin: 0 auto;
	margin-top: 40px;
	border-radius: 10px;
	display:inline-block;
	
}
.mid-title{
width:310px;
	font-size: 1.5rem;
	background:  rgb(243, 156, 18);
	text-align: center;
	height: 53px;
	line-height: 53px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
	color:white;
	
}
.mid-img{
	font-size: 2.5rem;
	text-align: center;
	
}
.mid-star{
	padding: .5rem 1rem;
	font-size: 1.25rem;
	border-radius: .2rem;
	color: rgb(255,0,0);
	background-color: transparent;
	background-image: none;
	border-color: #007bff;
	text-align: center;
	
}


.bin{
	display: flex;
	flex-direction: row;

}
	
</style>
<head>
	<!-- 04.22 12:48  서만가 접속 완료 주석 -->
	<!-- 연동 완료!  -->
	
	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/cinema/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/main/css/lightsider.css" />
    <%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/main/css/index.css"/>
 --%>	
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
    <%@include file="../../contents/common/loginbar.jsp" %>
    <main>
       <%@include file="../../contents/common/header.jsp" %>
          
    	 <div class="container" style="background-color: white;">
    	  	<%if(SList.isEmpty() || FList.isEmpty()){ %>
    	  	
    	  		<%}else{ %>
				<ul id="autoWidth" class="cs-hidden">
    	  			<%for(int i = 0; i < SList.size(); i++){ 
    	  				MovieInfo S = SList.get(i);%>
    	  				<%for(int j = 0; j < FList.size(); j++){
    	  					MovieFile F = FList.get(j);%>
    	  					
    	  					<%if(F.getMovieNo() == S.getMovieNo()){ 
    	  					System.out.println("S : " + S.getMovieNo() + " / " + F.getMovieNo());%>
								<li class="item-a">
									<div class="box">
										<p class="movie"></p>
										<img src="<%=request.getContextPath()%>/uploadFiles/<%=F.getChangeName() %>" style="width:100%; height:100%;">
									</div>
								</li>
							<%} %>
							
						<%} %>
					<%} %>
				</ul>
				<%} %>
		</div>
		
		<div class="middle-subtitle">
			
			<div><span>오늘의 추천 영화</span></div>
		</div>
			<div style="text-align: right;">
            
          </div>
			
			<ul class="mid">
				
	        </ul>
			
    
    
    </main>
    
    
    
    
    <div class="foot">
    
        <%@include file="../../contents/common/footer.jsp" %>
    </div>
    
    <script>
    $(function(){
		//페이지 로딩시 한번만 실행(메인 슬라이드의 이미지들)
		 $.ajax({
			url:'ImageLoad.do',
			success: function(data){
				console.log('ImageLoad 실행');
				console.log(data);
				
				
				for(var i in data){
					
					$('.mid').append(
							'<li class="mid-item" onclick="goDetail()" style="margin:50px;">' +
							'<input type="hidden" id="sNo" name="sNo" value='+data[i].movieNo+'>'+
							'<div class="mid-title">'+ data[i].movieTitle +
							'</div>'+
							
							'<div class="mid-img">'+
							'<img src="uploadFiles/'+data[i].changeName+'" style="width: 100%; height: 400px;">'+
							'</div>'+
							
							'</li>'
							);
					
				}
			},
			error: function(data){
				console.log('ImageLoad 실행 실패');
				console.log(data);
			}
		}); 
		
	});
    
    
   	function goDetail(){
		$('.mid-item').click(function () {
			console.log('클릭됨');
			var w = window.open("about:blank", '영화 상 세정보',
								'width=900, height=800, left=200,  menubar=no, status=no, toolbar=no, location=no');
			var sNo = $(this).children().eq(0).val();
			 console.log(sNo);
			 
			 url='<%= request.getContextPath()%>/BMoviedetail.mo?sNo=' + sNo;
			   
			 
			 $.ajax({
	                url:'BMoviedetail.mo',
	                data:{sNo : sNo},
	                success:function(data){
	                   console.log('통신성공');
	                   w.location.href=url;
	                }
	             });
	          });
	       
	       };
    
    
    
    
    </script>
    
</body>
</html>