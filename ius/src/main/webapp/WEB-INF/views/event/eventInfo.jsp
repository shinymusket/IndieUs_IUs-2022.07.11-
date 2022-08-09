<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행사 및 일정 보기</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css?">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function event(event_num) { // 삭제나 수정을 위한 행사 정보 가져오기
		var event_num = event_num;
		$("#event_num").val(event_num);
		
		$.ajax({
			url : "/ius/event/get_event_name_by_num",
			type : "POST",
			data : {
				event_num : event_num
			},
			success: function(data) {
				$("#event_name").val("");
				$("#event_name").val(data.event_name);
			}
			
		})
	
	};
	
$(function(){
	$("#delete").click(function(){ // 삭제시
		var event_num = $("#event_num").val();
		var event_date = $("#event_date").val();
	
		if (event_num == "") {
			alert("삭제할 데이터를 먼저 클릭하세요.");
			return;
		} else {
			var input = confirm("정말 삭제하시겠습니까?");
			if (input === true) {
			
				$.ajax({
					url : "/ius/event/delete_event_by_num",
					type : "POST",
					data : {
						event_num : event_num
					},
					success: function(data) {
						alert("삭제되었습니다.");
						$("#event_num").val("");
						$("#event_name").val("");
						location.href="../event/event_select_by_event_date?event_date=" + event_date;	
					}
					
				})
			}
			
		}
		
	});
	
	$("#update").click(function(){ // 수정시
		var event_num = $("#event_num").val();
		var event_name = $("#event_name").val();
		var event_date = $("#event_date").val();
	
		if (event_num == "") {
			alert("수정할 데이터를 먼저 클릭하세요.");
			return;
		} else {
			var input = confirm("정말 수정하시겠습니까?");
			if (input === true) {
			
				$.ajax({
					url : "/ius/event/update_event_by_num",
					type : "POST",
					data : {
						event_num : event_num,
						event_name : event_name
						
					},
					success: function(data) {
						alert("수정되었습니다.");
						$("#event_num").val("");
						$("#event_name").val("");
						location.href="../event/event_select_by_event_date?event_date=" + event_date;	
					}
					
				})
			}
			
		}
		
	});
	
})	
	







</script>
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>

	<article>
			<div id="title_bar">
				<p>행사 및 일정</p>
				<h3>행사 및 일정 보기</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<table border="1">
						<tr>
							<th>날짜</th>
						</tr>
						<tr>
							<td>
								<input type="date" value="${event_date}" readonly="readonly" id="event_date">
							</td>
						</tr>
						<c:if test="${eventList != null}">
							<tr>
								<th>행사 명</th>
							</tr>
							<c:forEach items="${eventList}" var="event" varStatus="status">
							<tr>
								<td>
									<a href="javascript:event(${event.event_num})">${event.event_name}</a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td>
								<input type="hidden" id="event_num">
								<input type="text" id="event_name">
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="button" value="수정" id="update">
								<input type="button" value="삭제" id="delete">
								<input type="button" value="목록으로 돌아가기" onclick="location.href='../event/event_list'">
							</td>
						</tr>
					</table>
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>
</body>
</html>