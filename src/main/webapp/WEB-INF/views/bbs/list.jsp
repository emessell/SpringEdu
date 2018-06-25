<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a :hover :not  (.active ) {
	background-color: #ddd;
}

td {
	padding: 0px;
}

.table td {
	padding: 5px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
	<div class="card" style="max-width: 65%; margin: auto; margin-top: 5%;">
		<div class="container">
			<br />
			<h2>게시판</h2>
					<select name="searchType" class="form-control-sm">
							<option <c:out value="${searchType == 'TC' ? 'selected' : ''}" />>제목+내용</option>
							<option <c:out value="${searchType == 'W' ? 'selected' : ''}" />>작성자</option>
							<option <c:out value="${searchType == 'T' ? 'selected' : ''}" />>제목</option>
							<option <c:out value="${searchType == 'C' ? 'selected' : ''}" />>내용</option>
					</select>
					<input type="text" name="keyword" placeholder="Search" class="form-control-sm" value="${keyword }" />
					<input type="button" class="btn btn-indigo btn-sm" id="searchBtn" value="검색" />
					<a role="button" class="btn btn-indigo btn-sm" href="/bbs/write" style="float:right">글쓰기</a>

		<div style="height: 670px; max-width:100%; overflow-y: auto; margin-bottom:10px;">
			<table class="table" >
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="dto">
						<tr>
							<th scope="row">${dto.bnum }</th>
							<td style="height:15px;"><c:forEach begin="1" end="${dto.bindent }">[답]</c:forEach>
								<a href="view?bnum=${dto.bnum }">${dto.btitle }</a></td>
							<td style="height:15px;">${dto.bname }</td>
							<td style="height:15px;">${dto.bcdate }</td>
							<td style="height:5px;">${dto.bhit }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr></tr>
			</table>
		</div>
			<table style="float:right;">
				<tr>
					<td width="95%">
						<ul id="pageing" class="pagination pagination-sm">
							<c:if test="${page.prev }">
								<li class="page-item"><a class="page-link" href="list?page.finalEndPage">처음</a></li>
								<li class="page-item"><a class="page-link" href="list?${page.getmakeURL(page.startPage-1) }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
							</c:if>

							<c:forEach begin="${page.startPage }" end="${page.endPage }"
								var="PAGE">
								<c:if test="${page.recordCriteria.reqPage == PAGE }">
									<li class="page-item active"><a class="page-link" href="#">${PAGE }</a></li>
								</c:if>
								<c:if test="${page.recordCriteria.reqPage != PAGE }">
									<li class="page-item"><a class="page-link"
										href="list?${page.getmakeURL(PAGE) }">${PAGE }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page.next }">
								<li class="page-item"><a class="page-link"
									href="list?${page.getmakeURL(page.endPage+1) }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="list?${page.getmakeURL(page.finalEndPage) }">마지막</a></li>
							</c:if>
						</ul>
					</td>
				</tr>

			</table>
		</div>
	</div>
	<script>
	$(function() {
		$("input[id='searchBtn']").click(function() {
			alert("검색");
			self.location = "list?reqPage=1"
			+ "&searchType=" + $("[name=searchType]").val() + "&keyword=" + $("[name=keyword]").val();
		});
	});
</script>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>