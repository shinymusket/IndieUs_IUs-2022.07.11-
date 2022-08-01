<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설(비품) 정보</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>

	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>시설(비품) 정보</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<input type="button" value="목록으로" onclick="location.href='../equipment/equipment_list'">
					<table border="1">
						<tr>
							<th colspan="2">시설(비품) 자산 코드</th>
							<td colspan="2">${equipment.equipment_num}</td>
						</tr>
						<tr>
							<th>등록자</th>
							<td>${equipment.staff_name}</td>
							<th>분류항목</th>
							<td>${equipment.equip_cls_name}</td>
						</tr>
						<tr>
							<th>시설(비품) 명</th>
							<td>${equipment.equipment_name}</td>
							<th>수량</th>
							<td>${equipment.equipment_count}</td>
						</tr>
						<tr>
							<th colspan="2">등록 날짜</th>
							<td colspan="2">${equipment.equipment_regdate}</td>
						</tr>
						<c:if test="${equipment.equipment_cate eq '구매품'}">
							<tr>
								<td colspan="4">구매품</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="4">
								<input type="button" value="수정" onclick="location.href='../equipment/equipment_update?equipment_num=${equipment.equipment_num}'">
								<input type="button" value="삭제" onclick="location.href='../equipment/equipment_delete?equipment_num=${equipment.equipment_num}'">
							</td>
						</tr>
					</table>
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>	
</body>
</html>