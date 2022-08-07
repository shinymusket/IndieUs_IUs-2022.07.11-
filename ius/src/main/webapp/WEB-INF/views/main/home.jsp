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
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
<!--
	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>식단 관리</h3>
			</div>
	
			
			<div id="title_top">
				<input type="text" name=""> <input type="button" value="검색">
				<input type="button" value="등록"> <input type="button"
					value="삭제">
			</div>
	
			<section>
				<div id="content">
					
				</div>
			</section>
	</article>	
-->	 
<%@include file="../include/footer.jsp" %>
</body>
</html>