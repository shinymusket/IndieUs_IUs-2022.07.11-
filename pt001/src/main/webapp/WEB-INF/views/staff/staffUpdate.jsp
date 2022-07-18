<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 정보 수정</title>
</head>
<body>
	<h1>교직원 정보 수정</h1>
	<input type="button" value="홈으로" onclick="location.href='../index'">
	<input type="button" value="목록으로" onclick="location.href='./staff_list'">
	<form action="./staff_update" method="POST">
		<table border="1">
			<tr>
				<th>교직원 코드</th>
				<td>
					<input type="text" name="staff_num" id="staff_num" value="${staff.staff_num}" readonly="readonly">
				</td>
				<th>구분</th>
				<td>
					<select name="staff_cls" id="staff_cls">
						<c:forEach items="${jobList}" var="job" >
							<c:if test="${staff.staff_cls == job.staff_cls}">
								<option value="${job.staff_cls}" selected="selected">${job.job_Kname}</option>					
							</c:if>
							<c:if test="${staff.staff_cls != job.staff_cls}">
								<option value="${job.staff_cls}">${job.job_Kname}</option>
							</c:if>
						</c:forEach>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="staff_id" id="staff_id" value="${staff.staff_id}">
				</td>
				<th>이름</th>
				<td>
					<input type="text" name="staff_name" id="staff_name" value="${staff.staff_name}"> 
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td>
					<input type="text" name="staff_rrn1" id="staff_rrn1" value="${staff.staff_rrn1}">
					-
					<input type="text" name="staff_rrn2" id="staff_rrn2" value="${staff.staff_rrn2}">
				</td>
				<th>주소</th>
				<td>
					<input type="text" name="staff_addr" id="staff_addr" value="${staff.staff_addr}">
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="staff_zipcode" id="staff_zipcode" value="${staff.staff_zipcode}">
				</td>
				<th>연락처</th>
				<td>
					<input type="tel" name="staff_tel" id="staff_tel" value="${staff.staff_tel}">
				</td>
			</tr>
			<tr>
				<th>입사일</th>
				<td>
					<input type="text" name="staff_hireD" id="staff_hireD" value="${staff.staff_hireD}">
				</td>
				<th>퇴사일</th>
				<td>
					<input type="text" name="staff_retireD" id="staff_retireD" value="${staff.staff_retireD}">
				</td>
			</tr>
			<tr>
				<th>재직여부</th>
				<td>
					<c:if test="${staff.staff_workYn == 'Y'}">
						<select name="staff_workYn" id="staff_workYn">
							<option value="Y" selected="selected">재직</option>
							<option value="N">퇴사</option>
						</select>
					</c:if>
					
					<c:if test="${staff.staff_workYn == 'N'}">
						<select name="staff_workYn" id="staff_workYn">
							<option value="Y">재직</option>
							<option value="N" selected="selected">퇴사</option>
						</select>
					</c:if>	
				</td>
				<th>월급</th>
				<td>
					<input type="number" name="staff_salary" id="staff_salary" value="${staff.staff_salary}"> 
				</td>
			</tr>
			<tr>
				<th colspan="2">이메일</th>
				<td colspan="2">
					<input type="email" name="staff_email" id="staff_email" value="${staff.staff_email}">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="수정"> <!-- 추후 유효성 검사 구현 / 그런데 유효성 검사가 꼭 필요할지? 주민등록번호 입력값 유효성 검사가 꼭 필요해보인다.-->
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>