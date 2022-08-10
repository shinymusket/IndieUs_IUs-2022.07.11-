<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css?">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function getInfo() {
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();
		let day = today.getDay();
		
		var today_date = year + "/" + month + "/" + date;
		
		$.ajax({
			url : "/ius/main/get_Info",
			type : "POST",
			data : {
				today_date : today_date
			},
			success : function(data) {
				$("#titleTbl").text("");
				values = data.noticeList;
				output = "";
				$.each(values, function(index, value) {
					
					output += "<tr>";
					output += "<td id='notice_title_td'><a href='../notice/notice_info?notice_num=" + value.notice_num + "'>" + value.notice_title + "</a></td>";
					output += "<td id='notice_writeDate'>" + value.notice_writeDate + "</td>";
					output += "</tr>";
				});
				$("#titleTbl").html(output);
				
			}
		});
		
		
		
		
		
		
	}

	getInfo();
</script>
</head>
<style>
	.mainDiv {
		border : 3px solid #cfd8dc;
		width : 700px;
		height : 300px;
		float : left;
		margin : 10px; 
	}
	
	.mainDiv h1.title {
		text-align : center;
		line-height : 1.5;
		width : 100%;
		height : 30px;
		color : white;
		background-color : #486890;
	}
	
	.mainDiv h1.title:hover {
		color : blue;;
	}
	
	.contentDiv {
		margin : 30px 15px;
	}
	
	#titleTbl {
		width : 660px;
	}
	
	#titleTbl #notice_writeDate {
		text-align : right;
	}
	
	#titleTbl #notice_title_td a:hover {
		text-decoration: underline;
	}
</style>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>

	<article>
			<div id="title_bar">
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<div class="mainDiv" id="notice">
						<a href="../notice/notice_list"><h1 class="title">공지사항</h1></a>
						<div class="contentDiv">
							<table id="titleTbl">
								<%-- <c:if test="${noticeList != null}">
									<c:forEach items="${noticeList}" var="notice">
										<tr>
											<td id="notice_title_td">
												<a href="../notice/notice_info?notice_num=${notice.notice_num}">${notice.notice_title}</a>
											</td>
											<td id="notice_writeDate">
												${notice.notice_writeDate}
											</td>
										</tr>
									</c:forEach>
								</c:if> --%>
							</table>
						</div>
					</div>
					<div class="mainDiv" id="event">
						<a href="../event/event_list"><h1 class="title">오늘의 일정</h1></a>
						<div class="contentDiv">
							<input type="hidden" value="${now}" id="todayDate">
						</div> 
					</div>
					<div class="mainDiv" id="eWorks">
						<a href="#"><h1 class="title">전자결재</h1></a>
						<div class="contentDiv">
						</div>
					</div>
					<div class="mainDiv" id="meal">
						<a href="../meal/meal_list"><h1 class="title">오늘 식단</h1></a>
						<div class="contentDiv">
						</div>
					</div>	
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>
</body>
</html>