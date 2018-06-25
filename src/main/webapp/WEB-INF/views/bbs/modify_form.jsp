<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
<body>
	<div class="card" style="width:65%;margin:auto;margin-top:5%;">
		<div class="container">
			<br />
			<h2>글 수정</h2>
			<hr />
			<form:form action="/bbs/modify" method="post">
			<input type="hidden" name="bid" value="${user.username }"/>
			<input type="hidden" name="bnum" value="${modify_form.getBnum() }"/>
				<div class="media">
					<div class="media-body">
						<h4 style="padding: 15px; padding-left: 30px">
							제목 <input name="btitle" class="form-control" type="text"
								value="${modify_form.getBtitle() }" />
						</h4>
						<p align="right" class="media-body">
							글 번호 : ${modify_form.getBnum() } <br /> 작성일 : ${modify_form.getBcdate() } <br />
							작성자 : ${modify_form.getBname() }
						</p>
						<b>내용</b><br />
						<textarea name="bcontent" class="form-control" cols="30" rows="10">${modify_form.getBcontent() }</textarea>
					</div>
				</div>
				<hr>
				<div style="float: right">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><input type="submit" class="page-link"
								role="button" aria-pressed="true" value="수정완료" /></li>
						</ul>
					</nav>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>