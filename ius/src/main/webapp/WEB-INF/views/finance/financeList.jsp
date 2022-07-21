<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재정 관리</title>
</head>
<body>
	<h1>재정 관리</h1>
	<input type="button" value="홈으로" onclick="location.href='../index'">
	<input type="button" value="예산 항목" onclick="location.href='../budget/budget_list'">
	<input type="button" value="수입 등록" onclick="location.href='../finance/finance_register_form?iE=In'">
	<input type="button" value="지출 등록" onclick="location.href='../finance/finance_register_form?iE=Ex'">
	<table border="1">
		<tr>
			<th>총 수입</th>
			<th>총 지출</th>
			<th>잔고</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<c:if test="${financeList != null}">
		<table border="1">
				<tr>
					<th>재정 코드</th>
					<th>예산 항목</th>
					<th>교직원명</th>
					<th>집행 날짜</th>
					<th>항목</th>
					<th>구분</th>
					<th>집행 금액</th>
				</tr>
		<c:forEach items="${financeList}" var="finance">
				<tr>
					<td>${finance.finance_num}</td>
					<td>${finance.budget_cls}</td>
					<td>${finance.staff_name}</td>
					<td>${finance.finance_eDate}</td>
					<td>
						<a href="../finance/finance_info?finance_num=${finance.finance_num}">${finance.finance_cls}</a>
					</td>
					<td>
						<c:if test="${finance.finance_iE == 'In'}">
							수입
						</c:if>
						<c:if test="${finance.finance_iE == 'Ex'}">
							지출
						</c:if>
					</td>
					<td>
						<fmt:formatNumber value="${finance.finance_amount}" maxFractionDigits="3"/>
					</td>
				</tr>
		</c:forEach>
		</table>
	</c:if>

</body>
</html>