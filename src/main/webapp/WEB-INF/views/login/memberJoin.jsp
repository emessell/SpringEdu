<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
.view {
    background: url("https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?cs=srgb&dl=background-brick-wall-bricks-259915.jpg&fm=jpg")no-repeat center center;
    background-size: cover;
}
	.form-control{
		width:50%;
	}
	.errmsg{color:red;}
	.passErr{color:red;}
	/* Customize the label (the container) */
#gg {
  display: block;
  position: relative;
  padding-left: 24px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 15px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
#gg input {
  position: absolute;
  opacity: 0;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 4px;
  left: 0;
  height: 15px;
  width: 15px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
#gg:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
#gg input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
#gg:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
#gg input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
#gg .checkmark:after {
  top: 9px;
  left: 9px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
}
	
</style>
<title>Join Form</title>
</head>
<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
<body>
<!--Main Navigation-->
            <!-- Card -->
				<div class="card" style="max-width: 400px; margin: auto; margin-top: 150px;">

					<!-- Card body -->
					<div class="card-body">

						<!-- Material form register -->
						<form:form modelAttribute="memberVO" action="/member/memberJoinOK" method="post">
							<p class="h4 text-center py-3">Sign up</p>

							<!-- Material input email -->
							<div class="md-form">
								<i class="fa fa-envelope prefix indigo-text"></i>
								<form:input type="email" class="form-control" name="id"
									path="id" id="1" />
								<form:errors path="id" cssClass="errmsg" />
								<label for="1" class="font-weight-light">Your email</label>
							</div>

							<!-- Material input password -->
							<div class="md-form">
								<i class="fa fa-key prefix indigo-text" aria-hidden="true"></i>
								<form:input type="password" class="form-control" name="passwd"
									path="passwd" id="2" />
								<label for="2" class="font-weight-light">Your password</label>
							</div>

							<!-- Material input password check -->
							<div class="md-form">
								<i class="fa fa-exclamation-triangle prefix indigo-text"></i> <input
									type="password" class="form-control" id="3" />
								<form:errors path="passwd" cssClass="errmsg" />
								<label for="3" class="font-weight-light">Confirm your
									password</label>
							</div>

							<!-- Material input name -->
							<div class="md-form">
								<i class="fa fa-id-card-o prefix indigo-text" aria-hidden="true"></i>
								<form:input type="text" class="form-control" name="name"
									path="name" id="4" />
								<form:errors path="name" cssClass="errmsg" />
								<label for="4" class="font-weight-light">Your name</label>
							</div>
							<!-- Material input phone -->
							<div class="md-form">
								<i class="fa fa-phone prefix indigo-text" aria-hidden="true"></i>
								<form:input type="text" cssClass="form-control" name="phone"
									path="phone" id="5" />
								<form:errors path="phone" cssClass="errmsg" />
								<label for="5" class="font-weight-light">Your phone</label>
							</div>
							<!-- Material input birth -->
							<div class="md-form">
								<i class="fa fa-birthday-cake prefix indigo-text"
									aria-hidden="true"></i>
								<form:input type="text" cssClass="form-control" name="birth"
									path="birth" id="6" />
								<form:errors path="birth" cssClass="errmsg" />
								<label for="6" class="font-weight-light">Your birth</label>
							</div>
							<div class="md-form" style="margin-top:10px;">
								<i class="fa fa-venus-mars prefix indigo-text" aria-hidden="true"></i>
								<label class="font-weight-light" id="gg" style="float">
								Man<form:radiobutton path="gender" value="M" />
								<span class="checkmark"></span> </label>
								<label class="font-weight-light" id="gg">
								Woman<form:radiobutton path="gender" value="W" />
								<span class="checkmark"></span> </label>
							</div>
						</form:form>

						<!-- Material form register -->
						<div class="row" style="margin:auto; margin-top: 20px; margin-left:8px;">
							<button class="btn btn-info" id="joinCancelBtn">Back</button>
							<button class="btn btn-default" id="joinClearBtn">Reset</button>
							<button class="btn btn-primary"	id="joinBtn">Join</button>
						</div>
					</div>
					<!-- Card body -->
				</div>
				<!-- Card -->
<!--Main Navigation-->

<script>
$(function(){
	$("input[name=confirm]").on("keyup",function(){
		if($("input[name=passwd]").val() != $("input[name=confirm]").val()){
			$(".passErr").text('비밀번호 확인이 틀립니다.');
			$(this).focus();
		}else{
			$(".passErr").text('');
		}
	});
	
	$("#joinBtn").on("click",function(e){
		e.preventDefault();
		$("form").submit();
	});
		
	$("#joinClearBtn").on("click",function(e){
		e.preventDefault();
		$("form").each(function(){
			this.reset();
		});
	});
		
	$("#joinCancelBtn").on("click",function(e){
		e.preventDefault();
		location.href="/";
	});
});
</script>

</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>