<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	 #pageNumList>li{
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
	


</style>
<script>
var bnum = ${view.getBnum() };
var reReqPage = 1;
	$(function() {
		//댓글 수정양식 숨기기
		$("#modifyDiv").hide();
		$("#reReplyForm").hide();
		
		//댓글 목록 가져오기
		//replyList();
		
		replyList(reReqPage);
		
		//댓글 수정 창 보이기, 댓글 목록 처리
				$("#reply").on("click", ".reList #b1", function() {
					var li = $(this).parent();
					var rnum = li.attr("data-rnum");
					var reContent = li.attr("data-rContent");

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

					$("#replyForm").hide();
					$("#modifyDiv").hide();
					$("#reReplyForm").show("slow");
					
					//대댓글 작성 클릭시 수행로직
					$("#reReplyBtn").click(function() {
						
						var rewriter = $("#rewriter").val();
						var rereplyContent = $("#rereplyContent").val();
						alert(rnum);
							$.ajax({
							type : "POST",
							url : "/bbs/reReply",
							dataType : "text",
							data : {
								rnum : rnum,
								rName : rewriter,
								rContent : rereplyContent
							},
							success : function(result) {
								alert("대댓글등록성공");
								replyList(reReqPage);
							},
							error : function(e) {
								console.log("실패" + e)
							}
						});
					});
				});
				
				//댓글 작성 클릭시 수행로직
				$("#replyBtn").click(function() {
					var writer = $("#writer").val();
					var replyContent = $("#replyContent").val();
						$.ajax({
						type : "POST",
						url : "/bbs/write",
						dataType : "text",
						data : {
							bnum : bnum,
							rName : writer,
							rContent : replyContent
						},
						success : function(result) {
							alert("댓글등록성공");
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
				});
				
				
				//댓글 수정
				$("#reModifyBtn").click(function() {
					alert("수정");
					var rnum = $(".title-dialog").html();
					var rContent = $("#reContent").val();
					$.ajax({
						type : 'POST',
						url : "/bbs/modify",
						dataType : "text",
						data : {
							rnum : rnum,
							rContent : rContent
						},
						success : function(result) {
							alert("수정 완료");
							replyList(reReqPage);
						},
						error : function(e) {
							console.log("실패" + e)
						}
					});
				});
				
				//댓글 삭제
				$("#reDelBtn").on("click", function() {
					alert("삭제");
					var rnum = $(".title-dialog").html();

					$.ajax({
						type : 'POST',
						url : "/bbs/delete",
						dataType : "text",
						data : {
							rnum : rnum,
						},
						success : function(result) {
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
					alert("조아");
					var li = $(this).parent();
					var rnum = li.attr("data-rnum");
					$.ajax({
						type : "POST",
						url : "/bbs/good",
						dataType : "text",
						data : {
							rnum : rnum,
							goodOrBad : "good"
						},
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
					alert("나빠");
					var li = $(this).parent();
					var rnum = li.attr("data-rnum");
					$.ajax({
						type : "POST",
						url : "/bbs/bad",
						dataType : "text",
						data : {
							rnum : rnum,
							goodOrBad : "bad"
						},
						success : function(result) {
							replyList(reReqPage);
						},
						error : function(e) {
							console.log("실패" + e)
						}
					});
				});
				
				//요청 댓글 목록 가져오기
				function replyList(reReqPage) {
					var str = "";
					$.ajax({
						type : "GET",
						url : "/bbs/list?bnum=" + bnum + "&reReqPage=" + reReqPage,
						dataType : "json",
						success : function(data) {
							console.log(data);
							console.log(data.result);
							console.log(data.pageCriteria);
							$.each(data.result, function(idx, rec) {
								console.log(rec);
								console.log(rec.rnum);
								var rindent = rec.RINDENT * 50;
								if (rec.RINDENT==0){
									$("#b3").hide();
								}
								str += "<div style=\"margin-left:"+rindent+"px\">"
								+ "<span><li data-rnum='" + rec.rnum + "' data-rContent='" + rec.RCONTENT + "' class = 'reList'></span>"
								+ "<img src=\"/SpringEdu/src/main/webapp/images/img_avatar1.png" alt=\"John Doe\" class=\"mr-3 mt-3 rounded-circle\" style=\"width:60px;\">"
								+ "<h4>" + rec.RNAME + "  "
								+ "<small><i>"+rec.RCDATE + "</i></small></h4>"
								+ "<p>"+rec.RCONTENT + "</p>"
								+ "<button id=\"goodBtn\" style=\"background-color:white;color:#007BFF;margin-right:5px; \"; class=\"btn btn-primary\">"
								+ "<i class=\"fa fa-thumbs-o-up\"></i>"+" "+rec.RGOOD+"</button>"
								+ "<button id=\"badBtn\" style=\"background-color:white;color:#007BFF;margin-right:5px;\"; class=\"btn btn-primary\">"
								+ "<i class=\"fa fa-thumbs-o-down\"></i>"+" "+rec.RBAD+"</button>"
								+ "<button id='b1' class=\"btn btn-primary\" style=\"background-color:#007BFF;color:white;float:right;border:0 \">수정</button>"
								+ "<button id='b2' class=\"btn btn-primary\" style=\"background-color:#007BFF;color:white;float:right;border:0 \">댓글</button>"
								+ "</li></div>";
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
	});
</script>
<title>Insert title here</title>
</head>
<body>
 <hr />
 <div style="height: 444px; max-width:100%; overflow-y: auto; margin-bottom:10px;">
 <h2>댓글</h2>
<div id="replyForm">
<input type="text" id="writer" style="width:100px;height:27px;" placeholder="작성자" value="${user.name }" readOnly/> <br />
<p><textarea  id="replyContent" style="width:90%;height:151px" placeholder="댓글 내용"></textarea>
<button id="replyBtn" class="page-link" style="margin-top:11%">댓글작성</button></p>
</div>
<div id="reReplyForm">
<input type="text" id="rewriter" style="width:100px;height:27px;margin-top:5%" placeholder="대댓작성자"/> <br />
<p><textarea  id="rereplyContent" style="width:90%;height:151px" placeholder="대댓글 내용"></textarea>
<button id="reReplyBtn" class="page-link" style="margin-top:11%">대댓글작성</button></p>
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
	<p>
		<ul id="reply" class="w3-ul w3-hoverable">
		</ul>
	</p>
		<ul id="pageNumList" class="pagination" style="float:right">
		</ul>
</div>
</div>
</body>
</html>