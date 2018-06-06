<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="/webjars/font-awesome/5.0.13/web-fonts-with-css/css/fontawesome-all.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style>
	body{
	max-width: 500px;
    margin: auto;
	}
	.block {
    display: block;
    width: 100%;
    border: none;
    background-color: #4CAF50;
    padding: 14px 28px;
    font-size: 16px;
    cursor: pointer;
    text-align: center;
}
</style>
<script src="/webedu/public/jquery/jquery-3.3.1.js"></script>
<script>
	$(function(){
		//회원가입 페이지 이동
		$("#join").on("click",function(e){
			e.preventDefault();
			location.href="/member/memberJoin"
		})
		//로그인
		$("#loginBtn").on("click",function(e){
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
	<form:form modelAttribute="login" action="/login/memLoginOK" method="post">
		<table>
			<tr>
				<th>아이디</th>
					<td><form:input path="id"/></td>
					<td></td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td><form:input path="passwd" type="password"/></td>
					<td></td>
			</tr>
		</table>
		<button id="loginBtn" class="btn btn-success">로그인</button>
		<button id="join" class="btn btn-success" data-url="/member/memberJoin">회원가입</button>
	</form:form>
</body>
</html>