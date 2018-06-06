<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Material Design Bootstrap</title>
    <!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/css/mdb.min.css" rel="stylesheet">
</head>
<style>
 .view {
    background: url("https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?cs=srgb&dl=background-brick-wall-bricks-259915.jpg&fm=jpg")no-repeat center center;
    background-size: cover;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
    
    <div class="view intro-2" style="height:100%">
        <div class="full-bg-img">
			<!-- Card -->
			<div class="card" style="max-width: 400px; margin: auto; margin-top: 250px;">
				<!-- Card body -->
				<div class="card-body">
					<!-- Material form login -->
					<p class="h4 text-center mb-4">Sign in</p>
					<form:form modelAttribute="login" action="/login/memLoginOK" method="post">
						<!-- Material input email -->
						<div class="md-form">
							<i class="fa fa-envelope prefix grey-text"></i>
							<form:input type="email" path="id" class="form-control" id="id" />
							<label for="id">Your email</label>
						</div>

						<!-- Material input password -->
						<div class="md-form">
							<i class="fa fa-lock prefix grey-text"></i>
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
							<a data-toggle="modal" data-target="#modalFindIdForm" style="color:#4285F4">Find Email</a>
							/
							<a data-toggle="modal" data-target="#modalFindPwForm" style="color:#4285F4">Password</a>
						</div>
					</form:form>
					</div>
				</div>
			</div>
		</div>

<%-- <div class="modal fade" id="modalFindIdForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Find email</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form modelAttribute="login" action="/login/findIdOK" method="post">
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <i class="fa fa-id-card-o prefix grey-text" aria-hidden="true"></i>
                    <form:input type="email" id="defaultForm-email" class="form-control validate" path="name"/>
                    <label data-error="wrong" data-success="right" for="defaultForm-email">Your name</label>
                </div>

                <div class="md-form mb-4">
                    <i class="fa fa-phone prefix grey-text" aria-hidden="true"></i>
                    <form:input type="password" id="defaultForm-pass" class="form-control validate" path="phone" />
                    <label data-error="wrong" data-success="right" for="defaultForm-pass">Your phone</label>
                </div>
            </div>
            </form:form>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-default">Find ID</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalFindPwForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Find password</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form modelAttribute="login" action="/login/findIdOK" method="post">
            <div class="modal-body mx-3">
                <div class="md-form mb-3">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="email" id="defaultForm-email" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-email">Your email</label>
                </div>

                <div class="md-form mb-3">
                    <i class="fa fa-id-card-o prefix grey-text" aria-hidden="true"></i>
                    <input type="password" id="defaultForm-pass" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-pass">Your name</label>
                </div>
                
                <div class="md-form mb-3">
                    <i class="fa fa-phone prefix grey-text" aria-hidden="true"></i>
                    <input type="password" id="defaultForm-pass" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-pass">Your phone</label>
                </div>
            </div>
            </form:form>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-default">Find Password</button>
            </div>
        </div>
    </div>
</div> --%>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>

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
