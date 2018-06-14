<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
$(function(){
	$("#foundPwContent").hide();
	$("#findPw").on("click",function(e) {
	   var id = $("input[id=id]").val();
	   var name = $("input[id=names]").val();
	   var phone = $("input[id=phones]").val();
	   $.ajax({
	      type : "GET",
	      url : "/rest/findPwOK",
	      dataType : "text",
	      data : {
	         id, name, phone
	      },
	      success : function(data) {
	         $("#findPwContent").hide();
	         $("#foundPwContent").show();
	         $("#foundPw").html(data);
	      },
	      error : function(e) {
	         alert("조회된 비밀번호가 없습니다.");
	      }
	   }); 
	});
})
</script>
<!-- Modal -->
	<div class="modal fade" id="findPwModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="height:80%;">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="findPwContent">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Find Password</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form modelAttribute="find" method="post">
			<div class="modal-body">
						<!-- Material input email -->
						<div class="md-form">
							<i class="fa fa-envelope prefix indigo-text"></i>
							<form:input type="text" path="id" class="form-control" id="id" />
							<label for="id">Your email</label>
						</div>
						
						<!-- Material input name -->
						<div class="md-form">
							<i class="fa fa-envelope prefix indigo-text"></i>
							<form:input type="text" path="name" class="form-control" id="names" />
							<label for="names">Your name</label>
						</div>

						<!-- Material input password -->
						<div class="md-form">
							<i class="fa fa-lock prefix indigo-text"></i>
							<form:input type="text" path="phone" class="form-control"
								id="phones" />
							<label for="phones">Your phone</label>
						</div>
					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="findPw" class="btn btn-primary" data-target="#modalSubscriptionForm">Find Password</button>
			</div>
			</form:form>
		</div>
		<div class="modal-content" id="foundPwContent">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Your Password</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				Your Password: <span id="foundPw"></span>					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>