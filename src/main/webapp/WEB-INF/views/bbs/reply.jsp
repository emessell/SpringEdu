<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
<style>
	#modifyDiv{
		width:500px; height:200px;
		background-color:white;
		top:20%; left:30%;
		padding:20px;
	}
	
	 #pageNumList>li, li{
		list-style:none;
		display:inline;
	} 
	
	input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
	}
	.page-link{
	float: right;
	}
	#replyContent,#rereplyContent{
	width:80%;height:60px;display:inline;
	}
	#replyBtn,#reReplyBtn{
	padding:15px;
	margin-top:12px;
	margin-right:55px;
	}
	#writer,#rewriter{
	width:150px;height:27px;margin-top:5%;
	}
</style>
<script>
var bnum = ${view.bnum};
var reReqPage = 1;
var login_id = "${user.username}";
var login_name = "${user.name}";

	$(function() {
		
		/* ajax 실행시마다 http header에 csrf 토큰 추가. */
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		
		//댓글 수정양식 숨기기
		$("#modifyDiv").hide();
		$("#reReplyForm").hide();
		
		//댓글 목록 가져오기
		//replyList();
		
		replyList(reReqPage);
		
		//댓글 작성 클릭시 수행로직
		$("#replyBtn").click(function() {
			var writer = $("#writer").val();
			var replyContent = $("#replyContent").val();
			var contact = new Object();
			contact.bnum = bnum;
			contact.rid = login_id;
			contact.rname = writer;
			contact.rcontent = replyContent;
				$.ajax({
				type : "POST",
				url : "/rbbs/write",
				dataType : "text",
		        contentType:'application/json; charset=utf-8',
				data:JSON.stringify(contact),
				success : function(result) {
					replyList(reReqPage);
				},
				error : function(e) {
					console.log("실패" + e)
				}
			});
		});
		
		//댓글 수정 창 보이기, 댓글 목록 처리
		$("#reply").on("click", ".reList #b1", function() {
			var li = $(this).parent();
			var rnum = li.attr("data-rnum");
			var reContent = li.attr("data-rcontent");

			$(".title-dialog").html(rnum);
			$("#reContent").val(reContent);
			$("#replyForm").hide();
			$("#reReplyForm").hide();
			$("#modifyDiv").show("slow");
		});
		
		//대댓글창 보이기
		$("#reply").on("click",".reList #b2",function() {
			var li = $(this).parent();
			var rnum = li.attr("data-rnum");
			$(".title-dialog").html(rnum);
			console.log("알넘"+rnum);
			$("#replyForm").hide();
			$("#modifyDiv").hide();
			$("#reReplyForm").show();
			
			//대댓글 작성
			$("#reReplyBtn").click(function() {
				
				console.log("rnum : "+rnum);
				var rewriter = $("#rewriter").val();
				console.log("대댓 작성자 : "+rewriter);
				var rereplyContent = $("#rereplyContent").val();
				console.log("대댓글 내용 : "+rereplyContent);
				var contact = new Object();
				contact.rnum = rnum;
				contact.rid = login_id;
				contact.rname = rewriter;
				contact.rcontent = rereplyContent;
				console.log(contact);
					$.ajax({
					type : "POST",
					url : "/rbbs/rereply",
					dataType : "text",
					contentType:'application/json; charset=utf-8',
					headers:{
			               "context-Type" : "application/json",
			               "X-HTTP-Method-Override" : "POST"
			        },
					data:JSON.stringify(contact),
					success : function(result) {
						alert("대댓글등록성공");
						replyList(reReqPage);
					},
					error : function(e) {
						console.log("실패" + e);
					}
				});
			});
		}); 
		
		//댓글 수정
		$("#reModifyBtn").click(function() {
			var rnum = $(".title-dialog").html();
			var rContent = $("#reContent").val();
			$.ajax({
				type : "PUT",
				url : "/rbbs/modify",
				dataType : "text",
				contentType:'application/json; charset=utf-8',
				headers:{
		               "context-Type" : "application/json",
		               "X-HTTP-Method-Override" : "PUT"
		        },
				data:JSON.stringify({
					rnum : rnum,
					rcontent : rContent
				}),
				success : function(result) {
					alert("수정완료.");
					$("#modifyDiv").hide();
					$("#replyForm").show();
					replyList(reReqPage);
				},
				error : function(e) {
					console.log("실패" + e)
				}
			});
		});
		
		// 댓글 수정창 닫기
		$("#closeBtn").click(function() {
			$("#modifyDiv").hide();
			$("#replyForm").show();
		});
		
		//댓글 삭제
		$("#reDelBtn").on("click", function() {
			alert("삭제");
			var rnum = $(".title-dialog").html();

			$.ajax({
				type : 'DELETE',
				url : "/rbbs/delete/"+rnum,
				dataType : "text",
				headers:{
		               "context-Type" : "application/json",
		               "X-HTTP-Method-Override" : "DELETE"
		        },
				data:JSON.stringify({
					rnum : rnum,
				}),
				success : function(result) {
					console.log("성공")
					replyList(reReqPage);
				},
				error : function(e) {
					console.log("실패" + e)
				}
			});
		});
		
		//페이지 번호 클릭시 이벤트 처리
		$("#pageNumList").on("click","a ",function(evt){
			evt.preventDefault();
			reqPage = $(this).attr("href");
			replyList(reqPage);
		});
		
		//좋아요
		$("#reply").on("click","#goodBtn",function() {
			var li = $(this).parent();
			var rnum = li.attr("data-rnum");
			var date = li.attr("data-rcdate")
			$.ajax({
				type : "PUT",
				url : "/rbbs/good/"+rnum,
				dataType : "text",
				contentType:'application/json; charset=utf-8',
				headers:{
		               "context-Type" : "application/json",
		               "X-HTTP-Method-Override" : "PUT"
		        },
				data:JSON.stringify({
					rnum : rnum,
					goodOrBad : "good"
				}),
				success : function(result) {
					replyList(reReqPage);
				},
				error : function(e) {
					console.log("실패" + e)
				}
			});
		});
		
		//나빠요
		$("#reply").on("click","#badBtn",function() {
			var li = $(this).parent();
			var rnum = li.attr("data-rnum");
			$.ajax({
				type : "PUT",
				url : "/rbbs/bad/"+rnum,
				dataType : "text",
				contentType:'application/json; charset=utf-8',
				headers:{
		               "context-Type" : "application/json",
		               "X-HTTP-Method-Override" : "PUT"
		        },
				data:JSON.stringify({
					rnum : rnum,
					goodOrBad : "bad"
				}),
				success : function(result) {
					replyList(reReqPage);
				},
				error : function(e) {
					console.log("실패" + e)
				}
			});
		});
	});
	
	//요청 댓글 목록 가져오기
	function replyList(reReqPage) {
		var str = "";
		$.ajax({
			type : "GET",
			url : "/rbbs/map/" + bnum + "/" + reReqPage,
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				console.log(data.item);
				console.log(data.pageCriteria);
				$.each(data.item, function(idx, rec) {
					console.log(rec.rcdate);
					console.log(rec.bnum);
					console.log(rec.rnum);
					var rindent = rec.rindent * 50;
					var sysdate = new Date(rec.rcdate);
					var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
					console.log("indent : "+rec.rindent+" ,rindent : "+rindent);
					if (rec.RINDENT==0){
						$("#b3").hide();
					}
					if (rec.rnum != null){
					str += "<div class=\"card\" style=\"margin-left:" + rindent + "px; width:50%; margin-top:10px; margin-bottom:10px;\">"
					+ "<div class=\"card-body\">"
					+ "<span><li data-rnum='" + rec.rnum + "' data-rContent='" + rec.rcontent + "' class = 'reList'></span>"
					+ "<img src=\"/images/img_avatar1.png\" alt=\"John Doe\" class=\"mr-3 mt-3 rounded-circle\" style=\"width:60px;\">"
					+ "<h4>" + rec.rname + "  "
					+ "<small><i>"+sysdate.toLocaleString('ko-KR') + "</i></small></h4>"
					+ "<p>"+rec.rcontent + "</p>"
					+ "<button id=\"goodBtn\" style=\"background-color:white;color:#007BFF;margin-right:5px; \"; class=\"btn btn-primary\">"
					+ "<i class=\"fa fa-thumbs-o-up\"></i>"+" "+rec.rgood+"</button>"
					+ "<button id=\"badBtn\" style=\"background-color:white;color:#007BFF;margin-right:5px;\"; class=\"btn btn-primary\">"
					+ "<i class=\"fa fa-thumbs-o-down\"></i>"+" "+rec.rbad+"</button>"
					<c:if test="${user.username eq view.bid }">
					+ "<button id='b1' class=\"btn btn-primary\" style=\"background-color:#007BFF;color:white;float:right;border:0 \">수정</button>"
					</c:if>
					+ "<button id='b2' class=\"btn btn-primary\" style=\"background-color:#007BFF;color:white;float:right;border:0 \">댓글</button>"
					+ "</li></div></div>";}
					else {
						"댓글이 없습니다."
					}
					
				});
				$("#reply").html(str);
				//페이지 리스트 호출
				showPageList(data.pageCriteria);
				
			},
			error : function(error) {
				console.log("실패" + error);
			}
		});
	}

	// 페이지 리스트
	function showPageList(pageCriteria) {
		console.log(pageCriteria);
		reReqPage = pageCriteria.recordCriteria.reqPage;
		var str = "";
		// 이전표시
		if (pageCriteria.prev) {
		// 처음
		str += "<li><a class=\"page-link\" href='1'>◀</a></li>";
		// 이전
		str += "<li><a class=\"page-link\" href='" + (pageCriteria.startPage - 1) + "'>" + "◁</a></li>";
		}
		
		for (var i = pageCriteria.startPage, end = pageCriteria.endPage; i <= end; i++) {
			str += "<li><a class=\"page-link\" href='" + i + "'>" + i + "</a></li>";
		}
		// 다음표시
		if (pageCriteria.next) {
		// 다음
		str += "<li><a class=\"page-link\" href='" + (pageCriteria.endPage + 1) + "'>" + "▷</a></li>";
		// 마지막
		str += "<li><a class=\"page-link\" href='" + (pageCriteria.finalEndPage) + "'>" + "▶</a></li>";
		}
		
		$("#pageNumList").html(str); 
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
 <hr />
 <div style="height: 480px; max-width:100%; overflow-y: auto; margin-bottom:10px;">
 <h2>댓글</h2>
<div id="replyForm">
작성자 : <input type="text" id="writer"placeholder="작성자" value="${user.name }"/> <br />
<p><textarea  id="replyContent" placeholder="댓글 내용"></textarea>
<button id="replyBtn" class="page-link">댓글작성</button></p>
</div>
<div id="reReplyForm">
#<span class="title-dialog"></span>번 대댓글/
작성자 : <input type="text" id="rewriter" placeholder="대댓작성자" value="${user.name }"/> <br />
<p><textarea  id="rereplyContent" placeholder="대댓글 내용"></textarea>
<button id="reReplyBtn" class="page-link">대댓글작성</button></p>
</div>
<br />
<div class="container" id="modifyDiv">
#<span class="title-dialog"></span>번
	<div class="container">
		<textarea id="reContent" cols="30" rows="3"></textarea>
	</div>
	<div class="pagination" style="float:right;">
		<button id="reModifyBtn" class="page-link">수정</button>
		<button id="reDelBtn" class="page-link">삭제</button>
		<button id="closeBtn" class="page-link">닫기</button>
	</div>
</div>
<div id="reDiv" class="w3-container">
		<h2>댓글리스트</h2>
	
		<ul id="reply" class="w3-ul w3-hoverable">
		</ul>
	
		<ul id="pageNumList" class="pagination" style="float:right">
		</ul>
</div>
</div>
</body>
</html>