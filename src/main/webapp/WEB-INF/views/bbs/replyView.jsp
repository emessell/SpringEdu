<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1 class="display-4">
			<br />답글 쓰기<br />
		</h1>
		<form:form action="/bbs/reply" method="post">
		<input type="hidden" name="bid" value="${user.username }"/>
			<table class="table table-hover">
				<input type="hidden" name="bgroup" value="${replyView.bgroup }" />
				<input type="hidden" name="bstep" value="${replyView.bstep }" />
				<input type="hidden" name="bindent" value="${replyView.bindent }" />
				<tr>
					<th scope="col">제목</th>
					<td scope="col"><input type="text" name="btitle"
						class="form-control" value="${replyView.getBtitle() }"></td>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td scope="col"><input type="text" name="bname" value="${user.name }" readOnly="true"
						class="form-control"></td>
				</tr>
				<tr>
					<th scope="col">내용</th>
					<td scope="col"><textarea class="form-control" name="bcontent">${replyView.getBcontent() }</textarea></td>
				</tr>
				<table style="float: right">
					<tr>
						<td>
							<ul class="pagination">
								<li class="page-item"><input class="page-link" type="submit" value="답글등록"></li>
								<li class="page-item"><a href="/bbs/list" role="button" class="page-link" aria-pressed="true">목록으로</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</table>
		</form:form>
	</div>
</body>
</html>