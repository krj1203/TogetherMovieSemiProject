<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
		header {
  width: 1280px;
  height: 40px;
  background-color: rgb(243, 156, 18);
  margin: auto;
}
.header-bar {
  height: 100%;
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-end;
  align-items: center;
}

.header-bar__menu {
  font-size: 14px;
  border-right: 1px solid white;
  padding-left: 20px;
  padding-right: 30px;
}

.header-bar__menu:last-child {
  border-right: none;
}

.header-bar__menu a{
	color:white;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<header>
       <c:if test="${empty sessionScope.loginUser}">
       <ul class="header-bar">
            <li class="header-bar__menu"><a href="#">마이페이지</a></li>
            <li class="header-bar__menu"><a href="<c:url value='/' />/login.do">로그인</a></li>
            <li class="header-bar__menu"><a href="insertMember.do">회원가입</a></li>
            <li class="header-bar__menu"><a href="#">고객센터</a></li>
       </ul>
    </c:if>
    <c:if test="${not empty sessionScope.loginUser}">
       <ul class="header-bar">
       		<li class="header-bar__menu"><a href="#"><c:out value="${loginUser.user_nickName }"></c:out></a></li>
            <li class="header-bar__menu"><a href="#">마이페이지</a></li>
            <li class="header-bar__menu"><a href="<c:url value='/' />/logout.do">로그아웃</a></li>
            <li class="header-bar__menu"><a href="#">고객센터</a></li>
       </ul>
    </c:if>
    </header>
</body>
</html>