<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
$(function(){
	$("#foundIdModal").hide();
	$("#findID").on("click",function(e) {
	    var name = $("input[name=name]").val();
	   var phone = $("input[name=phone]").val();
	   $.ajax({
	      type : "GET",
	      url : "/rest/findIdOK",
	      dataType : "text",
	      data : {
	         name, phone
	      },
	      success : function(data) {
	         $("#findIdContent").hide();
	         $("#foundIdModal").show();
	         $("#foundId").html(data);
	      },
	      error : function(e) {
	         alert("조회된 아이디가 없습니다.");
	      }
	   }); 
	});
})
</script>

<!-- Modal -->
<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="height:80%;">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="findIdContent">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Find ID</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form modelAttribute="findId" method="post">
			<div class="modal-body">
						<!-- Material input email -->
						<div class="md-form">
							<i class="fa fa-envelope prefix indigo-text"></i>
							<form:input type="text" path="name" class="form-control" id="name" />
							<label for="name">Your name</label>
						</div>

						<!-- Material input password -->
						<div class="md-form">
							<i class="fa fa-lock prefix indigo-text"></i>
							<form:input type="text" path="phone" class="form-control"
								id="phone" />
							<label for="phone">Your phone</label>
						</div>
					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="findID" class="btn btn-primary" data-target="#modalSubscriptionForm">Find ID</button>
			</div>
			</form:form>
		</div>
		<div class="modal-content" id="foundIdModal">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Your ID</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<span id="foundId"></span>					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>