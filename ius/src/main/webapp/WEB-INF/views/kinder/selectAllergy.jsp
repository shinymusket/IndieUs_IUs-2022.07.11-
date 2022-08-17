<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알러지 정보 입력</title>
<link rel="stylesheet" href="${path}/resources/css/allergy.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/resources/js/kinder/selectAllergy.js"></script>
</head>
<body>
<input type="hidden" value="<c:if test="${allergy_code != 0}">${allergy_code}</c:if>" id="allergy_code">
<form name="allergy">
	<div id="allergy_box">
		<ul>
			<li>
				<label for="na"><input type="checkbox" id="na">알러지 없음</label>
			</li>
			<li>
				<label for="a1"><input type="checkbox" id="a1">난류(가금류)</label>
			</li>
			<li>
				<label for="a2"><input type="checkbox" id="a2">우유</label>
			</li>
			<li>
				<label for="a3"><input type="checkbox" id="a3">메밀</label>
			</li>
			<li>
				<label for="a4"><input type="checkbox" id="a4">땅콩</label>
			</li>
			<li>
				<label for="a5"><input type="checkbox" id="a5">대두</label>
			</li>
			<li>
				<label for="a6"><input type="checkbox" id="a6">밀</label>
			</li>
			<li>
				<label for="a7"><input type="checkbox" id="a7">고등어</label>
			</li>
			<li>
				<label for="a8"><input type="checkbox" id="a8">게</label>
			</li>
			<li>
				<label for="a9"><input type="checkbox" id="a9">새우</label>
			</li>
			<li>
				<label for="a10"><input type="checkbox" id="a10">돼지고기</label>
			</li>
			<li>
				<label for="a11"><input type="checkbox" id="a11">복숭아</label>
			</li>
			<li>
				<label for="a12"><input type="checkbox" id="a12">토마토</label>
			</li>
			<li>
				<label for="a13"><input type="checkbox" id="a13">아황산염</label>
			</li>
			<li>
				<label for="a14"><input type="checkbox" id="a14">호두</label>
			</li>
			<li>
				<label for="a15"><input type="checkbox" id="a15">닭고기</label>
			</li>
			<li>
				<label for="a16"><input type="checkbox" id="a16">쇠고기</label>
			</li>
			<li>
				<label for="a17"><input type="checkbox" id="a17">오징어</label>
			</li>
			<li>
				<label for="a18"><input type="checkbox" id="a18">조개류</label>
			</li>
		</ul>
		<div id="but_box">
			<input type="button" value="확인" id="register">
		</div>
	</div>
</form>
</body>
</html>