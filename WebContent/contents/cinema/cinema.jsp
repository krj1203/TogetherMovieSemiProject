<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.util.ArrayList, cinema.model.vo.*" %>
<%
	ArrayList<Cinema> cList = (ArrayList<Cinema>)request.getAttribute("cList");
	String msg = "오늘의 추천 영화가 없습니다.";
	if(request.getAttribute("msg") != null){
	msg = (String)request.getAttribute("msg");
}
%>

<!DOCTYPE html>
<html>
<head>
<style>
	.clear{
		clear: both;
	}
</style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/cinema/css/style.css"/> 
    <title>극장맛집-친구게시판 초안</title>
    <script src="<%=request.getContextPath() %>/contents/main/js/jquery-3.6.0.min.js"></script>	
</head>
<body>

    	<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
          <div class="cinema">
              <div class="cinema-title">친구</div>
              <div class="cinema-subTitle">친구와 함께 가기 좋은 영화관</div>
          </div>
          <div style="text-align: right;">
            <c:if test="${sessionScope.loginUser.user_id == 'admin'}">
						<button onclick="location.href='<%= request.getContextPath()%>/writeFcinemaForm.ma'"> 영화관 추가 </button>
			</c:if>
          </div>
		<%if(cList != null){ %>
			<%for(Cinema c: cList){ 
			System.out.println(c.getCn_file_path());
			System.out.println(c.getCn_file_name());%>
	          <div class="cinema-wrap">
	            <div class="cinema-wrap__box">
	            	<input type ="hidden" value="<%=c.getCn_no()%>" class ="no">
	                <div class="cinema-logo"><img class="cinema-allLogo" src="<%=request.getContextPath() %>/contents/cinema/images/<%=c.getCn_file_name()%>"/></div>
	                <div class="cinema-name"><%=c.getCn_name() %></div>
	                <div class="cinema-area"><%=c.getArea() %></div>
	                <div class="cinema-address"><%=c.getCn_adress() %></div>
	                <div class="cinema-btn"><button type="button" class="btn-1">보기</button><button class="btn-2" onclick="location.href='<%=c.getCn_sitelink()%>'">예매</button></div>
	            </div>
      		  </div>
			<%} %>
		<%} %>
		
		
        
    </main>
    
 

    <%@include file="../common/footer.jsp" %>
    
    <script>
    	$(function(){
    		$('.btn-1').click(function(){
    			var num = $(this).parents().children('.no').val();
    			console.log(num);
    			
    			
    			location.href ='<%= request.getContextPath()%>/detail.FC?no=' + num;
    		});
    		
    		
    	});
    </script>
</body>
</html>