<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
<script>
	$(function(){
		$("#modi, #del, #list").on("click",function(){
			$(location).attr('href',attr('data-url'));
		});
	})
</script>
<style>
#modi,#del,td{
	margin:0px;
}
.card{
	width:70%;
	margin:auto;
	
}
</style>
</head>
<title>Insert title here</title>
<body>
<div class="card">
<table class="table">
	<tr>
		<th scope="row">#</th>
		<th>아이디</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>전화번호</th>
		<th>성별</th>
	</tr>
	<c:forEach items="${memberVOS }" var="memberVO">
	<tr>
		<td scope="row">#</td>
		<td>${memberVO.id }</td>
		<td>${memberVO.name }</td>
		<td>${memberVO.birth }</td>
		<td>${memberVO.phone }</td>
		<td>
		 ${memberVO.gender } 
			<c:if test="${memberVO.gender == 'M'}">남</c:if>
			<c:if test="${memberVO.gender == 'W'}">여</c:if>
		</td>
		<td><button class="btn btn-outline-indigo waves-effect" id="modi" data-url="/member/memberModify/${memberVO.id }">수정</button></td>
		<td><button class="btn btn-outline-indigo waves-effect" id="del" data-url="/member/memberDelete/${memberVO.id }">삭제</button></td>
	</tr>
	</c:forEach>
</table>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>