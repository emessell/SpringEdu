<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<script src="/webedu/public/jquery/jquery-3.3.1.js"></script>
<script>
	$(function(){
		
		//회원가입 페이지 이동
		$("#join").on("click",function(e){
			e.preventDefault();
			location.href="/member/memberJoin"
		})
		//로그인
		$("#login").on("click",function(e){
			e.preventDefault();
			$("form").submit();
		})
	})
</script>
</head>
<body>
	<hr /> <br />
	<h1>Login</h1>
	<br /> <hr />
	<form:form modelAttribute="user" action="/login/memLoginOK.jsp" method="post">
		<table>
			<tr>
				<th>아이디</th>
					<td><form:input path="id"/></td>
					<td></td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td><form:input path="passwd"/></td>
					<td></td>
			</tr>
			<tr>
				<th></th>
					<td><button id="login">로그인</button></td>
					<td></td>
			</tr>
			<tr>
				<th></th>
					<td><button id="join" data-url="/member/memberJoin">회원가입</button></td>
					<td></td>
			</tr>
		</table>
	</form:form>
</body>
</html>