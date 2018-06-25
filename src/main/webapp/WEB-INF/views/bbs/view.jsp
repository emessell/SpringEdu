<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
<title>view</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
	<div class="container card" style="margin-top: 5%">
		<br />
		<h2>
			<small>#${view.getBnum() }</small>_${view.getBtitle() } ${login.id }
		</h2>

		<form action="/bbs/delete" method="post">
			<div class="media">
				<div class="media-body">
					<p align="right" class="media-body">
						글 번호 : ${view.getBnum() }<br /> 작성일 : ${view.getBcdate() }<br />
						작성자 : ${view.getBname() }
					</p>
					<pre>
						<center> ${view.getBcontent() } </center>
					</pre>
					<input type="hidden" name="bnum" value="${view.getBnum() }" />
				</div>
			</div>
			<div style="float: right;">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="/bbs/list">목록으로</a></li>
						<c:if test="${user.username eq view.bid }">
						<li class="page-item"><a class="page-link"href="/bbs/modify_form?bnum=${view.getBnum() }">수정</a></li>
						<li class="page-item"><input type="submit" class="page-link" value="삭제" /></li>
							</c:if>
							<li class="page-item"><a href="replyView?bnum=${view.getBnum() }"
							class="page-link" id="mybtn1" role="button" aria-pressed="true">답글</a></li>
						<%-- <li class="page-item"><a class="page-link" href="view?bnum=${view.getpnum() }">Previous</a></li>
    <li class="page-item"><a class="page-link" href="view?bnum=${view.getnnum() }">Next</a></li> --%>
					</ul>
				</nav>
			</div>
		</form>
		<jsp:include page="reply.jsp" />
	</div>

</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>