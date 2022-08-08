<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재정 상세 보기</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 $(function(){
	 $("#update").click(function(){ // 수정 요청시
		var log_staff_num = $("#log_staff_num").val();
	 	
		 
		 
		var finance_num = $("#finance_num").val();
			 
	 	// 본인이 작성한 데이터인지 확인
	 
	 
	 
	 
	 
	 
	 
	 
	 
		 location.href="../finance/finance_update_form?finance_num=" + finance_num;
	 });
 })
</script>
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>

	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>재정 상세 보기</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
						<input type="button" value="목록" onclick="location.href='../finance/finance_list'">
						<input type="button" value="수정" id="update" onclick="location.href=''">
						<input type="button" value="삭제" id="delete" onclick="location.href='../finance/finance_delete?finance_num=${finance.finance_num}'">
						
						<table border="1">
							<tr>
								<th>재정 코드</th>
								<td>
									<input type="hidden" id="log_staff_num" value="${log_staff_num}">
									<input type="text" readonly="readonly" id="finance_num" value="${finance.finance_num}">
								</td>
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
							
							<c:if test="${purchaseList != null}">
								<h3>재정 사용 내역</h3>
								<table border="1">
								
								<tr>
									<th>구매 번호</th>
									<th>구매자</th>
									<th>구매 자산명</th>
									<th>구매 일자</th>
									<th>구매 가격</th>
									<th>구매 수량</th>
								</tr>
								
								<c:forEach items="${purchaseList}" var="purchase">
									<tr>
										<td>${purchase.purchase_num}</td>
										<td>${purchase.staff_name}</td>
										<td>${purchase.equipment_name}</td>
										<td>${purchase.purchase_date}</td>
										<td>
											<fmt:formatNumber value="${purchase.purchase_price}" maxFractionDigits="3"/>원
										</td>
										<td>${purchase.purchase_count}</td>
									</tr>
								</c:forEach>
								</table>
								
								<table border="1">
									<tr>
										<th>총액</th>
										<th>지출액</th>
										<th>잔액</th>		
									</tr>
									<tr>
										<td>
											<fmt:formatNumber value="${finance.finance_amount}" maxFractionDigits="3"/>원
										</td>
										<td>
											<fmt:formatNumber value="${purchaseSum}" maxFractionDigits="3"/>원
										</td>
										<td>
											<fmt:formatNumber value="${finance.finance_amount - purchaseSum}" maxFractionDigits="3"/>원
										</td>
									</tr>
								</table>	
							</c:if>
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>
</body>
</html>