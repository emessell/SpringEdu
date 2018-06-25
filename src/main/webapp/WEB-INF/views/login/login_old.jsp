<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
	$(function(){
		//회원가입 페이지 이동
		$("#joinBtn").on("click",function(e){
			e.preventDefault();
			location.href="/member/memberJoin"
		})
		//로그인
		$("#loginBtn").on("click",function(e){
			e.preventDefault();
			$("form").submit();
		})
		//아이디 찾기 페이지 이동
		$("#findid").on("click",function(e){
			e.preventDefault();
			location.href="/login/findId"
		})
	})
</script>
    <jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>

    <!-- 로그인 화면 -->
			<!-- Card -->
			<div class="card" style="max-width: 400px; margin: auto; margin-top: 200px;">
				<!-- Card body -->
				<div class="card-body">
					<!-- Material form login -->
					<p class="h4 text-center mb-4">Sign in</p>
					<form:form modelAttribute="login" action="/login/memLoginOK" method="post">
						<!-- Material input email -->
						<div class="md-form">
							<i class="fa fa-envelope prefix indigo-text"></i>
							<form:input type="email" path="id" class="form-control" id="id" />
							<label for="id">Your email</label>
						</div>

						<!-- Material input password -->
						<div class="md-form">
							<i class="fa fa-lock prefix indigo-text"></i>
							<form:input type="password" path="passwd" class="form-control"
								id="passwd" />
							<label for="passwd">Your password</label>
						</div>

						<div class="text-center mt-4">
							<button id="loginBtn" class="btn btn-indigo" type="submit">Login</button>
							<button id="joinBtn" class="btn btn-indigo" type="button"
								data-url="/member/memberJoin">Join</button>
						</div>
						<div class="text-center mt-4">
							<a data-toggle="modal" data-target="#findIdModal" style="color:#4285F4">Find Email</a>
							/
							<a data-toggle="modal" data-target="#findPwModal" style="color:#4285F4">Password</a>
						</div>
					</form:form>
					</div>
				</div>
<!-- 로그인 화면 끝-->

<jsp:include page="/WEB-INF/views/member/findId.jsp" flush="true"></jsp:include>
<jsp:include page="/WEB-INF/views/member/findPw.jsp" flush="true"></jsp:include>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>