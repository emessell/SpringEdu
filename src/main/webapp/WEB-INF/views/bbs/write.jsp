<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/nav.jsp" flush="true" />
	<div class="card"
		style="max-width: 70%; margin: auto; margin-top: 5%; filter: drop-shadow(0 0 0.75rem);">
		<div class="container">
			<h1 class="display-4" style="margin: 15px;">
				글쓰기<br />
			</h1>
			<form:form action="/bbs/write" method="post">
			<input type="hidden" name="bid" value="${user.username }"/>
			<%-- <sec:csrfInput/> --%>
				<table class="table">
					<tr>
						<th scope="col">제목</th>
						<td scope="col"><input type="text" name="btitle"
							class="form-control" placeholder="제목"></td>
					</tr>
					<tr>
						<th scope="col">작성자</th>
						<td scope="col"><input type="text" name="bname"
							class="form-control" placeholder="작성자" value="${user.name }" readOnly="true"></td>
					</tr>
					<tr>
						<th scope="col">내용</th>
						<td scope="col"><textarea class="form-control"
								name="bcontent" placeholder="내용" rows="7" cols="50"></textarea>
						</td>
					</tr>
					<table style="float: right">
						<tr>
							<td>
								<ul class="pagination">
									<li class="page-item"><input type="submit"
										class="page-link" value="글쓰기" /></li>
									<li class="page-item"><a href="/bbs/list" role="button"
										class="page-link" aria-pressed="true">목록으로</a></li>
								</ul>
							</td>
						</tr>
					</table>
				</table>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>