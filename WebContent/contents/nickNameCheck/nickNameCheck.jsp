<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2>닉네임 중복확인</h2>
	<form action="nickNameCheck.do" method="get" name="frm">
		닉네임 <input type=text name="user_nickName" value="${user_nickName}"> <input type=submit
			value="닉네임 중복 체크"> <br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.user_nickName.value = "";
			</script>
			${user_nickName}은 이미 사용 중인 닉네임입니다.
		</c:if>
		<c:if test="${result==-1}">
		${user_nickName}은 사용 가능한 닉네임입니다.
		<input type="button" value="사용" class="cancel" onclick="nickNameok('${user_nickName}')">
		</c:if>
	</form>
</body>
</html>