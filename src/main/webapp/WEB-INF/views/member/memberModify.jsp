<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/nav.jsp" flush="true"></jsp:include>
<script>
$(function(){
	
	$("input[name=passwd]").on("keyup",function(){
		if($("input[name=passwd]").val() != $("input[name=confirm]").val()){
			$(".passErr").text('비밀번호 확인이 틀립니다.');
			$(this).focus();
		}else{
			$(".passErr").text('');
		}
	})
	
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
<style>
	.form-control{
		width:50%;
	}
	.errmsg{color:red;}
	.passErr{color:red;}
</style>
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="memberVO" action="/member/memberModifyOK" method="post">
<label style="margin-top:30px"></label><br />

<label class="col-lg-2">ID</label>
<form:input type="email" class="form-control-sm" name="id" path="id" placeholder="ID" />
<form:errors path="id" cssClass="errmsg" /><br>

 
<label class="col-lg-2">PASSWORD</label>
<form:input type="password" class="form-control-sm" name="passwd" path="passwd" placeholder="PASSWORD"/>
<br>


<label class="col-lg-2">PASSWORD_CHECK</label>
<input type="password" class="form-control-sm" name="confirm" placeholder="PASSWORD_CHECK"/>
<form:errors path="passwd" cssClass="errmsg" /><br>

<label class="col-lg-2">NAME</label>
<form:input type="text" class="form-control-sm" name="name" path="name" placeholder="NAME"/>
<form:errors path="name" cssClass="errmsg"/><br>


<label class="col-lg-2">PHONE</label>
<form:input type="text" cssClass="form-control-sm" name="phone" path="phone" placeholder="PHONE"/>
<form:errors path="phone" cssClass="errmsg"/><br>


<label class="col-lg-2">BIRTH</label>
<form:input type="text" cssClass="form-control-sm" name="birth" path="birth" placeholder="BIRTH"/>
<form:errors path="birth" cssClass="errmsg"/> <br>

		
<label class="col-lg-2">GENDER</label>
남 <form:radiobutton path="gender" value="M"/>
여 <form:radiobutton path="gender" value="W"/> <br />
	<label class="col-lg-2" style="margin-right:100px;margin-top:30px;"></label>
	<button id="modifyBtn" class="btn btn-danger">회원수정</button>
	<button id="modifyClearBtn" class="btn btn-danger">초기화</button>
	<button id="modifyCancelBtn" class="btn btn-danger">돌아가기</button>
</form:form>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"></jsp:include>