<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재정 상세 보기</title>
</head>
<body>
	<h1>재정 상세 보기</h1>
	<input type="button" value="목록" onclick="location.href='../finance/finance_list'">
	<input type="button" value="수정" onclick="location.href='../finance/finance_update_form?finance_num=${finance.finance_num}'">
	<input type="button" value="삭제" onclick="location.href='../finance/finance_delete?finance_num=${finance.finance_num}'">
	<table border="1">
		<tr>
			<th>재정 코드</th>
			<td>${finance.finance_num}</td>
			<th>예산 항목</th>
			<td>${finance.budget_cls}</td>
		</tr>
		<tr>
			<th>[직원 코드]교직원명</th>
			<td>${finance.staff_name}</td>
			<th>집행 날짜</th>
			<td>${finance.finance_eDate}</td>
		</tr>
		<tr>
			<th>항목</th>
			<td>${finance.finance_cls}</td>
			<th>구분</th>
			<td>
				<c:if test="${finance.finance_iE == 'In'}">
					수입				
				</c:if>
				<c:if test="${finance.finance_iE == 'Ex'}">
					지출				
				</c:if>
			</td>
		</tr>
		<tr>
			<th colspan="2">집행 금액</th>
			<td colspan="2">
				<fmt:formatNumber value="${finance.finance_amount}" maxFractionDigits="3"/>원
			</td>
		</tr>
	</table>
	
</body>
</html>