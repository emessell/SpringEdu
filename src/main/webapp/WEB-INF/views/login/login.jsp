<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
<body>
    <!-- 로그인 화면 -->
    <c:url value="login" var="loginUrl"/>
			<!-- Card -->
			<div class="card" style="max-width: 400px; margin: auto; margin-top: 200px;">
				<!-- Card body -->
				<div class="card-body">
					<!-- Material form login -->
					<p class="h4 text-center mb-4">Sign in</p>
					<form:form action="${pageContext.request.contextPath }/${loginUrl }" method="post">
						<!-- Material input email -->
						<div class="md-form">
							<i class="fa fa-envelope prefix indigo-text"></i>
							<input type="text" name="username" class="form-control" id="username" />
							<label for="username">Your email</label>
						</div>

						<!-- Material input password -->
						<div class="md-form">
							<i class="fa fa-lock prefix indigo-text"></i>
							<input type="password" name="password" class="form-control" id="password" />
							<label for="password">Your password</label>
						</div>

						<div class="text-center mt-4">
							<button id="loginBtn" class="btn btn-indigo" type="submit">Login</button>
							<button id="joinBtn" class="btn btn-indigo" type="button">Join</button>
						</div>
						<div class="text-center mt-4">
							<a data-toggle="modal" data-target="#findIdModal" style="color:#4285F4">Find Email</a>
							/
							<a data-toggle="modal" data-target="#findPwModal" style="color:#4285F4">Password</a>
						</div>
						<div class="text-center mt-4" style="color:red;">
							<c:if test="${param.fail != null }">
    							<b>로그인 실패</b>
    						</c:if>
						</div>
					</form:form>
					</div>
				</div>
<!-- 로그인 화면 끝-->
<script>
	$(function(){
		//회원가입 페이지 이동
		$("#joinBtn").on("click",function(e){
			e.preventDefault();
			location.href="/login/memberJoin"
		})
		//로그인
		$("#loginBtn").on("click",function(e){
			$("form").submit();
		})
	})
</script>
</body>
<jsp:include page="/WEB-INF/views/member/findId.jsp" flush="true"></jsp:include>
<jsp:include page="/WEB-INF/views/member/findPw.jsp" flush="true"></jsp:include>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>