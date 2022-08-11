<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="../include/nav.jsp"%>
	<p>${staff.staff_id}님 환영합니다.<br><a href="../main/logout">로그아웃</a></p>
	<p><a href="../finance/finance_list">재정 관리</a></p>
	<p><a href="../staff/staff_list">교직원 관리</a></p>
	<p><a href="../equipment/equipment_list">시설 관리</a></p>
	<p><a href="../meal/meal_list">식단 관리</a></p>
	<p><a href="../board/board_list">전자결재</a></p>
	<p><a href="../kinder/kinder_list">원생 관리</a></p>
	<p><a href="../bus/shuttle_bus">셔틀버스 관리</a>
</body>
</html>