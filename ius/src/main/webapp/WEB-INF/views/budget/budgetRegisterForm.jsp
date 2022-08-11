<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/resources/js/budget/budgetRegisterForm.js"></script>
<title>예산 등록</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<link type="text/css" rel="stylesheet" href="${path}/resources/css/budget/budgetRegisterForm.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	
	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>예산 등록</h3>
			</div>

			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<input type="button" value="목록" onclick="location.href='../budget/budget_list'">
					<form action="./budget_register" method="POST" name="frm">
						<table border="1">
							<tr>
								<th>예산 년도</th>
								<th>구분</th>
								<th>항목 명</th> <!-- 최대 8자 -->
								<th>총 금액</th>
							</tr>
							<tr>
								<td>
									<input type="number" name="budget_year" id="budget_year" min="2022" value="2022">
								</td>
								<td>
									<select name="budget_iE" id="budget_iE">
										<option value="">-선택-</option>
										<option value="In">수입</option>
										<option value="Ex">지출</option>
									</select>
								</td>
								<td>
									<input type="text" name="budget_cls" id="budget_cls">
								</td>
								<td>
									<input type="text" name="budget_total" id="budget_total">
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input type="button" value="등록" id="register">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
	</article>	
	
<%@include file="../include/footer.jsp" %>	
</body>
</html>