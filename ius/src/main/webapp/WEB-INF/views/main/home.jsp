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
</head>
<style>
	.mainDiv {
		border : 1px solid;
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
	
</style>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>

	<article>
			<div id="title_bar">
				<h3>식단 관리</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<div class="mainDiv" id="notice">
						<h1 class="title">공지사항</h1>
					</div>
					<div class="mainDiv" id="event">
						<h1 class="title">오늘의 일정</h1>
					</div>
					<div class="mainDiv" id="eWorks">
						<h1 class="title">전자결재</h1>
					</div>
					<div class="mainDiv" id="meal">
						<h1 class="title">오늘 식단</h1>	
					</div>	
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>
</body>
</html>