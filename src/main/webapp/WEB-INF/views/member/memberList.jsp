<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
    <!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/css/mdb.min.css" rel="stylesheet">

<script>
	$(function(){
		$("#modi, #del, #list").on("click",function(){
			$(location).attr('href',attr('data-url'));
		});
	})
</script>
</head>
<title>Insert title here</title>
<body>

<table>
	<tr>
		<th>#</th>
		<th>아이디</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>전화번호</th>
		<th>성별</th>
	</tr>
	<c:forEach items="${memberVOS }" var="memberVO">
	<tr>
		<td>#</td>
		<td>${memberVO.id }</td>
		<td>${memberVO.name }</td>
		<td>${memberVO.birth }</td>
		<td>${memberVO.phone }</td>
		<td>
		 ${memberVO.gender } 
			<c:if test="${memberVO.gender == 'M'}">남</c:if>
			<c:if test="${memberVO.gender == 'W'}">여</c:if>
		</td>
		<td><button id="modi" data-url="/member/memberModify/${memberVO.id }">수정</button></td>
		<td><button id="del" data-url="/member/memberDelete/${memberVO.id }">삭제</button></td>
	</tr>
	</c:forEach>
	
</table>


	<!-- SCRIPTS -->
    <!-- JQuery -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/js/mdb.min.js"></script>
</body>
</html>