<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- jstl을 사용하지 않는 경우  -->
	<%
		String str = request.getParameter("color");
		int color = Integer.parseInt(str);
		
		if(color==1){
	%>
		<span style="color:red;"></span>
		
	<%
		}
	
	%>	
	
	
	<!-- jstl을 사용하는 경우 -->
	
	<c:if test="${param.color==1 }">
		<span style="color:red">빨강</span>
	</c:if>
	
	
	<!--  -->

</body>
</html>